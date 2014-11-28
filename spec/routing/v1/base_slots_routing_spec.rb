require "rails_helper"

RSpec.describe V1::BaseSlotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/slots")
        .to route_to("v1/base_slots#index", format: :json)
    end

    it "routes to #create_stdslot" do
      expect(
        post: "/v1/stdslot").to route_to("v1/base_slots#create_stdslot", format: :json)
    end

    it "routes to #create_reslot" do
      expect(
        post: "/v1/reslot").to route_to("v1/base_slots#create_reslot", format: :json)
    end

    it "routes to #create_groupslot" do
      expect(
        post: "/v1/groupslot").to route_to("v1/base_slots#create_groupslot", format: :json)
    end
  end
end
