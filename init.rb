require 'utility_scopes/limit'
require 'utility_scopes/ordered'
require 'utility_scopes/eager'

ActiveRecord::Base.class_eval do
  include UtilityScopes::Limit
  include UtilityScopes::Ordered
  include UtilityScopes::Eager  
end