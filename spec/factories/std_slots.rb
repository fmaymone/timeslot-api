FactoryGirl.define do
  factory :std_slot do
    association :user, strategy: :build
  end
end
