## 1.2.7 - 28-Oct-2022
* Fix bug on Solaris where it would fail trying to read zero-byte pseudo-kernel
  processes. Thanks go to Robert Waffen for the spot and the patch.
* Fixed a bug for MacOS that potentially caused it to miss thread info.
* Fixed specs for AIX that had gotten mangled when I switched to rspec
* Some gemspec updates, including the addition of rubocop as a development
  dependency, and mandatory MFA.
* Lots of rubocop related updates, mostly stylistic, but in some cases things
  that were always meant to be private (like C struct wrappers) have been
  explicitly marked as private.
* Lots of general spec refactoring, including updates for MacOS since Catalina
  and later that no longer allow you to collect env information for spawned
  processes.
* Switched to github actions.

## 1.2.6 - 25-Aug-2020
* Made some updates so that it worked properly with TruffleRuby on Mac.
* Fixed an issue on Linux where non-ascii environ strings could cause failure.
  Thanks go to deemytch for the spot and original patch.
* Removed the spec_helper.rb file, just use Process.spawn instead of messing
  around with custom fork implementations. This also helps with implementations
  that don't support fork.
* Updated the MANIFEST.

## 1.2.5 - 19-Jun-2020
* Added the delayacct_blkio_ticks, guest_time, and cguest_time fields on Linux.
  These require 2.6.18 or later, but will simply be nil on earlier versions.
* Added the rsslim synonym for the rlim field for Linux.

## 1.2.4 - 18-Jun-2020
* Added the num_threads field for Linux. This was originally a dead field in
  older versions of Linux that was skipped, but as of Linux 2.6+ it actually
  holds meaningful data.
* Updated the specs for Linux.

## 1.2.3 - 17-Mar-2020
* Properly include a copy of Apache-2.0 in LICENSE file as part of library.
* Add explicit .rdoc extensions to CHANGES and MANIFEST files.

## 1.2.2 - 12-Aug-2019
* Added compatibility for JRuby on Mac which apparently doesn't define a
  read_uint64 method, nor a CharArray. Thanks go to Adithya Pentela for
  the spot.
* Refactored the specs a bit, adding a spec_helper.rb. This was mainly
  for JRuby compatibility.
* Updates to the travis.yml file for both Ruby and JRuby versions.
* Removed the doc directory and all the files it contained. It was
  redundant, and some of the information was wrong. All of the
  documentation you need is on the wiki.
* Cleaned up the MANIFEST file, updated the gemspec, and fixed the
  license name, which was missing a hyphen.

## 1.2.1 - 8-Jun-2018
* The code for OSX is now more efficient when a pid argument is provided.
  Thanks go to Nick LaMuro for his efforts.
* Added metadata to the gemspec.
* Switched the README (now README.md) to markdown format. Thanks go to
  Tim Meusel for the update.
* Updated the cert. Should be good for ten years now.

## 1.2.0 - 20-Feb-2018
* There has been an API change. The ProcTable.ps method now uses keyword
  arguments. The 'pid' option is universal, the rest depend on the platform.
  As part of this change, support for Ruby < 2.0 has been dropped.
* Support for HP-UX has been dropped, both because it was the last remaining
  platform that still used C code, and because it's basically a dead platform.
* There are no more platform-specific gems. There is now a single gem that
  will load the appropriate code based on your host's operating system.
* The tests were switched from test-unit to rspec.
* Lots of Rakefile updates based on the above changes.
* The cert was updated.

## 1.1.5 - 10-Aug-2017
* Fixed a warning that cropped up in Ruby 2.4.x because I was type checking
  against Fixnum. Those have been replaced with Numeric.

## 1.1.4 - 30-Mar-2017
* Fixed a potential issue where OSX could return a struct with invalid data.
* Set the default field to :pid for OSX when using Sys::Top.
* Fixed a duplicate test warning for OSX.

## 1.1.3 - 28-Sep-2016
* Fixed an issue on OSX where the value returned for argc is invalid.

## 1.1.2 - 18-Sep-2016
* Fixed cmdline parsing and handling for OSX. Thanks go to Ben Mathwig for
  the spot and the patch.

## 1.1.1 - 30-Jun-2016
* Added thread information for OS X.
* Fixed VERSION constant for HP-UX.

