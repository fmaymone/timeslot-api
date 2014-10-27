class MediaItem < ActiveRecord::Base
  belongs_to :mediable, polymorphic: true

  validates :media_type, presence: true # , length: { maximum: 12 }
  validates :public_id, presence: true
  validates :ordering, presence: true
  validates :mediable_id, presence: true
  validates :mediable_type, presence: true

  def self.reorder_media?(order_params)
    return false unless self.valid_ordering? order_params

    # TODO: might need to validate new media item before reordering
    order_params.each do |item|
      changed = MediaItem.where(id: item[:media_item_id])
                .update_all(ordering: item[:ordering])
      fail ActiveRecord::RecordNotFound if changed == 0
    end
    true
  end

  def self.valid_ordering?(parameter)
    arr = parameter.map { |i| i[:ordering].to_i }
    no_gaps = arr.size > arr.max
    dups = arr.find { |e| arr.rindex(e) != arr.index(e) }
    # @slot.errors.add(:duplicate_ordering, dups) if dups
    dups.nil? && no_gaps
  end
end
