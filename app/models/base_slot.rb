class BaseSlot < ActiveRecord::Base
  # this class is not intended to be used directly
  # but rather as an uniform interface for the specific slot representations
  # it shares postgres inheritance semantics at the db level with its subtypes
  after_commit AuditLog

  scope :active, -> { where(deleted_at: nil) }

  has_many :media_items, as: :mediable, dependent: :destroy
  belongs_to :meta_slot

  delegate :title, to: :meta_slot
  delegate :startdate, to: :meta_slot
  delegate :enddate, to: :meta_slot
  delegate :creator, to: :meta_slot

  def delete
    # TODO: handle alarm/slot_setting
    # TODO: take care of Media Items, Notes, Likes, Comments

    # -> make an "unregister" Method in SlotSetting Class so it can take care itself

    # delete SlotSetting object if one exists and it is only referenced by
    # this reslot or softdeleted slots
    # TODO: add helper within user model to get slot_setting references
    # condition = { meta_slot: self.meta_slot.id }

    # if current_user.slot_settings.where(condition).exists?
    #   unless current_user.std_slots.active.where(condition).exists? ||
    #          current_user.group_slots.active.where(condition).exists?
    #     SoftDelete.call(current_user.slot_settings.where(condition).first)
    #   end
    # end

    # TODO: add spec
    SoftDelete.call(self)
  end
end
