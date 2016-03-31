FactoryGirl.define do
  factory :global_slot, class: GlobalSlot, parent: :slot do
    slot_uuid '820304fe-a416-db0d-807e-90cb9ebd9f1b'

    trait :with_details do
      url "http://www.dfb.de/europa-league/saisonplan?spieledb_path=matches32"
      after :create do |slot|
        create :note,
               title: 'Description',
               content: "Champions League, 2015/2016, Gruppe A",
               slot: slot
        create :slot_image,
               mediable: slot,
               public_id: 'http://assets.dfb.de/public/uploads/c46d55d78dc6',
               creator: slot.creator
      end
    end

    trait :without_description do
      slot_uuid 'c3c5ccd4-d1e4-8c16-49fc-aaa31c438eaf'
    end
  end
end
