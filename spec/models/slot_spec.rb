require "rails_helper"

RSpec.describe Slot, type: :model do
  let(:slot) { build(:slot) }

  subject { slot }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:startdate) }
  it { is_expected.to respond_to(:enddate) }
  it { is_expected.to respond_to(:note) }
  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to respond_to(:alerts) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }
  it { is_expected.to have_many(:users).through(:meta_slots) }

  it { is_expected.to be_valid }

  describe "when title is not present" do
    before { slot.title = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when title is too long" do
    before { slot.title = "a" * 49 }
    it { is_expected.to_not be_valid }
  end

  describe "when startdate is not present" do
    before { slot.startdate = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when enddate is not present" do
    before { slot.enddate = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when note is not present" do
    before { slot.note = "" }
    it { is_expected.to be_valid }
  end

  describe "when note is too long" do
    before { slot.note = "a" * 501 }
    it { is_expected.to_not be_valid }
  end

  describe "when visibility is not present" do
    before { slot.visibility = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when alerts is not present" do
    before { slot.alerts = "" }
    it { is_expected.to_not be_valid }
  end

  describe "prevent removing from db" do
    let!(:slot) { create(:slot) }

    it "can not be deleted" do
      before_count = described_class.count

      expect(Rails.logger).to receive(:error)
      expect {
        slot.delete
      }.to raise_error
      expect(before_count).to eq described_class.all.size
    end

    it "can not be destroyed" do
      before_count = described_class.count

      expect(Rails.logger).to receive(:error)
      expect {
        slot.destroy
      }.to raise_error
      expect(before_count).to eq described_class.all.size
    end
  end
end
