class StdSlot < BaseSlot
  self.table_name = model_name.plural

  # mapping the frontend string to the class
  STD_SLOT_TYPES = { 'private' => :StdSlotPrivate,
                     'friends' => :StdSlotFriends,
                     'foaf' => :StdSlotFoaf,
                     'public' => :StdSlotPublic
                   }

  scope :unprivate, -> { where.not(slot_type: SLOT_TYPES[:StdSlotPrivate]) }

  belongs_to :owner, class_name: User, inverse_of: :std_slots
  # for some strange reason the association is not found even tough it
  # works for meta_slot just the same
  belongs_to :shared_by, class_name: User

  validates :owner, presence: true

  def update_from_params(meta: nil, visibility: nil, media: nil,
                         notes: nil, alerts: nil, user: nil)
    if visibility
      # Update Follower + Feeds status if visibility change to private
      # NOTE: Update feeds before changing the visibility of the model
      if visibility == 'private'
        # TODO: remove_target_from_feed
        comments.each(&:remove_activity)
        likes.each(&:remove_activity)
        notes.each(&:remove_activity) if notes
        media_items.each(&:remove_activity)
        # TODO: Reslots has to be cleaned up recursively elsewhere in the code
        # Another option is to disable Reslot history of predecessors
        if self.try(:reslots)
          reslots.each do |reslot|
            reslot.comments.each(&:remove_activity)
            reslot.likes.each(&:remove_activity)
            reslot.notes.each(&:remove_activity)
            reslot.media_items.each(&:remove_activity)
            if reslot.try(:reslots)
              reslot.reslots.each(&:remove_activity)
              reslot.reslots.each(&:remove_all_followers)
            end
            reslot.remove_activity
            reslot.remove_all_followers
          end
        end
        remove_activity('private')
        remove_all_followers
      end
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
