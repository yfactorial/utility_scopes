module UtilityScopes
  module Ordered
    
    def self.included(within)
      within.class_eval do
        
        # Provide an ordered scope
        named_scope :ordered, lambda { |*order|
          { :order => order.flatten.first || self.default_ordering }
        }
        
        # Set the default order
        class << self
          define_method(:default_ordering) { 'created_at DESC' }
        end
        
        extend ClassMethods
      end
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
      def ordered_by(clause)
        
        # Override named scope on AR::Base so we can access default_ordering
        # on subclass
        named_scope :ordered, lambda { |*order|
          { :order => order.flatten.first || self.default_ordering }
        }
        
        metaclass.instance_eval do
          define_method(:default_ordering) { clause }
        end
      end
      
      private
      
      def metaclass; class << self; self end; end
    end
  end
end
