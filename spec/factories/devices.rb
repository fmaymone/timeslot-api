FactoryGirl.define do
  sequence(:device_id) { |n| "sn-#{n}34628734108347867654395#{n}" }
  sequence(:token) { |n| "a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2e#{n}" }
  sequence(:endpoint) { |n| "arn:aws:sns:us-west-2:293488554927:endpoint/APNS_SANDBOX/Timeslot-iOS/bac63567-f197-3aa2-8e24-77e567cfa04#{n}" }

  factory :device do
    user
    device_id
    system 'ios'
    version '6.0'
  end

  trait :with_endpoint do
    token
    endpoint
  end
end
