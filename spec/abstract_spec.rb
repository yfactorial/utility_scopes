require File.join(File.dirname(__FILE__), *%w[spec_helper])
require 'activerecord'

# Mimick plugin loading 
$:.unshift "#{File.dirname(__FILE__)}/../lib"
require 'utility_scopes/limit'
require 'utility_scopes/ordered'
require 'utility_scopes/eager'

ActiveRecord::Base.class_eval do
  include UtilityScopes::Limit
  include UtilityScopes::Ordered
  include UtilityScopes::Eager  
end

# Load a test class
def uses_fixture(fixture_name)
  require File.join(File.dirname(__FILE__), 'fixtures', fixture_name.to_s)
end