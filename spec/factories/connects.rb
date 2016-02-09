FactoryGirl.define do
  # default provider is facebook
  factory :connect do
    user
    social_id 10_152_854_206_708_061

    before :create do |connect|
      Rails.application.load_seed
      connect.provider = Provider.find_by name: 'facebook'
    end

    trait :twitter do
      social_id 3_186_786_310
      before :create do |connect|
        connect.provider = Provider.find_by name: 'twitter'
      end
    end
  end
end
