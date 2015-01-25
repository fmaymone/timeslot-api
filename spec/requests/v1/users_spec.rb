require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:json) { JSON.parse(response.body) }
  let!(:current_user) { create(:user) }
  before(:each) { ApplicationController.new.current_user = current_user }

  describe "GET /v1/users" do
    it "returns success" do
      get "/v1/users"
      expect(response.status).to be(200)
    end
  end

  describe "GET /v1/user/:id" do
    let(:user) { create(:user) }

    context "with valid ID" do
      it "returns the requested user" do
        get "/v1/users/#{user.id}"
        expect(json['username']).to eq(user.username)
      end
    end
  end

  describe "POST /v1/users" do
    describe "with valid params" do
      let(:valid_attributes) {
        attributes_for(:user).merge!(image: { publicId: 'foobar' })
      }
      it "returns ID of created user" do
        post "/v1/users", valid_attributes
        expect(json).to have_key('id')
      end

      it "adds an user image" do
        post "/v1/users", valid_attributes
        expect(json["image"]).to eq "foobar"
      end
    end

    describe "with invalid params" do
      let(:invalid_attributes) {
        { username: 'foo', image: { publicId: '' } }
      }
      it "returns an error" do
        post "/v1/users", invalid_attributes
        expect(json).to have_key "error"
      end
    end
  end

  describe "PATCH /v1/users" do
    context "with valid params" do
      it "responds with http OK" do
        patch "/v1/users", { username: "foo" }
        expect(response).to have_http_status(:ok)
      end

      it "updates the title of a given user" do
        patch "/v1/users", { username: "New username" }
        current_user.reload
        expect(current_user.username).to eq("New username")
      end
    end

    context "with invalid params" do
      it "responds with http status Unprocessable Entity (422)" do
        patch "/v1/users", username: ""
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /v1/users" do
    it "returns success" do
      delete "/v1/users", {}, { 'HTTP_AUTHORIZATION' => current_user.username }
      expect(response).to be_success
    end

    it "sets deleted_at for current_user" do
      delete "/v1/users", {}, { 'HTTP_AUTHORIZATION' => current_user.username }
      current_user.reload
      expect(current_user.deleted_at?).to be true
    end

    it "doesn't delete the current user" do
      expect {
        delete "/v1/users", {}, { 'HTTP_AUTHORIZATION' => current_user.username }
      }.not_to change(User, :count)
    end
  end

  describe "POST /v1/users/add_friends" do
    let(:john) { create(:user, username: "John") }

    context "no offer" do
      it "creates a friend request" do
        post "/v1/users/add_friends", ids: [john.id]
        expect(john.offered_friendship(current_user.id)).not_to be nil
      end
    end

    context "existing offer" do
      let!(:friendship) {
        create(:friendship, user: john, friend: current_user)
      }
      it "accepts a friend request" do
        expect(friendship.established?).to be false
        post "/v1/users/add_friends", ids: [john.id]
        friendship.reload
        expect(friendship.established?).to be true
      end
    end
  end
end
