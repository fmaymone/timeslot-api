require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }

  subject { group }

  it { is_expected.to respond_to(:owner) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:members_can_post) }
  it { is_expected.to respond_to(:members_can_invite) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:owner).inverse_of(:own_groups) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to have_many(:images) }
  it { is_expected.to have_many(:group_slots).inverse_of(:group) }
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

  describe "create_with_image" do
    let(:user) { create(:user) }
    let(:group_params) { attributes_for(:group).merge(owner: user) }
    let(:image) { { public_id: 'foobar',
                    local_id: 'B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001' } }

    context "valid params" do
      it "creates a new group" do
        expect {
          Group.create_with_image(group_params: group_params,
                                  image: image,
                                  user: user)
        }.to change(Group, :count).by 1
      end

      it "sets an image if provided" do
        expect {
          Group.create_with_image(group_params: group_params,
                                  image: image,
                                  user: user)
        }.to change(MediaItem, :count).by 1
        expect(Group.last.image.public_id).to eq image[:public_id]
        expect(Group.last.image.creator).to eq user
      end

      it "sets the local_id on the image if provided" do
        Group.create_with_image(group_params: group_params,
                                image: image,
                                user: user)
        expect(Group.last.image.local_id).to eq image[:local_id]
        expect(Group.last.image.creator).to eq user
      end
    end

    context "invalid params" do
      it "doesn't create a new group if groupname is nil" do
        expect {
          Group.create_with_image(group_params: { name: nil }, user: user)
        }.not_to change(Group, :count)
      end
    end
  end
end