## 1.1.0 - 27-Jun-2016
* License was changed to Apache 2.0.
* The OS X version now requires OS X 10.7 or later.
* Scrapped the C implementation for OS X, and replaced it with a libproc wrapper
  using FFI, so it is now pure Ruby. Note that some new struct members have been
  added, while others have been dropped. This includes pctcpu, so Sys::Top does
  not work at the moment.
* Rakefile updates to accomodate the changes for OS X.
* Some test suite updates and refactoring.

## 1.0.0 - 11-Jan-2016
* Added smaps information for Linux. Thanks go to Joe Rafaniello for the patch.
* This really should not have been a major release, sorry.

## 0.9.9 - 8-Nov-2015
* Added support for cgroups on Linux. Thanks go to Dennis Günnewig for the patch.
* Added a sys-proctable.rb file for convenience.
* This gem is now signed.
* Gem related tasks in the Rakefile now assume Rubygems 2.x.

## 0.9.8 - 18-Apr-2015
* Fixed a bug in the gemspec. Last version got yanked.

## 0.9.7 - 18-Apr-2015
* Fixed a bug in the OSX code that could cause the ps method to fail. Thanks
  go to Koshevoy Anton for the spot.
* Some internal refactoring of version handling. Now all platforms use a
  single version file.
* Replaced vm_size_t and lwpid_t with universal data types on FreeBSD because
  FFI on FreeBSD 10 no longer understands them. Thanks go to Mike Owens for
  the spot.

## 0.9.6 - 24-Feb-2015
* Added NLWP field on Linux. Thanks go to Rich Chatterton for the patch.

## 0.9.5 - 10-Feb-2015
* Significant cleanup and memory reduction of the OSX code. Thanks go
  to Ivan (toy) for the patches.
* Skip over /proc/<file>/status if unreadable on Linux. Thanks go to Jianjun
  Mao for the patch.

## 0.9.4 - 4-Mar-2014
* Added support for AIX 5.3 or later courtesy of Rick Ohnemus.
* The Solaris version now uses FFI structs instead of a packed array.
  It solved issues with 64-bit versions of Ruby and it's self-documenting.
* The FreeBSD version has been converted to use FFI. In addition, additional
  struct members have been added, and members that previously returned nil
  now return meaningful data.
* Support for NetBSD and OpenBSD has been temporarily dropped. Considering
  that the C code did not build on those platforms anyway, I doubt most of
  you will notice. Patches for those platforms are welcome, but only using FFI.

## 0.9.3 - 17-Mar-2013
* Fixed a bug on OSX where a long command string arg could cause
  a segfault. Thanks go to Nathaniel Bibler for the spot.
* Changed the gem platform from mingw to mingw32 for Windows.

## 0.9.2 - 8-Oct-2012
* Added cmdline support for OS X. Thanks go to Matthias Zirnstein for
  the patch.
* Warning cleanup for 1.9.
* Updated the gem platform handling. Replaced the borked string approach
  with a two element array for Gem::Platform.new.
* MS date strings are now parse with DateTime instead of Date.

## 0.9.1 - 3-Aug-2011
* Added the pctcpu and pctmem members for Linux.
* Added Errno::ESRCH to a rescue clause on Linux that fixed a bug
  where a missing entry wasn't being skipped when run as root. Thanks
  go to Austin Ziegler for the spot and patch.
* Fixed a build warning for Darwin.
* Updates to the test suite for both Darwin and Linux.
* Added an explicit type check for BSD for pids.
* Added nicer error messages for BSD if kvm_open fails.
* Added .core files to the clean task.
* Altered the platform settings in the Rakefile so that generated gems
  use 'universal' platform architectures for any particular operating system.

## 0.9.0 - 14-Oct-2009
* Changed the license to Artistic 2.0.
* Fixed a bug in the OS X code where a segfault would occur when an attempt
  was made to gather resource usage information on zombie processes. From
  now on that information is always set to nil for zombie processes. Thanks
  go to Tom Lianza for the spot and Philip Kromer for investigating the
  root cause of the failure.
* Removed the FreeBSD code that read out of /proc. It was a pain from a
  maintenance point of view, and most FreeBSD installs do not mount /proc
  by default. The FreeBSD platform now uses the same code that the other
  BSD platforms use.
* Fixed a bug in the BSD code where the ProcTable::Error class had the
  wrong parent class.
