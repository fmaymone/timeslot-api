FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :slot do
    # association :owner, factory: :user, strategy: :build
    owner { creator } # so far, owner and creator are always the same
    # owner can be overwritten if passed to the factory on creation

    transient do
      show_in_calendar true
      tag_user nil
      in_calendar nil
    end

    after :create do |slot, factory|
      # create passengership for the slot creator by default
      create :passengership, slot: slot, user: slot.creator,
             show_in_my_schedule: factory.show_in_calendar,
             add_media_permission: false

      # allows easy tagging of a user to a slot
      if factory.tag_user
        create :passengership, slot: slot, user: factory.tag_user,
               show_in_my_schedule: factory.show_in_calendar,
               add_media_permission: true
      end

      # allows puting slot in a calendar
      if factory.in_calendar
        create :containership, slot: slot, group: factory.in_calendar
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
