require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'hoe'
require './lib/version.rb'

# TODO add task to execute specs
 
desc 'Generate RDoc documentation.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_files.include('README.textile', 'LICENSE', 'CHANGELOG', 'Rakefile').
    include('lib/**/*.rb')
  
  rdoc.main = "README.textile"
  rdoc.title = "utility_scopes documentation"
  
  rdoc.rdoc_dir = 'doc' # rdoc output folder
  rdoc.options << '--inline-source' << '--charset=UTF-8'
  rdoc.options << '--webcvs=http://github.com/yfactorial/utility_scopes/tree/master/'
end

task :release_and_publish => [:release, :publish_docs]

Hoe.new('UtilityScopes', UtilityScopes::VERSION) do |p|
  p.name = 'utility-scopes'
  p.summary = "A collection of utilitarian named scopes for your ActiveRecord models."
  p.url = "http://github.com/yfactorial/utility_scopes/tree/master"
  p.remote_rdoc_dir = '' # Release to root
  p.changes = p.paragraphs_of('CHANGELOG', 0..1).join("\n\n")
  p.extra_deps << ['activerecord', '>= 2.1.0']
  p.developer('Ryan Daigle', 'ryan@yfactorial.com')
end