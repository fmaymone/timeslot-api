FactoryGirl.define do
  factory :global_slot, class: GlobalSlot, parent: :slot do
    muid "9155334a-9448-8857-216c-6985def83186"

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
  end
end
