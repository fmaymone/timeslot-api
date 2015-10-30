require 'rails_helper'

RSpec.describe GroupSlot, type: :model do
  let(:group_slot) { build(:group_slot) }

  subject { group_slot }

  it { is_expected.to respond_to(:group) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:open_end) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to respond_to(:slot_type) }
  it { is_expected.to belong_to(:meta_slot) }
  it { is_expected.to belong_to(:group).inverse_of(:group_slots) }

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

  describe "when group is not present" do
    before { group_slot.group = nil }
    it { is_expected.to_not be_valid }
  end

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot) }
    let(:group_slot) { create(:group_slot, meta_slot: meta_slot) }

    it "contains start_date of the meta_slot" do
      expect(group_slot.start_date).to eq meta_slot.start_date
    end
  end

  describe "create_slot" do
    let!(:meta_slot) { create(:meta_slot) }
    let!(:group) { create(:group) }

    it "creates a new GroupSlotMembers" do
      expect {
        described_class.create_slot(meta_slot: meta_slot, group: group)
      }.to change(GroupSlotMembers, :count).by 1
    end

    it "creates a new GroupSlotPublic" do
      skip "I don't have public groups yet"
      expect {
        described_class.create_slot(meta_slot: meta_slot, group: group)
      }.to change(GroupSlotPublic, :count).by 1
    end
  end

  describe :delete do
    let(:group) { create(:group) }
    let(:group_slot) { create(:group_slot, group: group) }

    it "sets deleted_at" do
      expect { group_slot.delete }.to change(group_slot, :deleted_at)
    end

    it "notifies group about a change" do
      expect { group_slot.delete }.to change(group_slot.group, :updated_at)
    end
  end
end
