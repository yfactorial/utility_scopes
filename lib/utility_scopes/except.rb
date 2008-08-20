module UtilityScopes
  module Except
    
    def self.included(within)
      
      within.class_eval do
      
        # Allow easy rejection of items. 
        # Can take an a single id or ActiveRecord object, or an array of them
        # Example: 
        #   before   Article.all.reject{|a| a == @bad_article }
        #   after    Article.except(@bad_article)
        named_scope :except, lambda { |item_or_list|
          # nil or empty array causes issues here with mysql
          item_or_list.blank? ? {} : {:conditions => ["#{quoted_table_name}.#{primary_key} NOT IN (?)", item_or_list]}
        }
        
      end
    end
  end
end