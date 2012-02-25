$LOAD_PATH << File.join(File.dirname(__FILE__), "lib")
require "simple_selector/version"

Gem::Specification.new do |s|
  s.name          = "simple_selector"
  s.version       = SimpleSelector::VERSION
  s.author        = "Jacek Mikrut"
  s.email         = "jacekmikrut.software@gmail.com"
  s.homepage      = "http://github.com/jacekmikrut/simple_selector"
  s.summary       = "Simple selector."
  s.description   = "Simple selector."

  s.files         = Dir["lib/**/*", "README*", "LICENSE*", "Changelog*"]
  s.require_path  = "lib"
end
