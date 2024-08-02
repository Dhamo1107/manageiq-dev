# -*- encoding: utf-8 -*-
# stub: systemd-journal 1.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "systemd-journal".freeze
  s.version = "1.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Ledbetter".freeze, "Daniel Mack".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIEMDCCApigAwIBAgIBATANBgkqhkiG9w0BAQsFADAhMR8wHQYDVQQDDBZqb2hu\nL0RDPXRocm90dGxlL0RDPWlvMB4XDTIwMDczMDIyMTUxNVoXDTIxMDczMDIyMTUx\nNVowITEfMB0GA1UEAwwWam9obi9EQz10aHJvdHRsZS9EQz1pbzCCAaIwDQYJKoZI\nhvcNAQEBBQADggGPADCCAYoCggGBAMEZjnWtA5/YsYEDvWlTAPOP2NshfBVcNSXE\nFHg4refJstCaf59iqFEWbEjLmbezK6HA5vzM6ZenEom2S1Rzj0OButABHKaISjxE\nwJG/DZ8fJTx+Yn970cIA7jH0r03/kpg8fzrCWjUH+Jy3vX8dkTa0I+fWz45k9o1g\ne+ENGeIRklG7T8rNCmJP6oacGJUfdmXSHDszg0u1dCi4scth1vksDbZwyL/BPqGF\nhLvIeAXwm1TPXKvD13odTRBgHj5h7w7YOBmcqGwq+rgEC+iRJhdS00x+mquD9Gdm\nCjCvRnS7JG4UTpmUxsdY0snPCiHZjbjCKhZr+dciOOWLQE2NVuTeiyNg5di7XMq+\nblIh6acnMZThiR8+bHAprJ1P+DtZ6uY0oePnRZ2K1pebGIOjA/UKaHlvbatyB49z\nNdTvAWRWAQ2tSOpQhtR/3Pp6SYniT+/lnsW3H4bBsY14wEfPp8tkp7SdbyjoEeaz\nljX4Qi8q0ozKO22jbtwzE6F9V/EzzwIDAQABo3MwcTAJBgNVHRMEAjAAMAsGA1Ud\nDwQEAwIEsDAdBgNVHQ4EFgQUVLZVCCB2lbddzYxAxk/g4bfBjhQwGwYDVR0RBBQw\nEoEQam9obkB0aHJvdHRsZS5pbzAbBgNVHRIEFDASgRBqb2huQHRocm90dGxlLmlv\nMA0GCSqGSIb3DQEBCwUAA4IBgQAxwbDSdDZjJQ4pKoV1Xf5kj9JKL1GvJ8jotTyx\nOy8BXUV+iiYXCelwfvBIsBtz64pH1VVg4/xrv2Vsi3It3IUdlbxUHi5Bn0X0W9ci\nxkQYlszu4au+oz86MY/LMx83r9y+3GKy633JH5qmILotKHgzAcoFK5mASC9QyJWV\nEK5FWtQGVJUelB4K3P93pxICfN5os04TCW4lAzLEwYwc+TVGDa1q1u8Wr7haId4o\nfsQvapSzlO/jXwtepH363FhrdqYnXJ1acyCGBtaHzOcRUTmgRtTwNoMQICwNzeJ+\nVvAOtMDRJT68kz5nD1G6AyriHzLptEt2/+Oq/DmAY3E2q+qN7Rb3THDBDFV7u3Cw\naNcGx7j1YvV5morU/wytvIA1XvjZlp27MBu0dd4kL8k7SRApTxnRjavsDrz1Oxa6\nBTJGZ4qddTGCNj/QRwzZegXpckYB3u60wiU6EECWndotUYuKbgObSDU4Nh1cdrzw\nFIew3kKXPiBpZBN3eDxal56e+R0=\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2020-07-30"
  s.description = "Provides the ability to navigate and read entries from the systemd journal in ruby, as well as write events to the journal.".freeze
  s.email = ["john@throttle.io".freeze]
  s.homepage = "https://github.com/ledbettj/systemd-journal".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Ruby bindings to libsystemd-journal".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.9"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.26"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.10"])
  else
    s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.26"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
  end
end
