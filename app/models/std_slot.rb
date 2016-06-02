class StdSlot < BaseSlot
  self.table_name = model_name.plural

  # mapping the frontend string to the class
  STD_SLOT_TYPES = { 'private' => :StdSlotPrivate,
                     'friends' => :StdSlotFriends,
                     'foaf' => :StdSlotFoaf,
                     'public' => :StdSlotPublic
                   }.freeze

  belongs_to :owner, class_name: User, inverse_of: :std_slots

  validates :owner, presence: true

  # TODO: add spec
  def update_visibility(visibility)
    current_follower = followers
    reduce_distribution_by(async: false){
      # Now with the change of the type this is a little bit... hmmm
      # Because I (kind of) do change the class of a loaded instance...
      slot_type = STD_SLOT_TYPES[visibility]
      update(slot_type: SLOT_TYPES[slot_type], type: slot_type.to_s)
      # Update slot visibility
      case visibility
      when 'private'
        # update 'type' column
        becomes!(StdSlotPrivate) # this doesn't run the validations
        # update 'slot_type' column
        self.StdSlotPrivate!
        # update follower manually (may this is not required)
        (passengerships.collect(&:user) - tagged_users).each do |user|
          remove_follower(user)
        end
      when 'friends'
        becomes!(StdSlotFriends)
        self.StdSlotFriends!
        update(share_with_friends: true)
      when 'public'
        becomes!(StdSlotPublic)
        self.StdSlotPublic!
      end
    }
    current_follower -= followers
    # TODO: move this to the distribution definitions
    if visibility == 'private' && current_follower.any?
      # Forward unshare activity to followers (reslotter + tagged users)
      create_activity(
        'private',
        feed_fwd: {
          User: [creator.id.to_s],
          Notification: current_follower
        },
        push_fwd: current_follower.map(&:to_i)
      )
    end
  end

  def update_from_params(meta: nil, visibility: nil, media: nil,
                         notes: nil, alerts: nil, user: nil)

    update_visibility(visibility) if visibility
    super(meta: meta, media: media, notes: notes, alerts: alerts, user: user)
  end

  def related_users
    [owner]
  end

  def prepare_for_deletion
  end

  def self.create_slot(meta_slot:, visibility:, user: nil)
    slot_type = STD_SLOT_TYPES[visibility].to_s.constantize
  rescue NameError
    # a valid value for visibility is already enforced in the controller,
    # so maybe this exception handling is overkill
    msg = "invalid value for visibility: #{visibility}"
    Airbrake.notify(NameError, error_message: msg)
  else
    slot = slot_type.create(meta_slot: meta_slot, owner: user)
    Passengership.create(slot: slot, user: user, show_in_my_schedule: false)
    slot.create_activity
  end

  # for Pundit
  def self.policy_class
    StdSlotPolicy
  end
end
