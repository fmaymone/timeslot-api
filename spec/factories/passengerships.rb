FactoryGirl.define do
  factory :passengership do
    association :slot, strategy: :build
    association :user, strategy: :build
  end
end
