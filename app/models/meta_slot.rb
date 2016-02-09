class MetaSlot < ActiveRecord::Base
  after_commit AuditLog

  # give 'openEnd' slots an end
  before_validation do |metaslot|
    if open_end || end_date.blank?
      metaslot.end_date = if start_date < start_date.to_datetime.at_middle_of_day
                            start_date.to_datetime.at_end_of_day
                          else
                            start_date.to_datetime.next_day.at_midday
      end
      metaslot.open_end = true
    end
  end

  belongs_to :creator, class_name: User, inverse_of: :created_slots
  has_many :slot_settings, inverse_of: :meta_slot
  has_many :slots, -> { where deleted_at: nil }, class_name: BaseSlot,
           inverse_of: :meta_slot
  belongs_to :ios_location

  validates :creator, presence: true
  validates :title, presence: true, length: { maximum: 60 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :enddate_is_after_startdate

  def location
    GlobalSlotConsumer.new.location(location_uid)
  rescue => e
    Airbrake.notify(e, invalid_candy_location_muid: location_uid)
    nil
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
    meta_id = meta_params[:meta_slot_id]
    MetaSlot.includes(:creator).where(id: meta_id).first_or_create do |meta_slot|
      meta_slot.update(meta_params.except(:ios_location))
      return meta_slot if meta_params[:ios_location].nil?

      ios_params = meta_params[:ios_location]
      if ios_params[:latitude].present? && ios_params[:longitude].present?
        ios_location = IosLocation.find_by(
          latitude: ios_params[:latitude], longitude: ios_params[:longitude])
      end
      ios_location ||= IosLocation.create(
        ios_params.merge(creator: meta_params[:creator]))
      meta_slot.update(ios_location: ios_location)
    end
  end
end
