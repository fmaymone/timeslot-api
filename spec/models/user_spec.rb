require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  subject { user }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:created_slots) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:std_slots) }
  it { is_expected.to respond_to(:re_slots) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to have_many(:images) }
  it { is_expected.to have_many(:created_slots).inverse_of(:creator) }
  it { is_expected.to have_many(:own_groups).inverse_of(:owner) }
  it { is_expected.to have_many(:memberships).inverse_of(:user) }
  it { is_expected.to have_many(:groups).through(:memberships) }
  # it { is_expected.to have_many(:meta_slots).through(:slot_settings) }
  it { is_expected.to have_many(:slot_settings).inverse_of(:user) }
  it { is_expected.to have_many(:std_slots).inverse_of(:owner) }
  it { is_expected.to have_many(:re_slots).inverse_of(:slotter) }
  it { is_expected.to have_many(:group_slots).through(:groups) }
  it { is_expected.to have_many(:initiated_friendships).inverse_of(:user) }
  it { is_expected.to have_many(:received_friendships).inverse_of(:friend) }

  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { user.username = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do
    before { user.username = "a" * 21 }
    it { is_expected.to_not be_valid }
  end

  describe :representation? do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, title: "Timeslot") }

    context "user has std_slot with the specified meta_slot" do
      let!(:std_slot) { create(:std_slot, meta_slot: meta_slot, owner: user) }

      it "returns true" do
        expect(user.representation?(meta_slot)).to be true
      end
    end

    context "user has re_slot with the specified meta_slot" do
      let!(:re_slot) { create(:re_slot, meta_slot: meta_slot, slotter: user) }

      it "returns true" do
        expect(user.representation?(meta_slot)).to be true
      end
    end

    context "user has group_slot with the specified meta_slot" do
      let(:group) { create(:group) }
      let!(:membership) { create(:membership, user: user, group: group) }
      let!(:group_slot) {
        create(:group_slot, meta_slot: meta_slot, group: group)
      }
      it "returns true" do
        expect(user.representation?(meta_slot)).to be true
      end
    end

    context "user has no representation of the specified meta_slot" do
      it "returns false" do
        expect(user.representation?(meta_slot)).to be false
      end
    end

    context "user has deleted std_slot with the specified meta_slot" do
      let!(:std_slot) {
        create(:std_slot, :deleted, meta_slot: meta_slot, owner: user)
      }
      it "returns false" do
        expect(user.representation?(meta_slot)).to be false
      end
    end
  end

  describe :groups do
    let(:user) { create(:user, :with_3_groups) }
    it "returns the groups where user is a member" do
      expect(user.groups.size).to eq 3
    end
  end

  describe :own_groups do
    let(:user) { create(:user, :with_3_own_groups) }
    it "returns the users own groups" do
      expect(user.own_groups.size).to eq 3
    end
  end

  describe :is_invited? do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    describe "membership exists" do
      let!(:membership) { create(:membership, user: user, group: group) }

      describe "state invited" do
        it "return true" do
          membership.invite
          expect(user.is_invited? group.id).to be true
        end
      end

      describe "state not invited" do
        it "return false if kicked" do
          membership.kick
          expect(user.is_invited? group.id).to be false
        end

        it "return false if refused" do
          membership.refuse
          expect(user.is_invited? group.id).to be false
        end

        it "return false if active" do
          membership.activate
          expect(user.is_invited? group.id).to be false
        end

        it "return false if inactive" do
          membership.inactivate
          expect(user.is_invited? group.id).to be false
        end
      end
    end

    describe "membership doesn't exists" do
      it "return false" do
        expect(user.is_invited? group.id).to be false
      end
    end
  end

  describe :can_invite? do
    describe "user is group owner" do
      let(:user) { create(:user) }
      let(:group) { create(:group, owner: user) }

      it "return true" do
        expect(user.can_invite? group.id).to be true
      end
    end

    describe "group subscribers can invite" do
      let(:group) { create(:group, members_can_invite: true) }

      it "return true" do
        expect(user.can_invite? group.id).to be true
      end
    end

    describe "not owner & subs can't invite" do
      let(:group) { create(:group, members_can_invite: false) }

      it "return false" do
        expect(user.can_invite? group.id).to be false
      end
    end
  end

  describe :is_member? do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    describe "membership exists" do
      let!(:membership) { create(:membership, user: user, group: group) }

      describe "state active" do
        it "return true" do
          membership.activate
          expect(user.is_member? group.id).to be true
        end
      end

      describe "state not active" do
        it "return false if kicked" do
          membership.kick
          expect(user.is_member? group.id).to be false
        end

        it "return false if refused" do
          membership.refuse
          expect(user.is_member? group.id).to be false
        end

        it "return false if inactive" do
          membership.inactivate
          expect(user.is_member? group.id).to be false
        end

        it "return false if invite" do
          membership.invite
          expect(user.is_member? group.id).to be false
        end
      end
    end

    describe "membership doesn't exists" do
      it "return false" do
        expect(user.is_member? group.id).to be false
      end
    end
  end

  describe :is_owner? do
    let(:user) { create(:user) }

    describe "user is group owner" do
      let(:group) { create(:group, owner: user) }

      it "return true" do
        expect(user.is_owner? group.id).to be true
      end
    end

    describe "user not owner" do
      let(:group) { create(:group) }

      it "return false" do
        expect(user.is_owner? group.id).to be false
      end
    end
  end

  describe :get_membership do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    describe "membership exists" do
      let!(:membership) { create(:membership, user: user, group: group) }

      it "return membership" do
        expect(user.get_membership group.id).to eq membership
      end
    end

    describe "no existing membership" do
      it "return nil" do
        expect(user.get_membership group.id).to be nil
      end
    end
  end

  describe :friends do
    let(:john) { create(:user, username: "John") }
    let!(:friendships_A) { create_list(:friendship, 2, :established, user: john) }
    let!(:friendships_B) { create_list(:friendship, 3, :established, friend: john) }

    it "returns all friends" do
      expect(john.friends.size).to eq 5
    end
  end

  describe :friendship do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let!(:friendship_1) {
      create(:friendship, :established, user: john, friend: mary) }
    let!(:friendship_2) {
      create(:friendship, :established, user: alice, friend: john) }

    it "returns the friendship object for the given user" do
      expect(john.friendship(mary)).to eq friendship_1
      expect(john.friendship(alice)).to eq friendship_2
    end

    it "returns nil if no connection" do
      expect(alice.friendship(mary)).to be nil
    end
  end

  describe :offered_friendship do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let(:bob) { create(:user, username: "Bob") }
    let!(:friendship_1) {
      create(:friendship, user: user, friend: mary) }
    let!(:friendship_2) {
      create(:friendship, user: john, friend: user) }
    let!(:friendship_3) {
      create(:friendship, :established, user: alice, friend: user) }
    let!(:friendship_4) {
      create(:friendship, :established, user: user, friend: bob) }

    it "returns the friendship object if a friendship was offered" \
       " to the current user by to other user" do
      expect(user.offered_friendship(john)).to eq friendship_2
    end

    it "returns nil if no friendship was offered" \
       " to the current user by to other user" do
      expect(user.offered_friendship(mary)).to be nil
      expect(user.offered_friendship(alice)).to be nil
      expect(user.offered_friendship(bob)).to be nil
    end
  end

  describe "friendship associations" do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let(:bob) { create(:user, username: "Bob") }
    let(:charlie) { create(:user, username: "Charlie") }
    let(:eve) { create(:user, username: "Eve") }
    let!(:friendship_1) {
      create(:friendship, :established, user: user, friend: mary) }
    let!(:friendship_2) {
      create(:friendship, :established, user: alice, friend: user) }
    let!(:friendship_3) {
      create(:friendship, user: user, friend: john) }
    let!(:friendship_4) {
      create(:friendship, user: bob, friend: user) }
    let!(:friendship_5) {
      create(:friendship, :established, user: bob, friend: alice) }
    let!(:friendship_6) {
      create(:friendship, user: mary, friend: john) }
    let!(:friendship_7) {
      create(:friendship, :deleted, user: mary, friend: alice) }
    let!(:friendship_8) {
      create(:friendship, :established, :deleted, user: john, friend: bob) }
    let!(:friendship_9) {
      create(:friendship, :established, :deleted, user: user, friend: charlie) }
    let!(:friendship_10) {
      create(:friendship, :deleted, user: eve, friend: user) }

    context :initiated_friendships do
      it "contains all friendships initiated by current user" do
        expect(user.initiated_friendships).to include friendship_1
        expect(user.initiated_friendships).to include friendship_3
        expect(user.initiated_friendships).to include friendship_9
        expect(user.initiated_friendships).not_to include friendship_2
        expect(user.initiated_friendships).not_to include friendship_4
        expect(user.initiated_friendships).not_to include friendship_5
        expect(user.initiated_friendships).not_to include friendship_6
        expect(user.initiated_friendships).not_to include friendship_7
        expect(user.initiated_friendships).not_to include friendship_8
        expect(user.initiated_friendships).not_to include friendship_10
      end
    end

    context :received_friendships do
      it "contains all friendships that current user received by other users" do
        expect(user.received_friendships).to include friendship_2
        expect(user.received_friendships).to include friendship_4
        expect(user.received_friendships).to include friendship_10
        expect(user.received_friendships).not_to include friendship_1
        expect(user.received_friendships).not_to include friendship_3
        expect(user.received_friendships).not_to include friendship_5
        expect(user.received_friendships).not_to include friendship_6
        expect(user.received_friendships).not_to include friendship_7
        expect(user.received_friendships).not_to include friendship_8
        expect(user.received_friendships).not_to include friendship_9
      end
    end

    context :friendships do
      it "contains all active (not deleted) friendships" do
        expect(user.friendships).to include friendship_1
        expect(user.friendships).to include friendship_2
        expect(user.friendships).to include friendship_3
        expect(user.friendships).to include friendship_4
        expect(user.friendships).not_to include friendship_5
        expect(user.friendships).not_to include friendship_6
        expect(user.friendships).not_to include friendship_7
        expect(user.friendships).not_to include friendship_8
        expect(user.friendships).not_to include friendship_9
        expect(user.friendships).not_to include friendship_10
      end
    end

    context :friends_by_request do
      it "contains all friends where current user" \
         " requested friendship and the friend accepted" do
        expect(user.friends_by_request).to include mary
        expect(user.friends_by_request).not_to include john
        expect(user.friends_by_request).not_to include alice
        expect(user.friends_by_request).not_to include bob
        expect(user.friends_by_request).not_to include charlie
        expect(user.friends_by_request).not_to include eve
      end
    end

    context :friends_by_offer do
      it "contains all friends where the friendship was initiated by the" \
         " other user and current user accepted" do
        expect(user.friends_by_offer).to include alice
        expect(user.friends_by_offer).not_to include john
        expect(user.friends_by_offer).not_to include mary
        expect(user.friends_by_offer).not_to include bob
        expect(user.friends_by_offer).not_to include charlie
        expect(user.friends_by_offer).not_to include eve
      end
    end
  end

  describe "auditing", :commit do
    let!(:user) { create(:user) }

    it "logs instance changes" do
      expect(Rails.logger).to receive(:info).once

      new_name = "name_#{user.id}"
      user.update(username: new_name)

      expect(user.username).to eq new_name
    end
  end
end
