module UtilityScopes
  module Ordered
    
    def self.included(within)
      within.class_eval { extend ClassMethods }
    end
    
    module ClassMethods
      
      # Decorate this class with the ability to order itself in queries
      # either from a given parameter or from its default ordering:
      #
      #   class Article < ActiveRecord::Base
      #     ordered_by "published_at DESC"
      #   end
      #
      #   Article.ordered #=> all items ordered by "published_at DESC"
      #   Article.ordered('popularity ASC') #=> all items ordered by "popularity ASC"
      #   Article.default_ordering #=> "published_at DESC"
      #
      def ordered_by(clause = 'created_at DESC')
        
        # Add named scope
        named_scope :ordered, lambda { |*order|
          { :order => order.flatten.first || self.default_ordering }
        }
        
        # Give the class it's convenience "orderings" and "default_ordering" accessors
        metaclass.instance_eval do
          define_method(:default_ordering) { clause }
        end
      end
      
      private
      
      def metaclass; class << self; self end; end
    end
  end
end
