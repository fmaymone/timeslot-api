FactoryGirl.define do
  factory :global_slot, class: GlobalSlot, parent: :slot do
    cuid "610912da-6b41-41f8-a101-39c1c4a06c6c"
    duid "4b74f2a6-fd25-dac6-9b9b-76facfd025ca"
    crawler_id 8008212
    url "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2230223"
  end
end
