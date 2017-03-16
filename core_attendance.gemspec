$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "core_attendance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "core_attendance"
  s.version     = CoreAttendance::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/silvaelton/core_attendance.git"
  s.summary     = "Summary of CoreAttendance."
  s.description = "Description of CoreAttendance."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"
  s.add_dependency "core_candidate"
  s.add_dependency "pg"

end
