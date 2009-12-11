module UtilityScopes
  module Pks
    
    def self.included(within)
      
      within.class_eval do        
        extend ClassMethods
      end
    end
    
    module ClassMethods

      # Can't use named_scope b/c don't have access to table_name etc... yet
      def only_pks
        scoped(:select => "`#{table_name}`.#{primary_key}")
      end

      def pks
        only_pks.collect(&:"#{primary_key}")
      end
    end
  end
end