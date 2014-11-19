FactoryGirl.define do
  factory :slot_setting do
    association :user, strategy: :build
    association :meta_slot, strategy: :build
  end
end
