require "rails_helper"

RSpec.describe V1::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/users").to route_to("v1/users#index", format: :json)
    end

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

    it "routes to #signout" do
      expect(get: "/v1/users/signout")
        .to route_to("v1/users#signout", format: :json)
    end

    it "routes to #update" do
      expect(patch: "/v1/users")
        .to route_to("v1/users#update", format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "/v1/users")
        .to route_to("v1/users#destroy", format: :json)
    end

    it "routes to #slots" do
      expect(get: "/v1/users/1/slots")
        .to route_to("v1/users#slots", user_id: "1", format: :json)
    end

    it "routes to #add_friends" do
      expect(post: "/v1/users/add_friends")
        .to route_to("v1/users#add_friends", format: :json)
    end

    it "routes to #remove_friends" do
      expect(post: "/v1/users/remove_friends")
        .to route_to("v1/users#remove_friends", format: :json)
    end
  end
end
