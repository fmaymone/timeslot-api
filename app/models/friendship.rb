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

  def offer(active_user = nil)
    update!(state: OFFERED) unless deleted_at?
    # temporary fix:
    # not the most elegant solution but because the first user is considered
    # the one who initiated the friendship (active) we need to switch users
    # if the second user is (re-) initiating a broken friendship again
    # TODO: I wan't to do a major upgrade on the friendships (TML-152)
    update!(friend: user, user: active_user) if active_user == friend
    create_activity
  end

  def offered?
    state == OFFERED && !deleted_at?
  end

  def accept
    update!(state: ESTABLISHED)
    user.follow(friend)
    friend.follow(user)
    remove_activity
    forward_activity(
        feed_fwd: {
            Notification: [
                activity_actor.id.to_s,
                activity_target.id.to_s
            ]
        },
        push_fwd: [
            activity_actor.id.to_s
        ]
    )
  end

  def established?
    state == ESTABLISHED && !deleted_at?
  end

  # reject can be 3 things:
  # - break established friendship
  # - cancel open friend request (from me to someone else)
  # - refuse open friend request (from someone else to me)
  def reject
    if established?
      remove_activity('unfriend')
      remove_activity
      user.unfollow(friend)
      friend.unfollow(user)
    else
      remove_activity
    end
    update!(state: REJECTED) unless deleted_at?
  end

  def rejected?
    state == REJECTED && !deleted_at?
  end

  # when user deactivates account, need to preserve state
  # also called when friendships end
  # -> not anymore. This wasn't a good idea, inactivate should ONLY be called
  # if a user inactivates his account, because otherwise all
  # canceled friendships would be re-enabled when the user
  # reactivates his profile.
  def inactivate
    remove_activity('unfriend')
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
    create_activity
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

  def humanize(concerned_user = nil)
    if state == OFFERED
      case concerned_user
      when friend then "pending passive"
      when user then "pending active"
      when nil then "pending"
      end
    elsif state == ESTABLISHED
      "friend"
    else
      "stranger"
    end
  end

  ## Activity Methods ##

  private def activity_target
    friend
  end

  private def activity_actor
    user
  end

  private def activity_foreign
    friend
  end

  private def activity_action
    established? ? 'friendship' : (offered? ? 'request' : '')
  end

  private def activity_notify
    []
  end
end
