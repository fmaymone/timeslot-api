class Friendship < ActiveRecord::Base
  include UserActivity
  include TSErrors

  after_commit AuditLog
  before_create :check_duplicate

  scope :active, -> { where(deleted_at: nil) }

  belongs_to :user, inverse_of: :initiated_friendships
  belongs_to :friend, class_name: User, inverse_of: :received_friendships

  validates :user, presence: true
  validates :friend, presence: true
  validates :state, presence: true

  attr_accessor :initiator

  @initiator = nil

  def offer(active_user = nil)
    update!(state: OFFERED) unless deleted_at?
    # temporary fix:
    # not the most elegant solution but because the first user is considered
    # the one who initiated the friendship (active) we need to switch users
    # if the second user is (re-) initiating a broken friendship again
    # TODO: I wan't to do a major upgrade on the friendships (TML-152)
    update!(friend: user, user: active_user) if active_user == friend
    # Accept friendship automatically if user profile is public
    if friend.public_user?
      accept
    else
      create_activity
    end
  end

  def offered?
    state == OFFERED && !deleted_at?
  end

  def accept
    remove_activity
    update!(state: ESTABLISHED)
    user.follow(friend)
    friend.follow(user)
    create_activity('friendship')
    create_activity('accept')
  end

  def established?
    state == ESTABLISHED && !deleted_at?
  end

  # reject can be 3 things:
  # - break established friendship
  # - cancel open friend request (from me to someone else)
  # - refuse open friend request (from someone else to me)
  def reject(initiator: nil)
    if established?
      user.unfollow(friend)
      friend.unfollow(user)
      RemoveJob.perform_later(friends: [user, friend])
      @initiator = initiator if initiator
      update_activity('unfriend')
    else
      update_activity('reject')
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
  def inactivate(initiator: nil)
    user.unfollow(friend)
    friend.unfollow(user)
    friend.touch
    RemoveJob.perform_later(friends: [user, friend])
    @initiator = initiator if initiator
    update_activity('inactivate')
    ts_soft_delete
  end

  def activate
    return if friend.deleted_at?
    update!(deleted_at: nil)
    friend.touch
    if established?
      user.follow(friend)
      friend.follow(user)
    end
  end

  private def check_duplicate
    # also prevents friendship with oneself
    if Friendship.where(user_id: friend_id, friend_id: user_id).exists? || (user_id == friend_id)
      msg = "reverse friendship from #{user_id} to #{friend_id} already exists"
      Rails.logger.warn {{ duplicate_friendship: msg }}
      Airbrake.notify(DuplicateEntry, duplicate_friendship: msg)
      raise DuplicateEntry, duplicate_friendship: msg
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

  private def activity_actor
    @initiator || (established? ? friend : user)
  end

  private def activity_target
    if @initiator
      @initiator == user ? friend : user
    else
      established? ? user : friend
    end
  end

  private def activity_action
    if established?
      'friendship'
    elsif offered?
      'request'
    end
  end
end
