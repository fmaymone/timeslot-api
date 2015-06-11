FactoryGirl.define do
  factory :ios_location, aliases: [:location] do
    name 'Acapulco'
    latitude '51.234'
    longitude '-11.993'
    creator
  end
end
