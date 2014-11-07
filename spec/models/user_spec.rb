require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  subject { user }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to have_one(:image) }
  it { is_expected.to have_many(:own_groups).inverse_of(:owner) }
  it { is_expected.to have_many(:memberships).inverse_of(:user) }
  it { is_expected.to have_many(:groups).through(:memberships) }

  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { user.username = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do
    before { user.username = "a" * 21 }
    it { is_expected.to_not be_valid }
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

  describe :has_invitation? do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    describe "exists" do
      let!(:membership) { create(:membership, user: user, group: group) }

      it "return true" do
        expect(user.has_invitation? group.id).to be true
      end
    end

    describe "doesn't exists" do
      it "return false" do
        expect(user.has_invitation? group.id).to be false
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
      let(:group) { create(:group, subs_can_invite: true) }

      it "return true" do
        expect(user.can_invite? group.id).to be true
      end
    end

    describe "not owner & subs can't invite" do
      let(:group) { create(:group, subs_can_invite: false) }

      it "return false" do
        expect(user.can_invite? group.id).to be false
      end
    end
  end
end
