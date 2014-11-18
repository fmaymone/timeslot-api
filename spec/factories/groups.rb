FactoryGirl.define do
  sequence(:name) { |n| "Testgroup #{n}" }

  factory :group do
    association :owner, factory: :user, strategy: :build
    name
    members_can_post true
    members_can_invite false

    trait :with_image do
      after :create do |group|
        create :mock_image, mediable: group
      end
    end

    trait :with_3_members do
      after :create do |group|
        create_list :membership, 3, :active, group: group
      end
    end
  end
end
