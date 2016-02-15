FactoryGirl.define do
  factory :ios_location, aliases: [:location] do
    name 'Acapulco'
    latitude '51.234'
    longitude '-11.993'
    creator

    factory :candy_location do
      uuid "89840bc4-99fc-bc22-4168-285003ecfd12"
      name "Signal Iduna Park"
      locality "Dortmund"
      sub_locality "Mitte"
      administrative_area "NW"
      iso_country_code "DE"
      latitude '51.4940605163574'
      longitude '7.45179986953735'
      creator
    end
  end
end
