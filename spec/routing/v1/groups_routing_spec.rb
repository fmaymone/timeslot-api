require "rails_helper"

RSpec.describe V1::GroupsController, type: :routing do
  describe "routing" do
    let(:uuid) { '04f7504b-3e96-4dbb-ac94-4998f1574bbe' }
    let(:invalid_uuid) { '04f7504b-3e96-4dbb-ac94-4998f1574KKK' }

    it "routes to #show" do
      expect(get: "/v1/groups/#{uuid}")
        .to route_to("v1/groups#show", group_uuid: uuid, format: :json)
    end

    it "doesn't route to #show if uuid invalid" do
      expect(get: "/v1/groups/#{invalid_uuid}")
        .not_to route_to("v1/groups#show")
    end

    it "routes to #create" do
      expect(post: "/v1/groups")
        .to route_to("v1/groups#create", format: :json)
    end

    it "routes to #update" do
      expect(patch: "/v1/groups/#{uuid}")
        .to route_to("v1/groups#update", group_uuid: uuid, format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "/v1/groups/#{uuid}")
        .to route_to("v1/groups#destroy", group_uuid: uuid, format: :json)
    end

    it "routes to #slots" do
      expect(get: "/v1/groups/#{uuid}/slots")
        .to route_to("v1/groups#slots", group_uuid: uuid, format: :json)
    end

    it "routes to #members" do
      expect(get: "/v1/groups/#{uuid}/members")
        .to route_to("v1/groups#members", group_uuid: uuid, format: :json)
    end

    it "routes to #related" do
      expect(get: "/v1/groups/#{uuid}/related")
        .to route_to("v1/groups#related", group_uuid: uuid, format: :json)
    end

    it "routes to #subscribe" do
      expect(post: "/v1/calendars/#{uuid}/subscribe")
        .to route_to("v1/groups#subscribe", slotgroup_uuid: uuid, format: :json)
    end

    it "routes to #invite" do
      expect(post: "/v1/groups/#{uuid}/members")
        .to route_to("v1/groups#invite", group_uuid: uuid, format: :json)
    end

    it "routes to #accept_invite" do
      expect(post: "/v1/groups/#{uuid}/accept")
        .to route_to("v1/groups#accept_invite", group_uuid: uuid, format: :json)
    end

    it "routes to #refuse_invite" do
      expect(post: "/v1/groups/#{uuid}/refuse")
        .to route_to("v1/groups#refuse_invite", group_uuid: uuid, format: :json)
    end

    it "routes to #leave" do
      expect(delete: "/v1/groups/#{uuid}/members")
        .to route_to("v1/groups#leave", group_uuid: uuid, format: :json)
    end

    it "routes to #kick" do
      expect(delete: "/v1/groups/#{uuid}/members/2")
        .to route_to("v1/groups#kick", group_uuid: uuid, user_id: "2",
                     format: :json)
    end

    it "routes to #member_settings" do
      expect(patch: "/v1/groups/#{uuid}/members")
        .to route_to("v1/groups#member_settings", group_uuid: uuid,
                     format: :json)
    end

    it "routes to #global_group" do
      expect(post: "/v1/groups/global_group")
        .to route_to("v1/groups#global_group", format: :json)
    end

    it "does't route to #new" do
      expect(get: "/v1/groups/new")
        .not_to route_to("v1/groups#new", format: :json)
    end

    it "doesn't route to #edit" do
      expect(get: "/v1/groups/#{uuid}/edit")
        .not_to route_to("v1/groups#edit", group_uuid: uuid, format: :json)
    end
  end
end
