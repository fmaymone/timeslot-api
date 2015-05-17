class Location < ActiveRecord::Base
  establish_connection ENV['LOCATION_DB_URI']
end
