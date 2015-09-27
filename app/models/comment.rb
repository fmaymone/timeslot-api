class Comment < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :slot, class_name: BaseSlot, inverse_of: :comments
  belongs_to :user

  validates_presence_of :user, :slot, :content
  validates :content, length: { maximum: 5000 }

  def delete
    update(deleted_at: Time.zone.now)
  end

  ## -- Trigger activities to Activity Stream >> ##

  include StreamRails::Activity
  as_activity

  def activity_actor
    user.id.to_s
  end

  def activity_verb
    'comment'
  end

  def activity_object
    slot.id.to_s
  end

  def activity_target
    slot.creator.user_id.to_s
  end

  def activity_extra_data
    {
        message: I18n.t('notify_create_comment',
                        name: user.username,
                        title: slot.meta_slot.title),

        slot: Activity.slot_as_json(slot, user)
    }
  end
  ## << Trigger End -- ##
end
