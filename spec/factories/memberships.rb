FactoryGirl.define do
  factory :membership do
    user
    group
    notifications true
    state "11"
  end
end
