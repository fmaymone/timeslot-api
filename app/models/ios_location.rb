class IosLocation < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :creator, class_name: User

  validates_presence_of :creator
end
