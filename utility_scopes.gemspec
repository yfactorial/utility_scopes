Gem::Specification.new do |s|
  s.name     = "utility_scopes"
  s.version  = "0.1.0"
  s.date     = "2008-08-20"
  s.summary  = "A collection of utilitarian named scopes providing common functionality for ActiveRecord models"
  s.email    = "ryan@yfactorial.com"
  s.homepage = "http://github.com/rwdaigle/utility_scopes"
  s.description = "A collection of utilitarian named scopes providing common functionality for ActiveRecord models."
  s.has_rdoc = true
  s.authors  = ["Ryan Daigle"]
  s.files    = ["init.rb", 
		"README.rdoc", 
		"utility_scopes.gemspec", 
		"lib/utility_scopes/limited.rb", 
		"lib/utility_scopes/ordered.rb", 
		"lib/utility_scopes/eager.rb"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.add_dependency("activerecord", [">= 2.1.0"])
end