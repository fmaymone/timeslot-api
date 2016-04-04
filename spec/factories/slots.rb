FactoryGirl.define do
  factory :slot, class: BaseSlot do
    association :meta_slot, strategy: :build
    slot_uuid "0f2bddbb-c75c-a994-1af9-5ce7ea36c397"

    after(:build) { |slot| slot.type = slot.class }
  end

  trait :with_candy_location do
    location_uid '89840bc4-99fc-bc22-4168-285003ecfd12'
    association :meta_slot, :with_candylocation, strategy: :build
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
      create_list :video, 2, mediable: slot, creator: slot.creator
      create_list :audio, 1, mediable: slot, creator: slot.creator
    end
  end
end
