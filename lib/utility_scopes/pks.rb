module UtilityScopes
  module Pks
    
    def self.included(within)
      
      within.class_eval do
        named_scope :only_pks, :select => "`#{table_name}`.#{primary_key}"        
        extend ClassMethods
      end
    end
    
    module ClassMethods
      def pks
        only_pks.collect(&:"#{primary_key}")
      end
    end
  end
end