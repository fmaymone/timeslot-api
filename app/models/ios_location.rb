class IosLocation < ActiveRecord::Base
  before_create :set_uuid, if: :uuid_nil?
  after_commit AuditLog

  belongs_to :creator, class_name: User

  validates_presence_of :creator
  validates :name, length: { maximum: 255 }, allow_nil: true
  validates :thoroughfare, length: { maximum: 255 }, allow_nil: true
  validates :sub_thoroughfare, length: { maximum: 255 }, allow_nil: true
  validates :locality, length: { maximum: 255 }, allow_nil: true
  validates :sub_locality, length: { maximum: 255 }, allow_nil: true
  validates :administrative_area, length: { maximum: 255 }, allow_nil: true
  validates :sub_administrative_area, length: { maximum: 255 }, allow_nil: true
  validates :postal_code, length: { maximum: 32 }, allow_nil: true
  validates :country, length: { maximum: 255 }, allow_nil: true
  validates :iso_country_code, length: { maximum: 8 }, allow_nil: true
  validates :in_land_water, length: { maximum: 255 }, allow_nil: true
  validates :ocean, length: { maximum: 255 }, allow_nil: true
  validates :areas_of_interest, length: { maximum: 255 }, allow_nil: true

  private def set_uuid
    self.uuid = SecureRandom.uuid
  end

  private def uuid_nil?
    uuid.nil?
  end
end
