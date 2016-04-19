class Invitecode < ActiveRecord::Base
  belongs_to :user, inverse_of: :invitecodes

  validates :code, presence: true, uniqueness: true, on: :update

  before_create :create_unique_code

  def create_unique_code
    begin
      self.code = SecureRandom.hex(3)
    end while Invitecode.exists?(code: code)
  end
end
