class StdSlot < BaseSlot
  self.table_name = model_name.plural

  # mapping the frontend string to the class
  STD_SLOT_TYPES = { 'private' => :StdSlotPrivate,
                     'friends' => :StdSlotFriends,
                     'foaf' => :StdSlotFoaf,
                     'public' => :StdSlotPublic
                   }.freeze

  scope :unprivate, -> { where.not(slot_type: SLOT_TYPES[:StdSlotPrivate]) }

  belongs_to :owner, class_name: User, inverse_of: :std_slots

  validates :owner, presence: true

  def update_from_params(meta: nil, visibility: nil, media: nil,
                         notes: nil, alerts: nil, user: nil)
    if visibility
      # Update Follower + Feeds status if visibility change to private
      # NOTE: Update feeds before changing the visibility of the model
      # TODO: Clarify Group Visibility VS. Slot Visibility !!!
      if visibility == 'private'
        remove_all_activities('private', target: self)
        remove_all_followers
      end
      slot_type = STD_SLOT_TYPES[visibility]
      # Now with the change of the type this is a little bit... hmmm
      # Because I (kind of) do change the class of a loaded instance...
      update(slot_type: SLOT_TYPES[slot_type], type: slot_type.to_s)
    end
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
    Passengership.create(slot: slot, user: user)
    slot.create_activity
  end

  # for Pundit
  def self.policy_class
    StdSlotPolicy
  end
end
