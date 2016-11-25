require 'rails_helper'

RSpec.describe V1::SlotsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/v1/slots/1")
        .to route_to("v1/slots#show", id: "1", format: :json)
    end

    it "does not route to #show if invalid id format" do
      expect(get: "/v1/slots/12foo").not_to be_routable
    end

    it "routes to #create" do
      expect(post: "/v1/slots")
        .to route_to("v1/slots#create", format: :json)
    end

    it "routes to #delete" do
      expect(delete: "/v1/slots/1")
        .to route_to("v1/slots#delete", id: "1", format: :json)
    end

    it "routes to #update" do
      expect(patch: "/v1/slots/1")
        .to route_to("v1/slots#update", id: "1", format: :json)
    end

    it "routes to #slotsets" do
      expect(get: "/v1/slots/1/slotsets")
        .to route_to("v1/slots#slotsets", id: "1", format: :json)
    end

    it "routes to #add_to_groups" do
      expect(post: "/v1/slots/1/slotgroups")
        .to route_to("v1/slots#add_to_groups", id: "1", format: :json)
    end

    it "routes to #remove_from_groups" do
      expect(delete: "/v1/slots/1/slotgroups")
        .to route_to("v1/slots#remove_from_groups", id: "1", format: :json)
    end

    it "routes to #add_like" do
      expect(post: "/v1/slots/1/like")
        .to route_to("v1/slots#add_like", id: "1", format: :json)
    end

    it "routes to #unlike" do
      expect(delete: "/v1/slots/1/like")
        .to route_to("v1/slots#unlike", id: "1", format: :json)
    end

    it "routes to #show_likes" do
      expect(get: "/v1/slots/1/likes")
        .to route_to("v1/slots#show_likes", id: "1", format: :json)
    end

    it "routes to #add_comment" do
      expect(post: "/v1/slots/1/comment")
        .to route_to("v1/slots#add_comment", id: "1", format: :json)
    end

    it "routes to #show_comments" do
      expect(get: "/v1/slots/1/comments")
        .to route_to("v1/slots#show_comments", id: "1", format: :json)
    end

    it "routes to #show_slotters" do
      expect(get: "/v1/slots/1/slotters")
        .to route_to("v1/slots#show_slotters", id: "1", format: :json)
    end

    it "routes to #tag_users" do
      expect(post: "/v1/slots/1/user_tags")
        .to route_to("v1/slots#tag_users", id: "1", format: :json)
    end

    it "routes to #show_tagged_users" do
      expect(get: "/v1/slots/1/user_tags")
        .to route_to("v1/slots#show_tagged_users", id: "1", format: :json)
    end

    it "routes to #add_to_groups" do
      expect(post: "/v1/slots/1/slotgroups")
        .to route_to("v1/slots#add_to_groups", id: "1", format: :json)
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

    it "does not route to #index" do
      expect(get: "/v1/slots").not_to be_routable
    end
  end
end
