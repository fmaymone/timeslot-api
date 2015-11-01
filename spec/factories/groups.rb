FactoryGirl.define do
  sequence(:name) { |n| "Testgroup #{n}" }

  factory :group do
    association :owner, factory: :user, strategy: :build
    name
    members_can_post false
    members_can_invite false

    trait :members_can_post do
      members_can_post true
    end

    trait :members_can_invite do
      members_can_invite true
    end

    trait :with_image do
      image "sample"
    end

    trait :with_3_members do
      after :create do |group|
        create_list :membership, 3, :active, group: group
      end
    end
  end
end
