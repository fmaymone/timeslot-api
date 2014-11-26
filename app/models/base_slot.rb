class BaseSlot < ActiveRecord::Base
  has_many :media_items, as: :mediable, dependent: :destroy
end