* Some major gemspec updates, including an updated license. The platform
  handling logic is now in the Rakefile in the 'gem' task.
* Updated the README file to include an additional acknowledgement, a
  license change and some minor formatting changes.
* The test-unit library was changed from a runtime to a development dependency.

## 0.8.1 - 6-Apr-2009
* The Linux and Solaris libraries now handle the possibility of a process
  terminating in the middle of a read more gracefully. If that happens, they
  merely skip to the next record, i.e. it's all or nothing. Thanks go to
  Heejong Lee for the spot and patch.
* Fixed a bug in the Linux version where embedded nulls were not being
  stripped out of the cmdline data.
* Added the comm alias back to the Solaris version. Thanks go to Jun Young Kim
  for the spot.

## 0.8.0 - 26-Jan-2009
* The Linux and Solaris versions of this library are now pure Ruby. Be warned,
  however, that only Solaris 8 and later are now supported. This may change
  in a future release if there's demand to support 2.6 and 2.7.
* Some Struct::ProcTableStruct members have changed. As a general rule they
  now more closely match the C struct member name. See individual platforms
  for more details.
* Bug fix for the cmd_args struct member on Solaris.
* Bug fixes for OS X. Added a VERSION constant, fixed struct name, and changed
  pct_cpu to pctcpu.
* The .new method is now explicitly illegal.
* The Struct::ProcTableStruct instances are now frozen. This is read-only data.
* Added the peak_page_file_usage and status members on MS Windows. The status
  member is always nil, but was added for completeness.
* Fixed the quota_peak_paged_pool_usage member on MS Windows.
* ProcTableError is now ProcTable::Error.
* Minor test case fix for kvm/bsd based versions.
* Added the 'time' library as a require for Windows (to parse MS date/time
  format strings).
* The kvm (bsd.c) implementation now works for FreeBSD 7.
* Added many more tests.
* Added some benchmarking code in the 'benchmarks' directory.
* Added a 'bench' Rake task.
* Renamed the test_ps.rb file to example_ps.rb in order to avoid any possible
  confusion with actual test files.
* Added an 'example' rake task to run the example file.

## 0.7.6 - 11-Jul-2007
* Fixed the starttime for Linux. Thanks go to Yaroslav Dmitriev for the spot.
* Fixed a bug in the MS Windows version within a private method that parsed
  an MS specific date format. This was caused by a backwards incompatible
  change in the Time.parse method in Ruby 1.8.6. See ruby-core: 11245 ff.
* Fixed the gemspec (I hope). Please let me know if you have problems.
* Added a Rakefile. Building, testing and installing should now be handled via
  Rake tasks. The install.rb file has been removed - that code is now
  integrated in the Rakefile.
* Minor directory layout changes and cleanup (mostly for the extconf.rb file).
* Side note - it seems that the code for OS X *does* work, at least on 10.4.10.
  I can only conclude that previous reports about it failing were related to
  bugs in OS X or were really just build issues. Apologies (and thanks, again)
  to David Felstead for the code. However, see the README for more information
  specific to OS X, as there are shortcomings.

## 0.7.5 - 23-Nov-2006
* Fixed int/long issues for Linux. Thanks go to Matt Lightner for the spot.
* Minor documentation fixes and changes to the extconf.rb file.

## 0.7.4 - 20-Nov-2006
* Added a patch that deals with the large file compilation issue on Solaris.
  You no longer need to build Ruby with --disable-largefile, or build a
  64 bit Ruby, in order for this package to work.  Thanks go to Steven Jenkins
  for the information that led to the patch.
* Added inline rdoc to the source code.
* Added a gemspec.
* Fixed some potential 64 bit issues (struct declarations).
* Added preliminary support for Darwin (OS X). The code was provided by
  David Felstead, but does not appear to compile successfully.  Help wanted.

## 0.7.3 - 27-Oct-2005
* Fix for 1.8.3 and later (rb_pid_t). This should have only affected
  Solaris.

## 0.7.2 - 15-May-2005
* Bug fix for the FreeBSD version that reads from /proc.
* Eliminated the test bug on Linux (inexplicably caused by File.copy).  The
  test suite should now run without segfaulting.
* Include bsd.c in tarball (oops).
* Minor test updates for FreeBSD.
* The 'pct_cpu' member for the BSD/kvm version has been changed to 'pctcpu'
  for consistency with other platforms.

