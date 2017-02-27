$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "homeland/press/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "homeland-press"
  s.version     = Homeland::Press::VERSION
  s.authors     = ["Jason Lee"]
  s.email       = ["huacnlee@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Homeland::Press."
  s.description = "Description of Homeland::Press."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5"
end
