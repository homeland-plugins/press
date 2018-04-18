$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'homeland/press/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'homeland-press'
  s.version     = Homeland::Press::VERSION
  s.authors     = ['Jason Lee']
  s.email       = ['huacnlee@gmail.com']
  s.homepage    = 'https://github.com/ruby-china/homeland-press'
  s.summary     = 'Press/Blog/News plugin for Homeland.'
  s.description = 'Press/Blog/News plugin for Homeland, this gem is only work on Homeland Application.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end
