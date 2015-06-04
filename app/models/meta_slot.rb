class MetaSlot < ActiveRecord::Base
  after_commit AuditLog

  # set 'openEnd' slots to end at the end of the starting day
  before_validation do |metaslot|
    if end_date.nil? && start_date
      # need to cast to_datetime bc of different millisecond precision
      if start_date < start_date.to_datetime.at_middle_of_day
        metaslot.update(end_date: start_date.to_datetime.at_end_of_day)
      else
        metaslot.update(end_date: start_date.to_datetime.next_day.at_midday)
      end
      metaslot.update(open_end: true)
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
    Location.find(location_id)
  rescue => e
    Airbrake.notify(e)
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
    MetaSlot.where(id: meta_id).first_or_create do |meta_slot|
      meta_slot.update(meta_params.except(:ios_location))
      return meta_slot if meta_params[:ios_location].nil?

      ios_params = meta_params[:ios_location]
      if ios_params[:auid].present?
        ios_location = IosLocation.find_by(auid: ios_params[:auid])
      elsif ios_params[:latitude].present? && ios_params[:longitude].present?
        ios_location = IosLocation.where(
          latitude: ios_params[:latitude], longitude: ios_params[:longitude]).take
      end
      ios_location ||= IosLocation.create(
        ios_params.merge(creator: meta_params[:creator]))
      meta_slot.update(ios_location: ios_location)
    end
  end
end
