class Connect < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user
  belongs_to :provider

  validates_presence_of :user, :provider, :social_id
end
