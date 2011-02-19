module Stakr #:nodoc:
  module ValidatesBelongsToPresenceOf #:nodoc:
    module Model
      
      def self.included(base) #:nodoc:
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        
        def validates_belongs_to_presence_of(attr_name, options)
          foreign_key_name = options.delete(:foreign_key) || "#{attr_name}_id"
          
          configuration = { :on => :save }
          configuration.update(options)
          
          validates_each(attr_name, configuration) do |record, attr_name, value|
            if record.send(foreign_key_name).blank?
              record.errors.add(foreign_key_name, :blank, :default => configuration[:message])
            elsif value.blank?
              record.errors.add(foreign_key_name, :invalid, :default => configuration[:message])
            end
          end
        end
        
      end
      
    end
  end
end
