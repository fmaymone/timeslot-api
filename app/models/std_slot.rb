class StdSlot < BaseSlot
  self.table_name = model_name.plural

  # mapping the frontend string to the class
  STD_SLOT_TYPES = { 'private' => :StdSlotPrivate,
                     'friends' => :StdSlotFriends,
                     'foaf' => :StdSlotFoaf,
                     'public' => :StdSlotPublic
                   }

  belongs_to :owner, class_name: User, inverse_of: :std_slots
  # for some strange reason the association is not found even tough it
  # works for meta_slot just the same
  belongs_to :shared_by, class_name: User

  validates :owner, presence: true

  def update_from_params(meta: nil, visibility: nil, media: nil,
                         notes: nil, alerts: nil, user: nil)
    if visibility
      slot_type = STD_SLOT_TYPES[visibility]
      update(slot_type: SLOT_TYPES[slot_type])
    end
    super(meta: meta, media: media, notes: notes, alerts: alerts, user: user)
  end

  def reslots
    # this should not include private reslots
    # TODO: change it when we have reslots with different visibilities
    ReSlot.where parent_id: id
  end

  def reslot_count
    ReSlot.unscoped.where(parent_id: id).count
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
    slot_type.create(meta_slot: meta_slot, owner: user)
  end

  # for Pundit
  def self.policy_class
    StdSlotPolicy
  end
end
