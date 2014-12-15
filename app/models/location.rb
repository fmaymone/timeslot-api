class Location < ActiveRecord::Base
  if Rails.env.test? || Rails.env.development?
    establish_connection :development_sec
  else
    establish_connection ENV['LOCATION_DB_URI']
  end
end