## 0.7.1 - 8-May-2005
* Bug fixed for the cmdline info on Linux.  Thanks go to Arash Abedinzadeh
  for the spot.
* Added an example program.
* Minor setup fix for Win32 in tc_all.rb.

## 0.7.0 - 25-Apr-2005
* Scrapped the C implementation for Windows in favor of an OLE + WMI pure Ruby
  approach.  See documentation for details.
* Added an optional lkvm implementation for BSD users.  This is automatically
  used if the /proc filesystem isn't found.
* Added prusage info for the Solaris version.
* Added name, eid, euid, gid and guid information for Linux.  Thanks go to
  James Hranicky for the patch.
* Fixed some potential bugs in the Linux version.  Thanks go to James
  Hranicky for the spot.
* Added the 'sys/top' package.
* ProcTable.fields no longer supports a block form.
* The BTIME (boot time) information has been removed from the Linux version.
  If you want that information, use sys-uptime instead.
* The .html and .rd files have been removed.  You can generate html on your
  own with rdoc if you like.
* Some code cleanup on the C side of the house.
* Most documents made rdoc friendly.
* Renamed 'install_pure_ruby.rb' to just 'install.rb'.
* Removed the 'INSTALL' file.  Installation instructions are in the README.
* Some test suite cleanup and reorganization.
* Moved project to RubyForge.

## 0.6.4 - 31-Mar-2004
* Fixed a bug in the pure Ruby version for Win32.  Thanks go to Mark Hudson
  for the spot.
* Fixed a bug in the C implementation for Win32 where the cmdline and path
  values were sometimes wrong for running processes.  Thanks go to Park Heesob
  for the fix.
* Updated the VERSION constant and removed the VERSION class method in the
  pure Ruby version for Win32.
* Updated install_pure_ruby.rb and test.rb scripts.
* Updated warranty information.
* The extconf.rb script has been revamped.  See the INSTALL and README files
  for important changes since the last release.
* The start ProcInfo struct member on Solaris, HP-UX and FreeBSD is now a
  Time object, not a Fixnum/Bignum.
* Modified linux.c yet again to make gcc happy when it comes to multi-line
  string literals.
* Minor change to way process state is handled on HP-UX.
* Documentation additions and updates, including warranty information.

## 0.6.3 - 24-Feb-2004
* Fixed a bug in the Solaris version where the cmd_args array did not
  necessarily contain data on 2.7 and later.  The current patch still
  does not quite fix the problem for 2.6 and earlier but can be easily
  derived manually by parsing the cmdline string.

## 0.6.2 - 20-Jan-2004
* Fixed a small memory leak in the solaris version.

## 0.6.1 - 31-Dec-2003
* Fixed a minor bug in the cmdline field on Linux where a blank character
  was being appended to the end of the field.
* Fixed a minor annoyance where the windows.rb file was being copied into
  the Ruby lib directory on install.
* Added a test_memleak.rb file.  Currently only supported on Linux and
  only does a file descriptor count check.  I plan to expand this to
  other platforms in the future.
* Minor test suite changes
* MANIFEST correction and update.

## 0.6.0 - 22-Oct-2003
* Significant API change (and thus, a version jump) - only a
  single argument is now accepted to the ps() method, and only a PID
  (Fixnum) is regarded as a valid argument.
* Calling ps() with a pid returns a single ProcTable struct (or nil
  if the pid is not found), instead of a one element array.
* Argument to ps() now works properly on HP-UX and Win32.
* Removed the '#include <sys/types32.h>' in sunos.h.  It wasn't needed
  and you're not supposed to include it directly.
* Fixed 2.6 compatibility issue with regards to cmdline on Solaris.
* Removed the ProcStatException completely on Linux.  There was no reason
  to fail on a directory read for /proc/xxx/stat.  If the read fails
  (meaning the process died in the middle of collecting info for it), it
  is simply ignored.
* The ttynum bug on HPUX has been fixed.  In addition, the return value for
  this field is now a string rather than an int and the field name has
  been changed to "ttydev".
* The ttynum field has been changed to ttydev on Solaris and HPUX.  On
  Solaris, the ttydev is now reported as -1 if there is no associated tty.
  In a future release, Solaris and the other *nix platforms will be changed 
  so that ttydev is always a device name (i.e String).
