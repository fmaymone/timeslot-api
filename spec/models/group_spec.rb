require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }

  subject { group }

  it { is_expected.to respond_to(:owner) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:uuid) }
  it { is_expected.to respond_to(:members_can_post) }
  it { is_expected.to respond_to(:members_can_invite) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:owner).inverse_of(:own_groups) }
  it { is_expected.to have_many(:containerships).inverse_of(:group) }
  it { is_expected.to have_many(:memberships).inverse_of(:group) }
  it { is_expected.to have_many(:related_users)
                       .class_name(User)
                       .through(:memberships)
                       .source(:user) }
  it { is_expected.to have_many(:active_memberships) }
  it { is_expected.to have_many(:members)
                       .class_name(User)
                       .through(:active_memberships)
                       .source(:user) }
  it { is_expected.to respond_to(:followers) }
  it { is_expected.to respond_to(:followings) }
  it { is_expected.to respond_to(:follow) }
  it { is_expected.to respond_to(:unfollow) }
  it { is_expected.to respond_to(:add_follower) }
  it { is_expected.to respond_to(:remove_follower) }
  it { is_expected.to respond_to(:follows?) }
  it { is_expected.to respond_to(:following?) }
  it { is_expected.to respond_to(:followed_by?) }
  it { is_expected.to respond_to(:followers_count) }
  it { is_expected.to respond_to(:followings_count) }

  it { is_expected.to be_valid }

  describe "when owner is not present" do
    before { group.owner = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when name is not present" do
    before { group.name = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do
    before { group.name = "a" * 256 }
    it { is_expected.to_not be_valid }
  end

  describe "when uuid is not present" do
    let(:group) { create(:group) }
    before { group.uuid = nil }

    it "raises not_null constraint error" do
      expect { group.save }.to raise_error ActiveRecord::StatementInvalid
    end
  end

  describe :members do
    let(:group) { create(:group, :with_3_members) }
    let!(:inactive_members) do
      create_list(:membership, 2, :inactive, group: group)
    end

    it "only returns active group members" do
      # group owner is automatically an active member too
      expect(group.members.count).to eq 4
    end
  end

  describe :related_users do
    let(:group) { create(:group, :with_3_members) }
    let!(:inactive_members) do
      create_list(:membership, 2, :inactive, group: group)
    end

    it "returns all related users" do
      # group owner is automatically an active member too
      expect(group.related_users.count).to eq 6
    end
  end

  describe :delete do
    let(:group) { create(:group, :with_3_members) }
    let!(:active_members) do
      create_list(:membership, 2, :active, group: group)
    end
    let!(:inactive_members) do
      create_list(:membership, 2, :inactive, group: group)
    end

    it "sets deleted_at on the group" do
      group.delete
      expect(group.deleted_at?).to be true
    end

    it "sets deleted_at on the groups memberships" do
      group.delete
      expect(group.memberships.first.deleted_at?).to be true
      expect(group.memberships.last.deleted_at?).to be true
    end
  end

  describe "create_with_invitees" do
    let(:owner) { create(:user) }
    let(:group_params) { attributes_for(:group).merge(owner: owner) }
    let(:image) { 'http://cloudinary.com/foobar' }
    let(:invitees) { create_list(:user, 3).collect(&:id) }

    context "valid params" do
      it "creates a new group" do
        expect {
          Group.create_with_invitees(group_params: group_params)
        }.to change(Group, :count).by 1
      end

      it "sets an image if provided" do
        group_params.merge!(image: image)
        Group.create_with_invitees(group_params: group_params)
        expect(Group.last.image).not_to be nil
        expect(Group.last.image).to eq image
      end

      it "invites users to the group if provided" do
        Group.create_with_invitees(group_params: group_params,
                                   invitees: invitees)
        expect(Group.last.related_users).not_to be nil
        expect(Group.last.related_users.count).to eq 4
        expect(Group.last.members.count).to eq 1
        expect(Group.last.members).to include owner
      end
    end

    context "invalid params" do
      it "doesn't create a new group if groupname is nil" do
        expect {
          Group.create_with_invitees(group_params: { name: nil })
        }.not_to change(Group, :count)
      end
    end
  end
end
