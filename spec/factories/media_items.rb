FactoryGirl.define do
  sequence(:ordering, 0)
  sequence(:public_id) { |n| "dfhjghjkdisudgfds7iy#{n}" }

  factory :slot_image, class: "MediaItem" do
    association :mediable, factory: :base_slot
    media_type "image"
    public_id
    ordering
  end

  factory :mock_image, class: "MediaItem" do
    association :mediable, factory: :user
    media_type "image"
    public_id
  end

  factory :real_image, class: "MediaItem" do
    association :mediable, factory: :user
    media_type "image"
    public_id "sample"
  end

  factory :voice, class: "MediaItem" do
    association :mediable, factory: :base_slot
    media_type "voice"
    public_id
    ordering
  end

  factory :video, class: "MediaItem" do
    association :mediable, factory: :base_slot
    media_type "video"
    public_id
    ordering
  end
end
