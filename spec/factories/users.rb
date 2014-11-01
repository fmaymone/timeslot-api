FactoryGirl.define do
  sequence(:username) { |n| "User #{n}" }

  factory :user do
    username
  end
end
