require 'rails_helper'

RSpec.describe V1::SlotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/slots")
        .to route_to("v1/slots#index", format: :json)
    end

    it "routes to #show" do
      expect(get: "/v1/slots/1")
        .to route_to("v1/slots#show", id: "1", format: :json)
    end

    it "routes to #show_many" do
      expect(post: "/v1/slots")
        .to route_to("v1/slots#show_many", format: :json)
    end

    it "routes to #create_stdslot" do
      expect(post: "/v1/stdslot")
        .to route_to("v1/slots#create_stdslot", format: :json)
    end

    it "routes to #create_reslot" do
      expect(post: "/v1/reslot")
        .to route_to("v1/slots#create_reslot", format: :json)
    end

    it "routes to #create_groupslot" do
      expect(post: "/v1/groupslot")
        .to route_to("v1/slots#create_groupslot", format: :json)
    end

    it "routes to #update_metaslot via PATCH" do
      expect(patch: "/v1/metaslot/1")
        .to route_to("v1/slots#update_metaslot", id: "1", format: :json)
    end

    it "routes to #update_stdslot via PATCH" do
      expect(patch: "/v1/stdslot/1")
        .to route_to("v1/slots#update_stdslot", id: "1", format: :json)
    end

    it "routes to #update_groupslot via PATCH" do
      expect(patch: "/v1/groupslot/1")
        .to route_to("v1/slots#update_groupslot", id: "1", format: :json)
    end

    it "routes to #update_reslot via PATCH" do
      expect(patch: "/v1/reslot/1")
        .to route_to("v1/slots#update_reslot", id: "1", format: :json)
    end

    it "routes to #destroy_stdslot" do
      expect(delete: "/v1/stdslot/1")
        .to route_to("v1/slots#destroy_stdslot", id: "1", format: :json)
    end

    it "routes to #destroy_groupslot" do
      expect(delete: "/v1/groupslot/1")
        .to route_to("v1/slots#destroy_groupslot", id: "1", format: :json)
    end

    it "routes to #destroy_reslot" do
      expect(delete: "/v1/reslot/1")
        .to route_to("v1/slots#destroy_reslot", id: "1", format: :json)
    end

    it "routes to #create_share_url" do
      expect(get: "/v1/slots/1/share")
        .to route_to("v1/slots#share_url", id: "1", format: :json)
    end

    it "does not route to #new" do
      expect(get: "/v1/slots/new").not_to be_routable
    end

    it "does not route to #edit" do
      expect(get: "/v1/slots/1/edit").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(put: "/v1/slots/1").not_to be_routable
    end
  end
end
