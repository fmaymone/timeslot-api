FactoryGirl.define do
  # in some places I'm only loading 'upcoming' slots, so at some point in 2019
  # the testdata will not fullfill this
  factory :meta_slot do
    creator
    sequence(:title) { |n| "Slot title #{n}" }
    sequence(:start_date, 1) { |n| "2019-09-#{(n % 27) + 1} #{n % 24}:44:02}" }
    sequence(:end_date, 1) { |n| "2019-10-#{(n % 27) + 1} #{n % 24}:44:02}" }
  end

  trait :with_ioslocation do
    ios_location
  end
end
