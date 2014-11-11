require 'rails_helper'

RSpec.describe MediaItem, type: :model do
  let(:media_item) { build(:slot_image) }

  subject { media_item }

  it { is_expected.to respond_to(:public_id) }
  it { is_expected.to respond_to(:ordering) }
  it { is_expected.to respond_to(:media_type) }
  it { is_expected.to respond_to(:mediable_id) }
  it { is_expected.to respond_to(:mediable_type) }
  it { is_expected.to respond_to(:deleted_at) }

  it { is_expected.to be_valid }

  describe "when media_type is not present" do
    before { media_item.media_type = "" }
    it { is_expected.to_not be_valid }
  end

  describe "with wrong media_type" do
    before { media_item.media_type = "foo" }
    it { is_expected.to_not be_valid }
  end

  describe "when public_id is not present" do
    before { media_item.public_id = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when ordering is not present" do
    before { media_item.ordering = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when mediable_id is not present" do
    before { media_item.mediable_id = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when mediable_type is not present" do
    before { media_item.mediable_type = nil }
    it { is_expected.to_not be_valid }
  end

  describe ".valid_ordering?"  do
    it "returns true if order is valid" do
      param = [
        { media_item_id: 1,
          ordering: 2 },
        { media_item_id: 2,
          ordering: 0 },
        { media_item_id: 3,
          ordering: 1 }
      ]
      result = described_class.valid_ordering? param
      expect(result).to eq true
    end

    it "returns false if gaps in the ordering numbers" do
      param = [
        { media_item_id: 1,
          ordering: 3 },
        { media_item_id: 2,
          ordering: 0 },
        { media_item_id: 3,
          ordering: 1 }
      ]
      result = described_class.valid_ordering? param
      expect(result).to eq false
    end

    it "returns false if the ordering numbers don't start with 0" do
      param = [
        { media_item_id: 1,
          ordering: 2 },
        { media_item_id: 2,
          ordering: 3 },
        { media_item_id: 3,
          ordering: 1 }
      ]
      result = described_class.valid_ordering? param
      expect(result).to eq false
    end
  end

end
