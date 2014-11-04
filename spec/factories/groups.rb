FactoryGirl.define do
  sequence(:name) { |n| "Testgroup #{n}" }

  factory :group do
    owner
    name
    subs_can_post true
    subs_can_invite false

    trait :with_image do
      after :create do |group|
        create :group_image, mediable: group
      end
    end
  end
end
