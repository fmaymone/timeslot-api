require 'rails_helper'

RSpec.describe MediaItem, type: :model do
  let(:media_item) { build(:slot_image) }

  subject { media_item }

  it { is_expected.to respond_to(:public_id) }
  it { is_expected.to respond_to(:ordering) }
  it { is_expected.to respond_to(:media_type) }
  it { is_expected.to respond_to(:mediable_id) }
  it { is_expected.to respond_to(:mediable_type) }

  it { is_expected.to be_valid }

  describe "when media_type is not present" do
    before { media_item.media_type = "" }
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
end
