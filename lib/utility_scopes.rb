require 'utility_scopes/limited'
require 'utility_scopes/ordered'
require 'utility_scopes/eager'
  
if defined?(ActiveRecord)

  ActiveRecord::Base.class_eval do
    include UtilityScopes::Limited
    include UtilityScopes::Ordered
    include UtilityScopes::Eager  
  end
  
end