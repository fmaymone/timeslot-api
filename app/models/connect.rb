class Connect < ActiveRecord::Base
  belongs_to :user
  # has_one :provider

  validates_presence_of :user, :social_id #, :provider
end
