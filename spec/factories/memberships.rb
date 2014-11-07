FactoryGirl.define do
  factory :membership do
    association :user, strategy: :build
    association :group, strategy: :build
    notifications true
    state "000"
  end
end
