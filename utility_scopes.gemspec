Gem::Specification.new do |s|
  
  s.name     = "utility_scopes"
  s.version  = "0.1.0"
  s.date     = "2008-08-20"
  
  s.summary  = "A collection of utilitarian named scopes providing common functionality for ActiveRecord models"
  s.email    = "ryan@yfactorial.com"
  s.homepage = "http://github.com/yfactorial/utility_scopes"
  s.description = "A collection of utilitarian named scopes providing common functionality for ActiveRecord models."
  
  
  s.authors  = ["Ryan Daigle"]
  s.has_rdoc = true
  s.rdoc_options = ['--main', 'README.rdoc']
  s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  s.extra_rdoc_files = ['README.rdoc', 'Rakefile', 'LICENSE']

  s.add_dependency 'activerecord', ['>= 2.1.0']
  
  s.files = %w(README.rdoc Rakefile LICENSE init.rb lib lib/utility_scopes lib/utility_scopes.rb lib/utility_scopes/eager.rb lib/utility_scopes/limited.rb lib/utility_scopes/ordered.rb spec spec/abstract_spec.rb spec/eager_spec.rb spec/limit_spec.rb spec/ordered_spec.rb spec/spec_helper.rb spec/fixtures spec/fixtures/article.rb)
end