class IosLocation < ActiveRecord::Base
  after_commit AuditLog

  has_one :meta_slot, inverse_of: :ios_location
  belongs_to :creator, class_name: User

  validates_presence_of :creator
end
