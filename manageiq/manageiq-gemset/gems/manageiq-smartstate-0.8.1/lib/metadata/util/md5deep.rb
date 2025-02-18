require 'time'
require 'metadata/util/win32/peheader'
require 'metadata/util/win32/versioninfo'
require 'metadata/util/find_class_methods'
require 'util/miq-xml'
require 'ostruct'
require 'util/miq-encode'

class MD5deep
  attr_reader   :fullDirCount, :fullFileCount
  attr_accessor :versioninfo, :imports

  def initialize(fs = nil, options = {})
    @fullFileCount = 0
    @fullDirCount = 0
    @drive_letter = nil

    # Create XML document
    @xml = XmlHash.createDoc(:filesystem)
    @fs = fs.kind_of?(MiqFS) ? fs : nil

    # Read optional parameters if they exist in the options hash
    @opts = {'versioninfo' => true, 'imports' => true, 'contents' => false,
      'exclude' => ["pagefile.sys", "hiberfil.sys", ".", ".."],
      'digest' => ["md5"], "winVerList" => %w(.exe .dll .ocx .scr)
    }.merge(options)
    # Make sure md5 is part of our digest array
    @opts['digest'].push("md5") unless @opts['digest'].include?("md5")
    # Convert hash to an OpenStruct for cleaner referencing
    @opts = OpenStruct.new(@opts)

    # Conditionally load digest libraries as needed.
    @opts.digest.each do |h|
      begin
        require 'digest/' + h.downcase
      rescue LoadError
        # This load error is not a concern since the standard digests are already included
        # in ruby by default, and the non-standard ones will be loaded by their name above.
        # $log.debug "Unable to load module for [#{h}]"
      end
    end
  end

  def scan(path, rootID = "/")
    path = File.expand_path(path)
    rootID = rootID[2..-1] if rootID.length > 2 && rootID[1..1] == ":"
    xmlNode = @xml.root.add_element("dir", "name" => rootID)
    read_fs(path, xmlNode)
    @xml
  end

  def self.scan_glob(fs, filename, options = {})
    md5 = MD5deep.new(fs, options)
    md5.scan_glob(filename)
  end

  def scan_glob(filename)
    filename.tr!("\\", "/")
    startDir = File.dirname(filename)
    @xml.root.add_attribute("base_path", startDir)
    path_prefix = startDir[0, 2]
    @drive_letter = path_prefix.match?(/^\w\:/) ? path_prefix : ""

    # First check if we are passed a fully qualifed file name
    if @fs.fileExists?(filename)
      base_file = File.basename(filename)
      isDir?(filename) ? process_dir_as_file(startDir, base_file, @xml.root) : processFile(startDir, base_file, @xml.root)
    else
      # If the file is not found then process the data as a glob pattern.
      process_each_glob_file(filename)
    end
    @xml
  end

  def process_each_glob_file(file_name)
    FindClassMethods.glob(file_name, @fs) do |f|
      # Prepending @drive_letter to the file is a work-around for issues
      # when scanning Win VMs from Linux where the path returned from glob
      # does not include the drive letter.
      f = File.join(@drive_letter, f)
      processFile(File.dirname(f), File.basename(f), @xml.root)
    end
  rescue => err
    $log.error "process_each_glob_file: Exception #{err} rescued"
    $log.debug err.backtrace.join("\n")
  end

  def read_fs(path, xmlNode)
    @drive_letter = @drive_letter.nil? ? "" : @drive_letter
    if @fs
      @fs.dirForeach(path)  { |x| processFile(path, x, xmlNode) }
      @fs.dirForeach(path)  { |x| processDir(path,  x, xmlNode) }
    else
      Dir.foreach(path)     { |x| processFile(path, x, xmlNode) }
      Dir.foreach(path)     { |x| processDir(path,  x, xmlNode) }
    end

    # Add up all the sums for all sub-elements
    xmlNode.add_attributes(calculate_sums(xmlNode))
  end

  def processDir(path, x, xmlNode)
    if x != "." && x != ".."
      currFile = File.join(path, x)

      begin
        if File.directory?(currFile)
          @fullDirCount += 1
          # $log.debug "DIR : #{currFile}"
          xmlSubNode = xmlNode.add_element("dir", "name" => x, "fqname" => currFile)
          xmlSubNode.add_attributes({"atime" => File.atime(currFile).getutc.iso8601, "ctime" => File.ctime(currFile).getutc.iso8601, "mtime" => File.mtime(currFile).getutc.iso8601})
          read_fs(currFile, xmlSubNode)
        end
      rescue Errno::EACCES, RuntimeError
      end
    else
      @fullDirCount += 1
    end
  end

  def process_dir_as_file(path, x, xml_node)
    if x != "." && x != ".."
      curr_dir = File.join(path, x)
      if isDir?(curr_dir)
        xml_file_node = xml_node.add_element("file", "name" => x, "fqname" => curr_dir)
        stat_hash = {}
        stat_hash.merge!(get_dir_stats(curr_dir))
        xml_file_node.add_attributes(stat_hash)
      end
    end
  end

  def processFile(path, x, xmlNode)
    if (@opts.exclude.include?(x) == false) && x[0..0] != "$"
      currFile = File.join(path, x)

      begin
        #       unless File.directory?(currFile) then
        return if isDir?(currFile)

        # File we have an exclusion list and the current file is in it, skip to the next file
        @fullFileCount += 1
        fh = fileOpen(currFile)

        xmlFileNode = xmlNode.add_element("file", "name" => x, "fqname" => currFile)
        statHash = {}
        statHash.merge!(getFileStats(fh))
        statHash.merge!(calculate_digest(fh))
        xmlFileNode.add_attributes(statHash)

        ext = File.extname(currFile).downcase
        if @opts.winVerList.include?(ext)
          pe_hdr = PEheader.new(fh) rescue nil
          process_pe_header(pe_hdr, xmlFileNode) unless pe_hdr.nil?
        end

        getFileContents(fh, xmlFileNode) if @opts.contents == true
        fh.close
      rescue Errno::EACCES, RuntimeError, SystemCallError
        fh.close if fh.kind_of?(File) && !fh.closed?
      end
    end
    $log.debug "processFile: finished @xml is #{@xml}"
  end

  def process_pe_header(pe_hdr, xml_file_node)
    xml_file_node.add_element("versioninfo", pe_hdr.versioninfo) if @opts.versioninfo && pe_hdr.versioninfo.present?
    xml_file_node.add_element("libraries", "imports" => pe_hdr.getImportList) if @opts.imports && pe_hdr.imports.present?
  rescue TypeError => err
    $log.info "process_pe_header: TypeError handling PEheader; skipping PEheader info"
    $log.debug err.backtrace.join("\n")
  end

  def isDir?(currFile)
    if @fs
      @fs.fileDirectory?(currFile)
    else
      File.directory?(currFile)
    end
  end

  def fileOpen(currFile)
    if @fs
      @fs.fileOpen(currFile)
    else
      File.open(currFile)
    end
  end

  def getFileStats(fh)
    # If we are processing a member of the File class, use the File::Stat object to get data
    fh = fh.stat if fh.class == File
    {"size" => fh.size, "atime" => fh.atime.getutc.iso8601, "ctime" => fh.ctime.getutc.iso8601, "mtime" => fh.mtime.getutc.iso8601}
  end

  def get_dir_stats(dir)
    if @fs
      {"size" => @fs.fileSize(dir), "atime" => @fs.fileAtime(dir).getutc.iso8601, "ctime" => @fs.fileCtime(dir).getutc.iso8601, "mtime" => @fs.fileMtime(dir).getutc.iso8601}
    else
      {"size" => File.size(dir), "atime" => File.stat(dir).atime.getutc.iso8601, "ctime" => File.stat(dir).ctime.getutc.iso8601, "mtime" => File.stat(dir).mtime.getutc.iso8601}
    end
  end

  def calculate_sums(xmlNode)
    rollup = create_digest_hash
    # Add size to the hash as a Fixnum
    rollup['size'] = 0

    xmlNode.each_element do |e|
      rollup.each_pair do |k, _v|
        if k == "size"
          rollup[k] += e.attributes[k].to_i if e.attributes[k]
        else
          rollup[k] << e.attributes[k] if e.attributes[k]
        end
      end
    end

    rollup.each { |k, v| rollup[k] = v.to_s unless k == 'size' }
    rollup
  end

  def calculate_digest(fileName)
    unless @opts.digest.empty?
      #      if fileName.class.to_s != "MiqFile"
      #        raise "File [#{fileName}] is not in a readable state." unless File.readable?(fileName)
      #      end

      # Create hash for requested digests
      digest = create_digest_hash

      begin
        fileName.seek(0, IO::SEEK_SET)
        # Loop over each digest and add the file contents
        while (buf = fileName.read(10_240_000))
          digest.each_pair { |_k, v| v << buf }
        end
      rescue => err
        $log.error "Error #{err} reading file to calculate digest"
        $log.debug err.backtrace.join("\n")
      end
    end

    digest.each_pair { |k, v| digest[k] = v.to_s }
    digest
  end

  def create_digest_hash
    dHash = {}
    @opts.digest.each do |h|
      begin
        dHash[h.downcase] = Digest.const_get(h.upcase).new
      rescue NameError
        # If we are unable to load a digest, skip it.
      end
    end
    dHash
  end

  def getFileContents(fh, xml_node)
    fh.seek(0, IO::SEEK_SET)
    buf = fh.read(1024000) || "" # read will return nil when at EOF.
    xml_node.add_element("contents", "compressed" => "true", "encoded" => "true").text = (MIQEncode.encode(buf))
  end

  def to_xml
    @xml
  end
