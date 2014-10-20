FactoryGirl.define do
  sequence(:title) { |n| "Slot title #{n}" }

  factory :slot do
    title
    startdate "2014-09-08 13:31:02"
    enddate "2014-09-13 22:03:24"
    note "this is a testslot"
    visibility "11"
    alerts "0101001100"

    factory :slot_with_media do
      images '[{ "img_id": "A", "public_id": "cloudinary1", "ordering": "1"},' \
             '{ "img_id": "B", "public_id": "cloudinary2", "ordering": "2" }]'
      audio "v1234567/dfhjghjkdisudgfds7igg.jpg"
      video "v1234567/dfhjghjkdisudgfds7iyf.jpg"
    end
  end
end
