$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activerecord_timeline/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activerecord_timeline"
  s.version     = ActiverecordTimeline::VERSION
  s.authors     = ["Miguel Lamas"]
  s.email       = ["miguel.aurelio.murias28@gmail.com"]
  s.summary     = "Timeline generator"
  s.description = "Customizable timeline generator for model changes"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "byebug"
  s.add_development_dependency "rubocop"
end
