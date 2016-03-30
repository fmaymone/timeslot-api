class Invitecode < ActiveRecord::Base
  belongs_to :user, inverse_of: :invitecodes

  before_create :create_unique_code

  def create_unique_code
    begin
      self.code = SecureRandom.hex(6)
    end while self.class.exists?(:code => code)
  end
end
