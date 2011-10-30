$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cantango_editor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cantango_editor"
  s.version     = CantangoEditor::VERSION
  s.authors     = ["Stanislaw Pankevich"]
  s.email       = ["s.pankevich@gmail.com"]
  s.homepage    = "https://github.com/stanislaw/cantango_editor"
  s.summary     = "TODO: Summary of CantangoEditor."
  s.description = "TODO: Description of CantangoEditor."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  # s.add_dependency "jquery-rails"
end
