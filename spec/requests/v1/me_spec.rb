require 'rails_helper'

RSpec.describe "V1::Me", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/me" do
    context "with valid ID" do
      it "returns the current user" do
        get "/v1/me", {}, auth_header
        expect(json['username']).to eq(current_user.username)
      end
    end

    context "without valid Auth Header" do
      it "returns unauthorized" do
        get "/v1/me"
        expect(response).to have_http_status :unauthorized
        expect(response.body).to include "Bad credentials"
      end
    end

    context "return friendships via json" do
      let!(:friendship) { create_list(:friendship, 7, user: current_user) }

      it "return all friendships for current user" do
        get "/v1/me", {}, auth_header
        expect(json).to have_key('friendships')
        expect(
          json['friendships'][0]['friend_id']
        ).to eq(current_user.initiated_friendships.active[0].friend_id)
        expect(json['friendships'].length).to eq(current_user.friendships.length)
      end
    end

    context "json active friends counter" do
      let!(:friendship) { create(:friendship, :established, user: current_user) }

      it "return number of established friends for current user" do
        get "/v1/me", {}, auth_header
        expect(json).to have_key('friendsCount')
        expect(json['friendsCount']).to be(1)
        expect(json['friendsCount']).to eq(current_user.friends.length)
      end
    end

    context "json std_slots counter" do
      let(:stranger) { create(:user, :with_public_slot) }
      let!(:my_slots) do
        create(:std_slot_private, owner: current_user)
        create(:std_slot_public, owner: current_user)
      end
      let!(:not_my_slot) { create(:std_slot_public) }

      it "return number of all std_slots for current user" do
        get "/v1/me", {}, auth_header
        expect(json).to have_key('slotCount')
        expect(json['slotCount']).to eq 2
      end

      it "return number of public std_slots for stranger" do
        get "/v1/users/#{stranger.id}", {}, auth_header
        expect(json).to have_key('slotCount')
        expect(json['slotCount']).to eq 1
      end
    end

    context "json reslots counter" do
      let!(:re_slot) { create(:re_slot, slotter: current_user) }
      let!(:not_my_reslot) { create(:re_slot) }

      it "return number of re_slots for current user" do
        get "/v1/me", {}, auth_header
        expect(json).to have_key 'reslotCount'
        expect(json['reslotCount']).to eq 1
      end
    end

    context "return group membership via json" do
      let!(:membership) { create(:membership, :active, user: current_user) }
      let!(:other_membership) { create(:membership, :active) }

      it "return group memberships for current user" do
        get "/v1/me", {}, auth_header
        expect(json).to have_key 'memberships'
        expect(json['memberships'].size).to eq 1
        expect(json['memberships'].first['groupId']).to eq membership.group_id
      end
    end
  end
end
