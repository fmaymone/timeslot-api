class Note < ActiveRecord::Base
  belongs_to :base_slot, inverse_of: :notes

  validates :base_slot, presence: true
  validates :title, presence: true # max length?
  validates :content, presence: true # max length?
end
