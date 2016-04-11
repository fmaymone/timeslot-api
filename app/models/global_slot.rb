class GlobalSlot < BaseSlot
  self.table_name = model_name.plural

  after_commit AuditLog

  def self.create_slot(meta:, user:, muid:, url: nil, media: nil, notes: nil,
                       _tags: nil)

    meta_slot = MetaSlot.find_or_add(meta.merge(creator: user))
    return meta_slot unless meta_slot.errors.empty?

    slot = create(meta_slot: meta_slot, slot_uuid: muid, url: url)
    return slot unless slot.errors.empty?

    if media || notes
      slot.update_from_params(media: media, notes: notes, user: user)
    end

    slot.create_activity
  end

  def self.find_or_create(muid)
    global_slot = includes(:meta_slot).find_by(slot_uuid: muid)
    return global_slot if global_slot

    attributes = load_from_candy_shop(muid)
    create_slot(attributes)
  end

  def self.visibility
    'public'
  end

  class << self
    private def load_from_candy_shop(muid)
      attributes = GlobalSlotConsumer.new.slot(muid)
      user_uuid = attributes.delete(:category_uuid)
      attributes[:user] = category_as_user(user_uuid)
      attributes
    end

    private def category_as_user(user_uuid)
      category_user = User.find_by user_uuid: user_uuid
      category_user ||= GlobalSlotConsumer.new.category(user_uuid)
      category_user
    end
  end
end
