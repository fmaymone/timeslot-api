require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  subject { user }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:created_slots) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to have_one(:image) }
  it { is_expected.to have_many(:created_slots).inverse_of(:creator) }
  it { is_expected.to have_many(:own_groups).inverse_of(:owner) }
  it { is_expected.to have_many(:memberships).inverse_of(:user) }
  it { is_expected.to have_many(:groups).through(:memberships) }
  it { is_expected.to have_many(:meta_slots).through(:slot_settings) }

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
    let(:user) { create(:user) }

    it "logs instance changes" do
      # twice: once for creation, once for change
      expect(Rails.logger).to receive(:info).twice

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
end
