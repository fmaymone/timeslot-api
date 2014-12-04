class Friendship < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user, inverse_of: :friendships1
  belongs_to :friend, class_name: User, inverse_of: :friendships2

  validates :user, presence: true
  validates :friend, presence: true
  validates :state, presence: true
end
