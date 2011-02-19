require 'stakr/validates_belongs_to_presence_of/model'

ActiveRecord::Base.class_eval do
  include Stakr::ValidatesBelongsToPresenceOf::Model
end
