class Friendship < ActiveRecord::Base
  class DuplicateEntry < StandardError; end

  after_commit AuditLog
  before_create :check_duplicate

  scope :active, -> { where(deleted_at: nil) }

  belongs_to :user, inverse_of: :friendships1
  belongs_to :friend, class_name: User, inverse_of: :friendships2

  validates :user, presence: true
  validates :friend, presence: true
  validates :state, presence: true

  def offered?
    state == "00"
  end

  def established?
    state == "11"
  end

  def accept
    update!(state: "11")
  end

  def delete
    # HACK: Don't know how to use 2 conditions for users associatons
    update!(state: "01")
    # TODO: add spec
    SoftDelete.call(self)
  end

  private def check_duplicate
    if Friendship.where(user_id: friend_id, friend_id: user_id).exists?
      # TODO: add special log message, this should never happen
      fail DuplicateEntry, "reverse friendship relation already exists"
    end
  end
end
