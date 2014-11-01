require 'rails_helper'

RSpec.describe V1::SlotsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/v1/slots/1")
        .to route_to("v1/slots#show", id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "/v1/slots")
        .to route_to("v1/slots#create", format: :json)
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/slots/1")
        .to route_to("v1/slots#update", id: "1", format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "/v1/slots/1")
        .to route_to("v1/slots#destroy", id: "1", format: :json)
    end

    it "does not route to #index" do
      expect(get: "/v1/slots").not_to be_routable
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
