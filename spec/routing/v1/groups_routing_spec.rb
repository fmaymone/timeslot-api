require "rails_helper"

RSpec.describe V1::GroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/groups")
        .to route_to("v1/groups#index", format: :json)
    end

    it "routes to #show" do
      expect(get: "/v1/groups/1")
        .to route_to("v1/groups#show", id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "/v1/groups")
        .to route_to("v1/groups#create", format: :json)
    end

    it "routes to #update" do
      expect(patch: "/v1/groups/1")
        .to route_to("v1/groups#update", id: "1", format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "/v1/groups/1")
        .to route_to("v1/groups#destroy", id: "1", format: :json)
    end

    it "does't route to #new" do
      expect(get: "/v1/groups/new")
        .not_to route_to("v1/groups#new", format: :json)
    end

    it "doesn't route to #edit" do
      expect(get: "/v1/groups/1/edit")
        .not_to route_to("v1/groups#edit", id: "1", format: :json)
    end

    it "routes to #invite" do
      expect(post: "/v1/groups/1/members/2")
        .to route_to(
              "v1/groups#invite", group_id: "1", user_id: "2", format: :json)
    end
  end
end
