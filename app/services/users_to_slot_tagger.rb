class UsersToSlotTagger
  # creates a passengership for every supplied user, sets the permission to
  # add media to the given slot to 'true'
  # TODO: creates a notification for the tagged users informing them about this
  def initialize(slot)
    @slot = slot
  end

  def tag(user_ids, initiator = nil)
    users = User.find(user_ids)
    users.each do |user|
      ps = user.passengerships.find_or_initialize_by(slot: @slot)
      new_instance = !ps.persisted? && ps.save
      ps.update(add_media_permission: true) if initiator.nil? || (initiator == @slot.creator)
      user.follow(@slot)
      ps.initiator = initiator if initiator
      ps.create_activity if new_instance
    end
  end
end
