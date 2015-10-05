FactoryGirl.define do

  factory :slot_channel, class: SlotChannel do
    #association :follower, factory: :user, strategy: :build
    #association :slot, factory: :std_slot_public, strategy: :build

    #association :slot, factory: :std_slot_public, strategy: :build
    association :follower, factory: :user, strategy: :build
    slot
    #follower
  end

  factory :group_channel, class: GroupChannel do
    #association :follower, factory: :user, strategy: :build
    #association :group, strategy: :build

    #association :group, strategy: :build
    association :follower, factory: :user, strategy: :build
    group
    #follower
  end

  factory :user_channel, class: UserChannel do
    #association :follower, factory: :user, strategy: :build
    #association :user, strategy: :build

    #association :user, strategy: :build
    association :follower, factory: :user, strategy: :build
    user
    #follower
  end

  # trait :with_follower do
  #   association :follower, factory: :user, strategy: :build
  # end
end
