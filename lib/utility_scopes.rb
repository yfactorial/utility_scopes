require 'utility_scopes/limited'
require 'utility_scopes/ordered'
require 'utility_scopes/eager'
require 'utility_scopes/except'
require 'utility_scopes/pks'
  
if defined?(ActiveRecord)

  ActiveRecord::Base.class_eval do
    include UtilityScopes::Limited
    include UtilityScopes::Ordered
    include UtilityScopes::Eager
    include UtilityScopes::Except
    include UtilityScopes::Pks
  end
  
end