end

# Only run if we are calling this script directly
if __FILE__ == $0
  # if 1
  require 'MiqVm/MiqVm'

  require 'logger'
  $log = Logger.new("#{File.basename(__FILE__, ".*")}.log")

  startTime = Time.now

  # Mount VM Image to a real drive letter
  #  mountNative, startPath = false, "M:/WINDOWS/system32/mui"
  vmHDImage = "D:\\Virtual Machines\\VC20\\Windows Server 2003 Standard Edition.vmx"

  begin
    @vm = MiqVm.new(vmHDImage, nil)

    @systemFs = @vm.rootTrees[0]
    if @systemFs
      # Note: SHA22 is not valid.  It is here for testing of bad parms
      # md5 = MD5deep.new(@systemFs, {"digest"=>%w(SHA1)}) #, %w(MD5 RMD160 SHA1 SHA256 SHA384 SHA512 SHA22))
      md5 = MD5deep.new(@systemFs) # , %w(MD5 RMD160 SHA1 SHA256 SHA384 SHA512 SHA22))
      # xml = md5.scan("C:/Program Files/VMware/VMware VirtualCenter 2.0")
      xml = md5.scan_glob("c:/windows/system32/*.sc?")
      #      xml = md5.scan_glob("C:/Program Files/vmware/VMware VirtualCenter 2.0/vmprep.exe")

      $log.info "writing XML..."
      xml.write(STDOUT, 0)
      puts ""
      File.open("d:/temp/md5out.xml", "w") { |f| xml.write(f, 0); f.close }
      stopTime = Time.now
    end

    $log.info startTime
    $log.info stopTime
    $log.info "Run  time : #{(stopTime - startTime).to_i}"
    $log.info "File count: #{md5.fullFileCount}"
    $log.info "Dir  count: #{md5.fullDirCount}"
  rescue NameError => err
    unless err.to_s.include?("MiqVm")
      $log.warn err
      $log.fatal err.backtrace.join("\n")
    end
  rescue => err
    $log.fatal err
    $log.fatal err.backtrace.join("\n")
  end
end
