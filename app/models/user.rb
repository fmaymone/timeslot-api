class User < ActiveRecord::Base
  after_commit :audit

  has_one :image, class_name: "MediaItem", as: :mediable
  has_many :own_groups, class_name: "Group", inverse_of: :owner
  has_many :memberships, inverse_of: :user
  has_many :groups, through: :memberships

  validates :username, presence: true, length: { maximum: 20 }

  private def audit
    msg = previous_changes
    msg.merge!(id: id)
    logger.info msg.to_json
  end
end
