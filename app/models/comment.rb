class Comment < ActiveRecord::Base
  belongs_to :slot, class_name: BaseSlot, inverse_of: :comments
  belongs_to :user

  validates_presence_of :user, :slot, :content
  validates :content, length: { maximum: 5000 }

  def delete
    update(deleted_at: Time.zone.now)
  end
end
