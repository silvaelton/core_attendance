$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "core_attendance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "core_attendance"
  s.version     = CoreAttendance::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CoreAttendance."
  s.description = "TODO: Description of CoreAttendance."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
