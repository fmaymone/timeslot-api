require "rails_helper"

RSpec.describe MetaSlot, type: :model do
  let(:meta_slot) { build(:meta_slot) }

  subject { meta_slot }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:creator) }
  it { is_expected.to respond_to(:location_id) }
  it { is_expected.to respond_to(:location) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to have_many(:base_slots).inverse_of(:meta_slot) }
  it { is_expected.to belong_to(:creator).inverse_of(:created_slots) }

  it { is_expected.to be_valid }

  describe "when title is not present" do
    before { meta_slot.title = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when title is too long" do
    before { meta_slot.title = "a" * 49 }
    it { is_expected.to_not be_valid }
  end

  describe "when start_date is not present" do
    before { meta_slot.start_date = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when end_date is not present" do
    before { meta_slot.end_date = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when creator is not present" do
    before { meta_slot.creator = nil }
    it { is_expected.to_not be_valid }
  end

  describe :unregister do
    let(:meta_slot) { create(:meta_slot) }
    let(:user) { create(:user) }
    let!(:slot_setting) {
      create(:slot_setting, meta_slot: meta_slot, user: user) }

    it "unregisters on related slot_settings" do
      meta_slot.unregister user
      slot_setting.reload
      expect(slot_setting.deleted_at?).to be true
    end

    it "deletes itself if no other base_slot references it" do
      meta_slot.unregister user
      expect(meta_slot.deleted_at?).to be true
    end

    it "doesn't delete itself if another base_slot references it" do
      create(:std_slot, meta_slot: meta_slot)
      meta_slot.unregister user
      expect(meta_slot.deleted_at?).to be false
    end
  end

  describe "delete" do
    let!(:meta_slot) { create(:meta_slot) }

    it "sets deleted_at on the slot" do
      expect { meta_slot.delete }.to change(meta_slot, :deleted_at)
    end

    it "can not be destroyed" do
      before_count = described_class.count

      expect(Rails.logger).to receive(:error)
      expect {
        meta_slot.destroy
      }.to raise_error
      expect(before_count).to eq described_class.all.size
    end
  end
end
