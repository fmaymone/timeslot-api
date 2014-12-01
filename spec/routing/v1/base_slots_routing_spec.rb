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

    it "routes to #update_metaslot via PATCH" do
      expect(patch: "/v1/metaslot/1")
        .to route_to("v1/base_slots#update_metaslot", id: "1", format: :json)
    end

    it "routes to #destroy_stdslot" do
      expect(delete: "/v1/stdslot/1")
        .to route_to("v1/base_slots#destroy_stdslot", id: "1", format: :json)
    end

    it "routes to #destroy_groupslot" do
      expect(delete: "/v1/groupslot/1")
        .to route_to("v1/base_slots#destroy_groupslot", id: "1", format: :json)
    end

    it "routes to #destroy_reslot" do
      expect(delete: "/v1/reslot/1")
        .to route_to("v1/base_slots#destroy_reslot", id: "1", format: :json)
    end
  end
end
