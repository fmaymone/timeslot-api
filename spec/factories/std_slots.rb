FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :slot do
    association :owner, factory: :user, strategy: :build

    transient do
      show_in_calendar true
      tag_user nil
    end

    after :create do |slot, factory|
      create :passengership, slot: slot, user: slot.owner,
             show_in_my_schedule: factory.show_in_calendar,
             add_media_permission: false
      if factory.tag_user
        create :passengership, slot: slot, user: factory.tag_user,
               show_in_my_schedule: factory.show_in_calendar,
               add_media_permission: true
      end
    end
  end

  factory :std_slot_private, class: StdSlotPrivate, parent: :std_slot do
  end

  factory :std_slot_friends, class: StdSlotFriends, parent: :std_slot do
    share_with_friends true
  end

  # this is not used
  factory :std_slot_foaf, class: StdSlotFoaf, parent: :std_slot do
  end

  # a slot is public when at least one public group/calender contains it
  factory :std_slot_public, class: StdSlotPublic, parent: :std_slot do
    after :create do |slot|
      build :containership, slot: slot
    end
  end
end
