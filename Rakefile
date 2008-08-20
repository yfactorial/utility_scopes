require 'rubygems'
require 'rake'
require 'rake/rdoctask'

# TODO add task to execute specs
 
desc 'Generate RDoc documentation.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_files.include('README.rdoc', 'LICENSE', 'Rakefile').
    include('lib/**/*.rb')
  
  rdoc.main = "README.rdoc"
  rdoc.title = "utility_scopes documentation"
  
  rdoc.rdoc_dir = 'doc' # rdoc output folder
  rdoc.options << '--inline-source' << '--charset=UTF-8'
  rdoc.options << '--webcvs=http://github.com/yfactorial/utility_scopes/tree/master/'
end