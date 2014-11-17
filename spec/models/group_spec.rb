require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }

  subject { group }

  it { is_expected.to respond_to(:owner) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:subs_can_post) }
  it { is_expected.to respond_to(:subs_can_invite) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:owner).inverse_of(:own_groups) }
  it { is_expected.to have_one(:image) }
  it { is_expected.to have_many(:memberships).inverse_of(:group) }
  it { is_expected.to have_many(:related_users)
                       .class_name("User")
                       .through(:memberships)
                       .source(:user) }
  it { is_expected.to have_many(:active_memberships) }
  it { is_expected.to have_many(:members)
                       .class_name("User")
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

  describe :members do
    let(:group) { create(:group, :with_3_members) }
    let!(:inactive_members) do
      create_list(:membership, 2, :inactive, group: group)
    end

    it "only returns active group members" do
      expect(group.members.count).to eq 3
    end
  end

  describe :related_users do
    let(:group) { create(:group, :with_3_members) }
    let!(:inactive_members) do
      create_list(:membership, 2, :inactive, group: group)
    end

    it "returns all related users" do
      expect(group.related_users.count).to eq 5
    end
  end
end
