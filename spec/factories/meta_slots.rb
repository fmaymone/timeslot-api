FactoryGirl.define do
  factory :meta_slot do
    association :user, strategy: :create
    association :slot, strategy: :build
  end
end
