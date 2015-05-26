FactoryGirl.define do
  factory :meta_slot do
    creator
    sequence(:title) { |n| "Slot title #{n}" }
    start_date "2014-09-28 13:31:02"
    sequence(:end_date, 1) { |n| "2014-10-#{(n % 27) + 1} #{n % 24}:44:02}" }
    ios_location
  end
end