* Added plain text documentation for all platforms.
* Some test suite cleanup.
* Changed .rd2 extension to just '.rd'.

## 0.5.2 - 18-Jul-2003
* Modified cmdline to extend past the traditional 80 character limit on
  Solaris, where possible (Solaris 2.6+ only).
* Added the cmdline_args and num_args fields on Solaris, which returns
  an array of cmdline arguments and the number of cmdline arguments,
  respectively.
* Minor modification to fields() method, in addition to warning cleanup
  for Solaris.
* Changed "defunct" state string to "zombie" for Solaris.
* Should cleanly compile with -Wall -W now (gcc) on Solaris.
* Added solaris.txt to doc directory.
* MANIFEST corrections.

## 0.5.1 - 16-Jul-2003
* Fixed a nasty file descriptor bug in the Linux code, where file descriptors
  were continuously being used up.
* Added the BTIME (boot time) constant for Linux.
* Fixed up the test/test.rb file a bit.
* Added BTIME tests to tc_linux.rb.

## 0.5.0 - 11-Jul-200
* Added HP-UX support!
* Note that passing PID's or strings as arguments to ps() is not supported
  in the HP-UX version.  This functionality will be stripped out of the
  other versions in a future release.  See the README file for more details.
* Removed the VERSION() class method.  Use the constant instead.
* Separated the rd docs from their respective source files.  Now in the doc
  directory.
* Got rid of the interactive html generation in extconf.rb.
* Changed License to Artistic.

## 0.4.3 - 30-May-2003
* Added a version.h file to store the version number. Modified all of the
  C source files to use that instead of hard coding the version everywhere.
* Added a generic test.rb script for those without TestUnit installed, or
  just futzing in general.  Modified the extconf.rb script to copy this
  instead of writing an inline HERE document.
* Modified extconf.rb so that it builds with mingw or cygwin.  Thanks go to
  Peter Fischer for the spot and patch.
* Modified test suite to work with TestUnit 0.1.6 or 0.1.8.

## 0.4.2 - 14-Apr-2003
* Added pure Ruby version for Win32 - thanks Park Heesob.
* Modified extconf.rb file to handle pure Ruby versions.
* Added install_pure_ruby.rb file, an alternate installation
  script for pure Ruby versions.

## 0.4.1 - 31-Mar-2003
* Added support for Solaris 2.5.x.
* All exceptions are now a direct subclass of StandardError.
* Value returned for wchan now more meaningful (2.5.x only for now).
* Fixed the start, utime and ctime for FreeBSD.
* Minor fix to FreeBSD test suite.
* Some changes to extconf.rb.
* Minor doc changes.
* Added License and Copyright info.

## 0.4.0 - 10-Mar-2003
* Added MS Windows support (non-cygwin).
* Added environment information for Linux version.
* Added real exceptions (type depends on platform).
* Added a test suite (for those with testunit installed).
* Removed the sys-uname requirement.
* Heavily modified the extconf.rb script.
* Changed "Changelog" to "CHANGES" and "Manifest" to "MANIFEST".
* Added a VERSION constant and class method.
* Minor internal directory layout change (put 'os' under 'lib').
* Changed package name to lower case.
* Doc changes, including license information.

## 0.3.1 - 16-Aug-2002
* Added a "comm" field to the sunos version.  I am going to try to make this a
  common field for all platforms to help reduce RUBY_PLATFORM checking.
* Fixed the release date for 0.3.0 (was accidentally marked *July*).
* Added an INSTALL file.
* Minor documentation change to the sunos.c source file.

## 0.3.0 - 11-Aug-2002
* Added FreeBSD support!
* Struct name changed to just "ProcTableStruct" to be compliant with future
  versions of Ruby.
* The ps() function now returns an array of ProcTableStruct's in lvalue context.
* Fixed the ability to search by process name in Linux.
* Modified Linux "comm" field to strip parenthesis.
* Some doc changes/additions.
* Added Sean Chittenden to the "Acknowledgements" section.  Sean provided me
  with access to a FreeBSD box, which is how I was able to provide FreeBSD
  support.  Thanks Sean!

## 0.2.0 - 19-Jul-2002
* Added the ability to search by process name.
* test.rb modified to be cross-platform.
* Solaris - fixed bug with fname (was accidentally called "name").

## 0.1.0 - 2-Jul-2002
- Initial release.
