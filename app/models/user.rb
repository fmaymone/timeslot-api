class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 20 }
end
