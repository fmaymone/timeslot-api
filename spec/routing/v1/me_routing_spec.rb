require "rails_helper"

RSpec.describe V1::MeController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/v1/me")
        .to route_to("v1/me#show", format: :json)
    end

    it "routes to #signout" do
      expect(get: "/v1/me/signout")
        .to route_to("v1/me#signout", format: :json)
    end

    it "routes to #update" do
      expect(patch: "/v1/me")
        .to route_to("v1/me#update", format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "/v1/me")
        .to route_to("v1/me#destroy", format: :json)
    end

    it "routes to #media" do
      expect(get: "/v1/me/media")
        .to route_to("v1/me#media_items", format: :json)
    end

    it "routes to #slots" do
      expect(get: "/v1/me/slots")
        .to route_to("v1/me#slots", format: :json)
    end

    it "routes to #slots_from_friends" do
      expect(get: "/v1/me/friendslots")
        .to route_to("v1/me#slots_from_friends", format: :json)
    end

    it "routes to #add_friends" do
      expect(post: "/v1/me/add_friends")
        .to route_to("v1/me#add_friends", format: :json)
    end

    it "routes to #remove_friends" do
      expect(post: "/v1/me/remove_friends")
        .to route_to("v1/me#remove_friends", format: :json)
    end
  end
end
