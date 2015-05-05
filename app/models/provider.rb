class Provider < ActiveRecord::Base
  # for now there are only 2 providers: facebook, twitter
  # I could have solved this the same way I did for
  # user roles and slot types but I'm yet to find the best
  # balance between ease-of-use and data consistency in the db
  validates :name, presence: true, uniqueness: true
end
