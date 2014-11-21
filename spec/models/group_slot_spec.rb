require 'rails_helper'

RSpec.describe GroupSlot, type: :model do
  let(:group_slot) { build(:group_slot) }

  subject { group_slot }

  it { is_expected.to respond_to(:group) }
  it { is_expected.to respond_to(:note) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to respond_to(:startdate) }
  it { is_expected.to belong_to(:group).inverse_of(:group_slots) }

  it { is_expected.to be_valid }

  describe "when group is not present" do
    before { group_slot.group = nil }
    it { is_expected.to_not be_valid }
  end

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot) }
    let(:group_slot) { create(:group_slot, meta_slot: meta_slot) }

    it "contains startdate of the meta_slot" do
      expect(group_slot.startdate).to eq meta_slot.startdate
    end
  end
end
