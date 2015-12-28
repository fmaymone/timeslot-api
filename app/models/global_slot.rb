class GlobalSlot < BaseSlot
  self.table_name = model_name.plural

  after_commit AuditLog

  validates :muid, presence: true

  def self.create_slot(meta:, user:, muid:, url: nil, media: nil, notes: nil,
                       _tags: nil)

    meta_slot = MetaSlot.find_or_add(meta.merge(creator: user))
    return meta_slot unless meta_slot.errors.empty?

    slot = create(meta_slot: meta_slot, muid: muid, url: url)
    return slot unless slot.errors.empty?

    if media || notes
      slot.update_from_params(media: media, notes: notes, user: user)
    end

    slot.create_activity
  end

  def self.find_or_create(muid)
    global_slot = find_by(muid: muid)
    return global_slot if global_slot

    attributes = GlobalSlotConsumer.new.slot(muid)
    create_slot(attributes)
  end

  def self.visibility
    'public'
  end
end
