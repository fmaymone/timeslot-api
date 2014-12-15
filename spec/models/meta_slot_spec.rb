require "rails_helper"

RSpec.describe MetaSlot, type: :model do
  let(:meta_slot) { build(:meta_slot) }

  subject { meta_slot }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:creator) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:creator).inverse_of(:created_slots) }
  # it { is_expected.to have_many(:users).through(:slot_settings) }

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

  describe "prevent removing from db" do
    let!(:meta_slot) { create(:meta_slot) }

    it "can not be deleted" do
      before_count = described_class.count

      expect(Rails.logger).to receive(:error)
      expect {
        meta_slot.delete
      }.to raise_error
      expect(before_count).to eq described_class.all.size
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
