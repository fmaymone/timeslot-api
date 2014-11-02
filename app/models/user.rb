class User < ActiveRecord::Base
  has_many :groups, inverse_of: :owner

  validates :username, presence: true, length: { maximum: 20 }
end
