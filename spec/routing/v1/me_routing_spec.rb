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

    it "routes to #inactivate" do
      expect(delete: "/v1/me")
        .to route_to("v1/me#inactivate", format: :json)
    end

    it "routes to #my_slots" do
      expect(get: "/v1/me/slots")
        .to route_to("v1/me#my_slots", format: :json)
    end

    it "routes to #calendar" do
      expect(get: "/v1/me/calendar")
        .to route_to("v1/me#calendar", format: :json)
    end

    it "routes to #slots_of_my_friends" do
      expect(get: "/v1/me/friendslots")
        .to route_to("v1/me#slots_of_my_friends", format: :json)
    end

    it "routes to #media" do
      expect(get: "/v1/me/media")
        .to route_to("v1/me#my_media_items", format: :json)
    end

    it "routes to #suggested_users" do
      expect(get: "/v1/me/suggested_users")
        .to route_to("v1/me#suggested_users", format: :json)
    end

    it "routes to #add_friends" do
      expect(post: "/v1/me/add_friends")
        .to route_to("v1/me#add_friends", format: :json)
    end

    it "routes to #remove_friends" do
      expect(post: "/v1/me/remove_friends")
        .to route_to("v1/me#remove_friends", format: :json)
    end

    it "routes to #befriend" do
      expect(post: "/v1/me/friendship/1")
        .to route_to("v1/me#befriend", user_id: "1", format: :json)
    end

    it "routes to #unfriend" do
      expect(delete: "/v1/me/friendship/1")
        .to route_to("v1/me#unfriend", user_id: "1", format: :json)
    end

    it "routes to #update_device" do
      expect(patch: "/v1/me/device")
        .to route_to("v1/me#update_device", format: :json)
    end
  end
end
