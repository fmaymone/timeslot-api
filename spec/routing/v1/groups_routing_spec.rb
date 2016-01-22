require "rails_helper"

RSpec.describe V1::GroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/groups")
        .to route_to("v1/groups#index", format: :json)
    end

    it "routes to #show" do
      expect(get: "/v1/groups/1")
        .to route_to("v1/groups#show", group_id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "/v1/groups")
        .to route_to("v1/groups#create", format: :json)
    end

    it "routes to #update" do
      expect(patch: "/v1/groups/1")
        .to route_to("v1/groups#update", group_id: "1", format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "/v1/groups/1")
        .to route_to("v1/groups#destroy", group_id: "1", format: :json)
    end

    it "routes to #slots" do
      expect(get: "/v1/groups/1/slots")
        .to route_to(
              "v1/groups#slots_old", group_id: "1", format: :json)
    end

    it "routes to #slots" do
      expect(get: "/v1/groups/b9286b2a-0902-42f7-985a-beac5421db48/slots")
        .to route_to(
              "v1/groups#slots",
              group_uuid: "b9286b2a-0902-42f7-985a-beac5421db48",
              format: :json)
    end

    it "routes to #members" do
      expect(get: "/v1/groups/1/members")
        .to route_to(
              "v1/groups#members", group_id: "1", format: :json)
    end

    it "routes to #related" do
      expect(get: "/v1/groups/1/related")
        .to route_to(
              "v1/groups#related", group_id: "1", format: :json)
    end

    it "routes to #invite" do
      expect(post: "/v1/groups/1/members")
        .to route_to(
              "v1/groups#invite", group_id: "1", format: :json)
    end

    it "routes to #accept_invite" do
      expect(post: "/v1/groups/1/accept")
        .to route_to("v1/groups#accept_invite", group_id: "1", format: :json)
    end

    it "routes to #refuse_invite" do
      expect(post: "/v1/groups/1/refuse")
        .to route_to("v1/groups#refuse_invite", group_id: "1", format: :json)
    end

    it "routes to #leave" do
      expect(delete: "/v1/groups/1/members")
        .to route_to(
              "v1/groups#leave", group_id: "1", format: :json)
    end

    it "routes to #kick" do
      expect(delete: "/v1/groups/1/members/2")
        .to route_to(
              "v1/groups#kick", group_id: "1", user_id: "2", format: :json)
    end

    it "routes to #member_settings" do
      expect(patch: "/v1/groups/1/members")
        .to route_to(
              "v1/groups#member_settings", group_id: "1", format: :json)
    end

    it "does't route to #new" do
      expect(get: "/v1/groups/new")
        .not_to route_to("v1/groups#new", format: :json)
    end

    it "doesn't route to #edit" do
      expect(get: "/v1/groups/1/edit")
        .not_to route_to("v1/groups#edit", group_id: "1", format: :json)
    end
  end
end
