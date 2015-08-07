FactoryGirl.define do
  factory :slot, class: BaseSlot do
    association :meta_slot, strategy: :build
  end

  trait :with_location do
    location_id 200_719_253
  end

  trait :with_ios_location do
    association :meta_slot, :with_ioslocation, strategy: :build
  end

  trait :with_real_image do
    after :create do |slot|
      create :real_slot_image, mediable: slot
    end
  end

  trait :with_note do
    after :create do |slot|
      create :note, slot: slot
    end
  end

  trait :with_notes do
    after :create do |slot|
      create_list :note, 3, slot: slot
    end
  end

  trait :with_likes do
    after :create do |slot|
      create_list :like, 3, slot: slot
    end
  end

  trait :with_comments do
    after :create do |slot|
      create_list :comment, 3, slot: slot
    end
  end

  trait :with_media do
    after :create do |slot|
      create_list :slot_image, 3, mediable: slot, creator: slot.creator
    end
  end
end
