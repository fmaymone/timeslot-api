class Location < ActiveRecord::Base
  establish_connection :development_sec
end
