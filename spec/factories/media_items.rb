FactoryGirl.define do
  sequence(:ordering, 0)
  sequence(:public_id) { |n| "/dfhjghjkdisudgfds7iy#{n}.jpg" }

  factory :slot_image, class: "MediaItem" do
    association :mediable, factory: :slot
    media_type "image"
    public_id
    ordering
  end

  factory :user_image, class: "MediaItem" do
    association :mediable, factory: :user
    media_type "image"
    public_id
  end

  factory :group_image, class: "MediaItem" do
    association :mediable, factory: :group
    media_type "image"
    public_id
  end
end
