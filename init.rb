require 'utility_scopes'

ActiveRecord::Base.class_eval do
  include UtilityScopes::Limit
  include UtilityScopes::Ordered
end