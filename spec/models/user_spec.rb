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
  # it { is_expected.to have_one(:image) }
  it { is_expected.to have_many(:image) }
  it { is_expected.to have_many(:created_slots).inverse_of(:creator) }
  it { is_expected.to have_many(:own_groups).inverse_of(:owner) }
  it { is_expected.to have_many(:memberships).inverse_of(:user) }
  it { is_expected.to have_many(:groups).through(:memberships) }
  # it { is_expected.to have_many(:meta_slots).through(:slot_settings) }
  it { is_expected.to have_many(:slot_settings).inverse_of(:user) }
  it { is_expected.to have_many(:std_slots).inverse_of(:owner) }
  it { is_expected.to have_many(:re_slots).inverse_of(:slotter) }
  it { is_expected.to have_many(:group_slots).through(:groups) }

  it { is_expected.to have_many(:friendships1).inverse_of(:user) }
  it { is_expected.to have_many(:friendships2).inverse_of(:friend) }
  it { is_expected.to have_many(:friends_by_request).through(:established_friendships1) }
  it { is_expected.to have_many(:friends_by_offer).through(:established_friendships2) }

  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { user.username = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do
    before { user.username = "a" * 21 }
    it { is_expected.to_not be_valid }
  end

  describe "groups relation" do
    let(:user) { create(:user, :with_3_groups) }
    it "returns the groups where user is a member" do
      expect(user.groups.size).to eq 3
    end
  end

  describe "own groups relation" do
    let(:user) { create(:user, :with_3_own_groups) }
    it "returns the users own groups" do
      expect(user.own_groups.size).to eq 3
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
        it "return false" do
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
        it "return false" do
          membership.inactivate
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

  describe :friend do
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
  end
end
