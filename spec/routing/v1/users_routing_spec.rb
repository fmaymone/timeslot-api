require "rails_helper"

RSpec.describe V1::UsersController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/v1/users/1")
        .to route_to("v1/users#show", id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "/v1/users")
        .to route_to("v1/users#create", format: :json)
    end

    it "routes to #signin" do
      expect(post: "/v1/users/signin")
        .to route_to("v1/users#signin", format: :json)
    end

    it "routes to #media" do
      expect(get: "/v1/users/1/media")
        .to route_to("v1/users#media_items", id: '1', format: :json)
    end

    it "routes to #slots" do
      expect(get: "/v1/users/1/slots")
        .to route_to("v1/users#slots", id: "1", format: :json)
    end

    it "routes to #friends" do
      expect(get: "/v1/users/1/friends")
        .to route_to("v1/users#friends", id: "1", format: :json)
    end
  end
end
