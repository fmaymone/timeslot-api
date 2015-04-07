class MetaSlot < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :creator, class_name: User, inverse_of: :created_slots
  has_many :slot_settings, inverse_of: :meta_slot
  has_many :slots, -> { where deleted_at: nil }, class_name: BaseSlot,
           inverse_of: :meta_slot

  validates :creator, presence: true
  validates :title, presence: true, length: { maximum: 48 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :enddate_is_after_startdate

  def location
    begin
      Location.find(location_id)
    rescue => e
      Airbrake.notify(e)
      nil
    end
  end

  def unregister
    delete if slots.empty?
  end

  def delete
    ts_soft_delete
  end

  private def enddate_is_after_startdate
    return false if end_date.blank? || start_date.blank?
    return true if start_date.to_i < end_date.to_i
    errors.add(:end_date, "can't be before start_date")
  end

  def self.find_or_add(meta_params)
    meta_id = meta_params['meta_slot_id']
    MetaSlot.where(id: meta_id).first_or_create(meta_params)
  end
end
