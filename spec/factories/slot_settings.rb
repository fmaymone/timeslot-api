FactoryGirl.define do
  factory :slot_setting do
    association :user, strategy: :build
    association :meta_slot, strategy: :build
    alerts '0011101000'
  end
end
