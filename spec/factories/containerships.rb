FactoryGirl.define do
  factory :containership do
    association :slot, strategy: :build
    association :group, strategy: :build
  end
end
