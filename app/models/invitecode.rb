class Invitecode < ActiveRecord::Base
  belongs_to :user, inverse_of: :invitecodes

  before_validation :create_unique_code

  validates :code, presence: true, uniqueness: true

  scope :active, -> { where deleted_at: nil }

  def create_unique_code
    begin
      self.code = SecureRandom.hex(3)
    end while Invitecode.exists?(code: code)
  end
end
