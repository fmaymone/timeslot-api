class Comment < ActiveRecord::Base
  include SlotActivity

  after_commit AuditLog

  belongs_to :user
  belongs_to :slot, class_name: BaseSlot, inverse_of: :comments,
             counter_cache: true

  validates_presence_of :user, :slot, :content
  validates :content, length: { maximum: 5000 }

  def delete
    remove_activity
    update(deleted_at: Time.zone.now)
  end

  ## Activity Methods ##

  private

  def activity_target
    slot
  end

  def activity_actor
    user
  end

  def activity_verb
    'comment'
  end
end
