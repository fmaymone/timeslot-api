class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User", inverse_of: :groups
  has_one :image, class_name: "MediaItem", as: :mediable

  validates :name, presence: true
  validates :owner, presence: true
end
