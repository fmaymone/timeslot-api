require 'rails_helper'

RSpec.describe MetaSlot, type: :model do
  let(:meta_slot) { create(:meta_slot) }

  subject { meta_slot }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:slot) }
  it { is_expected.to respond_to(:alerts) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:user).inverse_of(:meta_slots) }
  it { is_expected.to belong_to(:slot).inverse_of(:meta_slots) }

  it { is_expected.to be_valid }

  describe "when user is not present" do
    before { meta_slot.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when slot is not present" do
    before { meta_slot.slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "exists only once per user <> slot" do
    let(:user) { create(:user) }
    let(:slot) { create(:slot) }
    let!(:existing_meta_slot) { create(:meta_slot, user: user, slot: slot) }
    let(:duplicate_meta_slot) { build(:meta_slot, user: user, slot: slot) }

    it "can not be saved" do
      expect {
        duplicate_meta_slot.save
      }.to raise_error
    end
  end
end
