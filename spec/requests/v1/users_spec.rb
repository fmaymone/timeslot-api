require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/users" do
    it "returns success" do
      get "/v1/users", {}, auth_header
      expect(response.status).to be(200)
    end
  end

  describe "User_agent" do 
    context "is an IOS device" do
      let(:auth_header) do
        { "HTTP_USER_AGENT" => 
          "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7" }
      end
      it "is not forbidden" do
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("production"))
        get "/v1/users", {}, auth_header
        expect(response.status).not_to be 403
      end
    end

    context "is not an IOS device" do
      let(:auth_header) do
        {"HTTP_USER_AGENT" => "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)"}
      end
      #it "is forbidden" do
      #  allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("production"))
      #  get "/v1/users", {}, auth_header
      #  expect(response.status).to be 403
      #end
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

    context "return friendships via json" do
      let!(:friendship) { create_list(:friendship, 7, user: current_user) }

      it "return all friendships for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('friendships')
        expect(
          json['friendships'][0]['friend_id']
        ).to eq(current_user.initiated_friendships.active[0].friend_id)
        expect(json['friendships'].length).to eq(current_user.friendships.length)
      end
    end

    context "return number of friends via json" do
      let!(:friendship) { create(:friendship, :established, user: current_user) }

      it "return number of established friends for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('friendsCount')
        expect(json['friendsCount']).to eq(current_user.friends.length)
      end
    end

    context "return std_slots via json" do
      let!(:std_slot) { create(:std_slot_private, owner: current_user) }

      it "return std_slots for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('slotCount')
        expect(json['slotCount']).to eq(current_user.std_slots.length)
      end
    end

    context "return re_slots via json" do
      let!(:re_slot) { create(:re_slot, slotter: current_user) }

      it "return re_slots for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('reslotCount')
        expect(json['reslotCount']).to eq(current_user.re_slots.length)
      end
    end

    context "return group membership via json" do
      let(:membership) { create(:membership, :active, user: create(:user)) }

      it "return group memberships for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('memberships')
        expect(json['memberships'][0]).to eq(membership[0])
      end
    end
  end

  describe "POST /v1/users" do
    describe "with valid params" do
      context "email" do
        let(:valid_attributes) {
          attributes_for(:user, :with_email, :with_password)
        }
        it "returns ID of created user" do
          post "/v1/users", valid_attributes
          expect(json).to have_key('id')
        end
      end

      context "phone" do
        let(:valid_attributes) {
          attributes_for(:user, :with_phone, :with_password)
        }
        it "returns ID of created user" do
          post "/v1/users", valid_attributes
          expect(json).to have_key('id')
        end
      end
    end

    describe "with invalid params" do
      let(:missing_email_and_phone) { { username: 'foo', password: 'foo' } }
      let(:missing_password) { { username: 'foo', email: 'test@timeslot.com' } }

      it "returns an error if email or phone is missing" do
        post "/v1/users", missing_email_and_phone
        expect(json).to have_key "error"
        expect(response.body).to include 'email'
      end

      it "returns an error if no password supplied" do
        post "/v1/users", missing_password
        expect(json).to have_key "error"
        expect(response.body).to include 'password'
      end
    end
  end

  describe "POST /v1/users/signin" do
    describe "with valid params" do
      context "email" do
        let!(:user) { create(:user, :with_email, password: 'timeslot') }
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

      context "phone" do
        let!(:user) { create(:user, :with_phone, password: 'timeslot') }
        let(:valid_attributes) {
          { phone: user.phone, password: 'timeslot' }
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
    end

    describe "with invalid params" do
      let!(:user) { create(:user, :with_email, :with_phone, password: 'short') }
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

      it "returns unauthorized" do
        post "/v1/users/signin", { phone: user.phone, password: 'longer' }
        expect(response).to have_http_status :unauthorized
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

      context "phone" do
        it "updates the phone of a given user" do
          patch "/v1/users", { phone: "1423423134" }, auth_header
          current_user.reload
          expect(current_user.phone).to eq("1423423134")
        end

        it "doesn't update the auth_token if new phone" do
          old_token = current_user.auth_token
          patch "/v1/users", { phone: "1423423134" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new phone" do
          old_digest = current_user.password_digest
          patch "/v1/users", { phone: "123123213" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "password" do
        let(:current_user) { create(:user, :with_email, password: 'timeslot') }

        it "updates the password_digest if new password" do
          old_digest = current_user.password_digest
          patch "/v1/users", { old_password: "timeslot",
                               password: "newsecret" }, auth_header
          current_user.reload
          expect(old_digest.eql? current_user.password_digest).to be false
        end

        it "allows signin with the new password" do
          patch "/v1/users", { old_password: "timeslot",
                               password: "newsecret" }, auth_header
          current_user.reload
          expect(current_user.try(:authenticate, "newsecret")).to eq current_user
        end

        it "doesn't update the auth_token if new password" do
          old_token = current_user.auth_token
          patch "/v1/users", { old_password: "timeslot",
                               password: "newsecret" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        context "invalid data" do
          it "missing old password returns error" do
            patch "/v1/users", { password: "newsecret" }, auth_header
            expect(response).to have_http_status :unprocessable_entity
            expect(json).to have_key 'error'
          end

          it "missing old password doesn't change password_digest" do
            old_digest = current_user.password_digest
            patch "/v1/users", { password: "newsecret" }, auth_header
            current_user.reload
            expect(old_digest.eql? current_user.password_digest).to be true
          end

          it "incorrect old password" do
            patch "/v1/users", { old_password: "slimetot",
                                 password: "newsecret" }, auth_header
            expect(response).to have_http_status :unauthorized
          end

          it "incorrect old password doesn't change password_digest" do
            old_digest = current_user.password_digest
            patch "/v1/users", { old_password: "slimetot",
                                 password: "newsecret" }, auth_header
            current_user.reload
            expect(old_digest.eql? current_user.password_digest).to be true
          end
        end
      end

      context "other attributes" do
        it "updates the public URL of a given user" do
          patch "/v1/users", { publicUrl: 'uffie' }, auth_header
          current_user.reload
          expect(current_user.public_url).to eq 'uffie'
        end

        it "updates the push notification state of a given user" do
          patch "/v1/users", { push: true }, auth_header
          current_user.reload
          expect(current_user.push).to be true
        end

        it "updates the location of a given user" do
          patch "/v1/users", { location: { name: 'Bonn' } }, auth_header
          current_user.reload
          expect(current_user.location.name).to eq('Bonn')
        end

        it "updates the slot default location id of a given user" do
          patch "/v1/users", { slotDefaultLocationId: '323323232' }, auth_header
          current_user.reload
          expect(current_user.slot_default_location_id).to eq(323323232)
        end

        it "updates the slot_default_duration of a given user" do
          patch "/v1/users", { slotDefaultDuration: 1000000 }, auth_header
          current_user.reload
          expect(current_user.slot_default_duration).to eq(1000000)
        end

        it "updates the default slot type of a given user" do
          skip 'needs slottype table'
          patch "/v1/users", { slotDefaultType: 'StdSlotPrivate' }, auth_header
          current_user.reload
          expect(current_user.slot_default_type).to eq(StdSlotPrivate)
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
      expect(current_user).not_to be nil # make sure he exists
      expect {
        delete "/v1/users", {}, auth_header
      }.not_to change(User, :count)
    end
  end

  describe "GET /v1/users/:id/slots" do
    let(:group_member) { create(:membership, user: current_user) }
    let!(:group_slot) { create(:group_slot, group: group_member.group) }
    let!(:slots) do
      slots = []
      slots.push create(:std_slot_private, owner: current_user)
      slots.push create(:std_slot_friends, owner: current_user)
      slots.push create(:std_slot_public, owner: current_user)
      slots.push(*create_list(:re_slot, 2, slotter: current_user))
    end

    it "returns success" do
      get "/v1/users/#{current_user.id}/slots", {}, auth_header
      expect(response.status).to be(200)
    end

    it "returns all stdslots & reslots for the current_user" do
      get "/v1/users/#{current_user.id}/slots", {}, auth_header
      slots_count = slots.size
      expect(json.length).to eq slots_count
    end

    it "excludes groupslots of the current_user" do
      get "/v1/users/#{current_user.id}/slots", {}, auth_header
      expect(response.body).not_to include group_slot.title
    end
  end

  describe "GET /v1/users/:id/media" do
    let!(:target_user) { create(:user) }
    let!(:slot_public) { create(:std_slot_public, :with_media, owner: target_user) }
    let!(:slot_private) { create(:std_slot_private, :with_media, owner: target_user) }

    context "Get all owned media items of a user" do
      let(:auth_header) do
        { 'Authorization' => "Token token=#{target_user.auth_token}" }
      end

      it "Returns an array which includes all media items of the given user" do
        get "/v1/users/#{target_user.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(target_user.media_for(target_user).size)
        expect(json.length).to eq(12)
      end
    end

    context "Get public media list of a given user" do
      it "Get public media list of a given user" do
        get "/v1/users/#{target_user.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(target_user.media_for(current_user).count)
        expect(json.length).to eq(6)
      end
    end

    context "Get media list of a friendship" do
      let!(:friend) { create(:user) }
      let!(:slot_friend) { create(:std_slot_friends, :with_media, owner: friend) }
      let!(:friendship) { create(:friendship, :established, user: current_user, friend: friend) }

      it "Get media list from friendslots shared with this user" do
        get "/v1/users/#{friend.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(friend.media_for(current_user).count)
        expect(json.length).to eq(6)
      end
    end

    context "Get media list of a common public groups" do
      let!(:member) { create(:user) }
      let!(:slot_group) { create(:group_slot, :with_media_group) }
      let!(:memberships) {
        create(:membership, :active, group: slot_group.group, user: current_user)
        create(:membership, :active, group: slot_group.group, user: member)
      }

      it "Get media list from common groups with this user" do
        get "/v1/users/#{member.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(member.media_for(current_user).count)
        expect(json.length).to eq(6)
      end
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

  describe "GET /v1/users/friendslots" do
    let(:bob) { create(:user, :with_private_slot) }
    let!(:bob_slots) do
      create(:re_slot, slotter: bob)
      create(:std_slot_friends, owner: bob, title: 'bobslot')
      create(:std_slot_friends, owner: bob, title: 'bobslot-past',
             start_date: Time.zone.yesterday)
    end

    let!(:friendships) {
      create(:friendship, :established,
             user: create(:user, :with_friend_slot),
             friend: current_user)
      create(:friendship, :established,
             user: current_user,
             friend: create(:user, :with_public_slot))
      create(:friendship, :established, user: bob, friend: current_user)
    }

    it "returns success" do
      get "/v1/users/friendslots", {}, auth_header
      expect(response.status).to be(200)
    end

    it "includes all the right slots" do
      get "/v1/users/friendslots", {}, auth_header
      expect(response.body).to include 'bobslot'
      expect(json.size).to be 4
    end

    it "orders the slots by startdate" do
      get "/v1/users/friendslots", {}, auth_header
      expect(json.first['startDate']).to be <= json.second['startDate']
      expect(json.second['startDate']).to be <= json.third['startDate']
      expect(json.third['startDate']).to be <= json.last['startDate']
    end

    it "only includes upcoming slots" do
      get "/v1/users/friendslots", {}, auth_header
      expect(json.first['startDate']).to be >= Time.zone.now
      expect(response.body).not_to include 'bobslot-past'
    end
  end
end
