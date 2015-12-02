class Friendship < ActiveRecord::Base
  include UserActivity

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
    update!(state: OFFERED)
    update!(deleted_at: nil) if deleted_at?
  end

  def offered?
    state == OFFERED && !deleted_at?
  end

  def accept
    create_activity
    update!(state: ESTABLISHED)
    user.follow(friend)
    friend.follow(user)
  end

  def established?
    state == ESTABLISHED && !deleted_at?
  end

  def reject
    update!(state: REJECTED)
  end

  def rejected?
    state == REJECTED && !deleted_at?
  end

  # when user deactivates account, need to preserve state
  # also called when friendships end
  def inactivate
    user.unfollow(friend)
    friend.unfollow(user)
    friend.touch
    ts_soft_delete
  end

  def activate
    return if friend.deleted_at?
    update!(deleted_at: nil)
    friend.touch
    user.follow(friend)
    friend.follow(user)
  end

  private def check_duplicate
    # also prevents friendship with oneself
    if Friendship.where(user_id: friend_id, friend_id: user_id).exists? || (user_id == friend_id)
      msg = "reverse friendship from #{user_id} to #{friend_id} already exists"
      Rails.logger.error {{ duplicate_friendship: msg }}
      Airbrake.notify(DuplicateEntry, error_message: msg)
      fail DuplicateEntry, duplicate_friendship: msg
    end
  end

  # must use this style here
  class << self
    def open
      where(deleted_at: nil, state: OFFERED)
    end

    def established
      where(deleted_at: nil, state: ESTABLISHED)
    end
  end

  def humanize
    case state
    when OFFERED then "pending"
    when ESTABLISHED then "friend"
    end
    # returns nil otherwise
  end

  ## Activity Methods ##

  private def activity_is_valid?
    super and established?
  end

  private def activity_target
    friend
  end

  # The user who made the update
  private def activity_actor
    user
  end

  private def activity_verb
    'friendship'
  end
end
