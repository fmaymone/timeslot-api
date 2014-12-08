FactoryGirl.define do
  sequence(:title) { |n| "Slot title #{n}" }

  factory :meta_slot do
    association :creator, factory: :user, strategy: :build
    title
    startdate "2014-09-08 13:31:02"
    enddate "2014-09-13 22:03:24"
  end
end
