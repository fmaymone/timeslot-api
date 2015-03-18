require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:json) { JSON.parse(response.body) }
  let!(:current_user) { create(:user) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/users" do
    it "returns success" do
      get "/v1/users", {}, auth_header
      expect(response.status).to be(200)
    end
  end

  describe "GET /v1/user/:id" do
    context "with valid ID" do
      it "returns the requested user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json['username']).to eq(current_user.username)
      end
    end

    context "without valid Auth Header" do
      it "returns unauthorized" do
        get "/v1/users/#{current_user.id}"
        expect(response).to have_http_status :unauthorized
        expect(response.body).to include "Bad credentials"
      end
    end

    context "return friends via json" do
      let!(:friendship) { create(:friendship, :established, user: current_user) }

      it "return friends via json" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('friends')
        expect(json['friends'][0]['id']).to eq(current_user.friends.first.id)
      end
    end

    context "return offered_friends via json" do
      let!(:friendship) { create(:friendship, friend: current_user) }

      it "return offered_friends via json" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('offeredFriends')
        expect(json['offeredFriends'][0]['id']).to eq(current_user.offered_friends.first.id)
      end
    end

    context "return requested_friends via json" do
      let!(:friendship) { create(:friendship, user: current_user) }

      it "return requested_friends via json" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('requestedFriends')
        expect(json['requestedFriends'][0]['id']).to eq(current_user.requested_friends.first.id)
      end
    end
  end

  describe "POST /v1/users" do
    describe "with valid params" do
      let(:valid_attributes) {
        attributes_for(:user).merge!(image: { publicId: 'foobar' }, password: 'timeslot')
      }
      it "returns ID of created user" do
        post "/v1/users", valid_attributes
        expect(json).to have_key('id')
      end

      it "adds an user image" do
        skip "it's not possible to set a user image on signup"
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

      it "returns an error if no password supplied" do      
        post "/v1/users", { username: 'foo', email: 'test@timeslot.com' }
        expect(json).to have_key "error"
      end
    end
  end

  describe "POST /v1/users/signin" do
    let!(:user) { create(:user, password: 'timeslot') }

    describe "with valid params" do
      let(:valid_attributes) {
        { email: user.email, password: 'timeslot' }
      }
      it "returns OK" do
        post "/v1/users/signin", valid_attributes
        expect(response).to have_http_status(:ok)
      end

      it "creates a new auth_token for user" do
        expect {
          post "/v1/users/signin", valid_attributes
          user.reload
        }.to change(user, :auth_token)
      end

      it "returns auth_token for user" do
        post "/v1/users/signin", valid_attributes
        expect(json).to have_key('authToken')
      end
    end

    describe "with invalid params" do
      let(:invalid_attributes) {
        { email: user.email, password: 'not timeslot' }
      }
      it "returns unauthorized" do
        post "/v1/users/signin", invalid_attributes
        expect(response).to have_http_status :unauthorized
      end

      it "returns an error" do
        post "/v1/users/signin", invalid_attributes
        expect(json).to have_key "error"
      end
    end
  end

  describe "GET /v1/users/signout" do
    it "invalidates the auth token" do
      get "/v1/users/signout", {}, auth_header
      current_user.reload
      expect(current_user.auth_token).to be nil
    end
  end

  describe "PATCH /v1/users" do
    context "with valid params" do
      context "username" do
        it "responds with http OK" do
          patch "/v1/users", { username: "foo" }, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "updates the username of a given user" do
          patch "/v1/users", { username: "New username" }, auth_header
          current_user.reload
          expect(current_user.username).to eq("New username")
        end

        it "doesn't update the auth_token if new username" do
          old_token = current_user.auth_token
          patch "/v1/users", { username: "newname" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new username" do
          old_digest = current_user.password_digest
          patch "/v1/users", { username: "newname" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "email" do
        it "updates the email of a given user" do
          patch "/v1/users", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.email).to eq("newmail@timeslot.com")
        end

        it "doesn't update the auth_token if new email" do
          old_token = current_user.auth_token
          patch "/v1/users", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new email" do
          old_digest = current_user.password_digest
          patch "/v1/users", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "password" do
        it "updates the password_digest if new password" do
          expect {
            patch "/v1/users", { password: "newsecret" }, auth_header
          }.to change(current_user, :password_digest)
        end

        it "updates the auth_token if new password" do
          old_token = current_user.auth_token
          patch "/v1/users", { password: "newsecret" }, auth_header
          current_user.reload
          expect(current_user.auth_token).not_to eq old_token
        end
      end
    end

    context "with invalid params" do
      it "responds with http status Unprocessable Entity (422)" do
        patch "/v1/users", { username: "" }, auth_header
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /v1/users" do
    it "returns success" do
      delete "/v1/users", {}, auth_header
      expect(response).to be_success
    end

    it "sets deleted_at for current_user" do
      delete "/v1/users", {}, auth_header
      current_user.reload
      expect(current_user.deleted_at?).to be true
    end

    it "doesn't delete the current user" do
      expect {
        delete "/v1/users", {}, auth_header
      }.not_to change(User, :count)
    end
  end

  describe "POST /v1/users/add_friends" do
    let(:john) { create(:user, username: "John") }

    context "no offer" do
      it "creates a friend request" do
        post "/v1/users/add_friends", { ids: [john.id] }, auth_header
        expect(john.offered_friendship(current_user.id)).not_to be nil
      end
    end

    context "existing offer" do
      let!(:friendship) {
        create(:friendship, user: john, friend: current_user)
      }
      it "accepts a friend request" do
        expect(friendship.established?).to be false
        post "/v1/users/add_friends", { ids: [john.id] }, auth_header
        friendship.reload
        expect(friendship.established?).to be true
      end
    end
  end
end
