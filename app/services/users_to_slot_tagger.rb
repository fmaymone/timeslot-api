class UsersToSlotTagger
  # creates a passengership for every supplied user, sets the permission to
  # add media to the given slot to 'true'
  # TODO: creates a notification for the tagged users informing them about this
  def initialize(slot)
    @slot = slot
  end

  def tag(user_ids)
    users = User.find(user_ids)
    users.each do |user|
      ps = user.passengerships.find_or_create_by(slot: @slot)
      ps = user.passengerships.where(slot: @slot).first_or_create
      ps.update(add_media_permission: true)
      # ps.create_activity
    end
  end
end
