FactoryGirl.define do
  factory :ios_location, aliases: [:location] do
    name 'Acapulco'
    latitude '51.234'
    longitude '-11.993'
    creator

    factory :candy_location do
      uuid "411456d2-532a-b0cb-8dc6-c0ea5e8f9488"
      name "Signal Iduna Park"
      locality "Dortmund"
      sub_locality "Mitte"
      administrative_area "NW"
      iso_country_code "DE"
      latitude '51.4940605163574'
      longitude '7.45179986953735'
      creator
    end

    factory :pier_2_bremen do
      uuid "7ffd07c2-4969-8e41-5d47-cade82aac954"
      name "Pier 2"
      locality "Bremen"
      sub_locality "Walle"
      administrative_area "HB"
      postal_code "28237"
      iso_country_code "DE"
      latitude '53.1083112'
      longitude '8.7509019'
      creator
    end
  end
end
