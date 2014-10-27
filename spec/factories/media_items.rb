FactoryGirl.define do
  sequence(:ordering, 0)
  sequence(:public_id) { |n| "cloudinary-#{n}" }

  factory :slot_image, class: "MediaItem" do
    association :mediable, factory: :slot
    media_type "image"
    public_id
    ordering
  end
end
