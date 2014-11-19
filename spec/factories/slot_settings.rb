FactoryGirl.define do
  factory :slot_setting do
    association :user, strategy: :create
    association :slot, strategy: :build
  end
end
