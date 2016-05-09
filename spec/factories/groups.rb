FactoryGirl.define do
  sequence(:name) { |n| "Testgroup #{n}" }

  factory :group, aliases: [:calendar] do
    association :owner, factory: :user, strategy: :build
    name
    uuid { SecureRandom.uuid }
    members_can_post false
    members_can_invite false
    public true

    trait :members_can_post do
      members_can_post true
    end

    trait :global do
      public true
      string_id "soccer_leagues:dfb.de:champions_league"
      association :owner, :gs_category, strategy: :build
    end

    trait :members_can_invite do
      members_can_invite true
    end

    trait :with_image do
      image "sample"
    end

    trait :with_description do
      description "This is a description."
    end

    trait :with_3_members do
      after :create do |group|
        create_list :membership, 3, :active, group: group
      end
    end

    trait :with_3_slots do
      after :create do |group|
        create_list :containership, 3, group: group
      end
    end

    after :create do |group|
      group.owner.follow(group)
    end
  end
end
