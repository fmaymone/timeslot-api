FactoryGirl.define do

  factory :meta_slot do
    association :creator, factory: :user, strategy: :build
    sequence(:title) { |n| "Slot title #{n}" }
    start_date "2014-09-08 13:31:02"
    end_date "2014-09-13 22:03:24"
  end
end
