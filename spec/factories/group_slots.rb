FactoryGirl.define do
  factory :group_slot do
    association :group, strategy: :build
  end
end
