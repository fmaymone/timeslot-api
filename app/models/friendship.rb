class Friendship < ActiveRecord::Base
  class DuplicateEntry < StandardError; end

  after_commit AuditLog
  before_create :check_duplicate

  scope :active, -> { where(deleted_at: nil) }

  belongs_to :user, inverse_of: :initiated_friendships
  belongs_to :friend, class_name: User, inverse_of: :received_friendships

  validates :user, presence: true
  validates :friend, presence: true
  validates :state, presence: true

  def offer
    update!(state: 00)
  end

  def offered?
    state == "00" && !deleted_at?
  end

  def accept
    update!(state: "11")
  end

  def established?
    state == "11" && !deleted_at?
  end

  def reject
    update!(state: "01")
  end

  def rejected?
    state == "01" && !deleted_at?
  end

  # when user deactivates account, need to preserve state
  def inactivate
    friend.touch
    SoftDelete.call(self)
  end

  def activate
    return if friend.deleted_at?
    update!(deleted_at: nil)
    friend.touch
  end

  private def check_duplicate
    if Friendship.where(user_id: friend_id, friend_id: user_id).exists?
      # TODO: add special log message, this should never happen
      fail DuplicateEntry, "reverse friendship relation already exists"
    end
  end

  class << self
    def open
      where(deleted_at: nil).where(state: '00')
    end

    def established
      where(deleted_at: nil).where(state: '11')
    end
  end
end
