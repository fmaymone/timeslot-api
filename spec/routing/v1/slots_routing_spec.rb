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

    it "routes to #share_url" do
      expect(get: "/v1/slots/1/share")
        .to route_to("v1/slots#share_url", id: "1", format: :json)
    end

    it "routes to #share_data" do
      expect(get: "/v1/slots/abcd1234/sharedata")
        .to route_to("v1/slots#share_data", uid: "abcd1234", format: :json)
    end

    it "routes to #add_like" do
      expect(post: "/v1/slots/1/like")
        .to route_to("v1/slots#add_like", id: "1", format: :json)
    end

    it "routes to #unlike" do
      expect(delete: "/v1/slots/1/like")
        .to route_to("v1/slots#unlike", id: "1", format: :json)
    end

    it "routes to #get_likes" do
      expect(get: "/v1/slots/1/likes")
        .to route_to("v1/slots#get_likes", id: "1", format: :json)
    end

    it "routes to #add_comment" do
      expect(post: "/v1/slots/1/comment")
        .to route_to("v1/slots#add_comment", id: "1", format: :json)
    end

    it "routes to #show_comments" do
      expect(get: "/v1/slots/1/comments")
        .to route_to("v1/slots#show_comments", id: "1", format: :json)
    end

    it "routes to #reslot_history" do
      expect(get: "/v1/slots/1/history")
        .to route_to("v1/slots#reslot_history", id: "1", format: :json)
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
