require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user) }
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
      let(:valid_attributes) { attributes_for(:user) }

      it "returns ID of created user" do
        post "/v1/users", user: valid_attributes
        expect(json).to have_key('id')
      end

      it "does not return displayed state" do
        post "/v1/users", user: valid_attributes
        expect(json).to_not have_key('displayed')
      end
    end
  end

  describe "PATCH /v1/users/:id" do
    let(:user) { create(:user) }

    context "with valid params" do
      it "responds with http status No Content (204)" do
        patch "/v1/users/#{user.id}", user: { username: "foo" }
        expect(response).to have_http_status(:no_content)
      end

      it "updates the title of a given user" do
        user = create(:user, username: "Old username")
        patch "/v1/users/#{user.id}", user: { username: "New username" }
        user.reload
        expect(user.username).to eq("New username")
      end
    end

    context "with invalid params" do
      it "responds with http status Unprocessable Entity (422)" do
        patch "/v1/users/#{user.id}", user: { username: "" }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with missing params" do
      it "responds with Unprocessable Entity (422)" do
        patch "/v1/users/#{user.id}", wrong_scope: { username: "foo" }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include "missing"
        expect(response.body).to include "user"
      end
    end

    context "with invalid ID" do
      it "responds with http status Not Found (404)" do
        wrong_id = user.id + 1
        patch "/v1/users/#{wrong_id}", user: { username: "foo" }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "DELETE /v1/users/:id" do
    let!(:user) { create(:user) }

    context "with a valid ID" do
      it "returns success" do
        delete "/v1/users/#{user.id}"
        expect(response).to be_success
      end

      it "doesn't delete the requested user" do
        expect {
          delete "/v1/users/#{user.id}"
        }.not_to change(User, :count)
      end
    end

    context "with an invalid ID" do
      it "responds with http status Not Found" do
        wrong_id = user.id + 1
        delete "/v1/users/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        wrong_id = user.id + 1
        expect {
          delete "/v1/users/#{wrong_id}"
        }.not_to change(User, :count)
      end
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
