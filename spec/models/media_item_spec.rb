require 'rails_helper'

RSpec.describe MediaItem, type: :model do
  let(:media_item) { build(:slot_image) }

  subject { media_item }

  it { is_expected.to respond_to(:public_id) }
  it { is_expected.to respond_to(:duration) }
  it { is_expected.to respond_to(:thumbnail) }
  it { is_expected.to respond_to(:position) }
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

  describe "when position is not present" do
    before { media_item.position = nil }
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

  describe :delete do
    let!(:media_item) { create(:slot_image) }

    it "doesn't remove the media_item from the database" do
      expect { media_item.delete }.not_to change(MediaItem, :count)
    end

    it "sets deleted_at on the media_item" do
      media_item.delete
      expect(media_item.deleted_at?).to be true
    end

    it "adds a cloudinary tag to the image", :vcr do
      user = FactoryGirl.create(:user, :with_real_image)
      media_item = user.image

      media_item.delete

      tags = Cloudinary::Api.resource(media_item.public_id)["tags"]
      expect(tags).to include "replaced"

      Cloudinary::Uploader.remove_tag("replaced", media_item.public_id)
      Cloudinary::Uploader.remove_tag("mediable_id:#{media_item.mediable_id}",
                                      media_item.public_id)
      Cloudinary::Uploader.remove_tag("mediable_type:#{media_item.mediable_type}",
                                      media_item.public_id)
    end
  end

  describe "valid_sorting?" do
    it "returns true if order is valid" do
      param = [
        { media_id: 1,
          position: 2 },
        { media_id: 2,
          position: 0 },
        { media_id: 3,
          position: 1 }
      ]
      result = described_class.valid_sorting? param
      expect(result).to eq true
    end

    it "returns false if gaps in the position numbers" do
      param = [
        { media_id: 1,
          position: 3 },
        { media_id: 2,
          position: 0 },
        { media_id: 3,
          position: 1 }
      ]
      result = described_class.valid_sorting? param
      expect(result).to eq false
    end

    it "returns false if the position numbers don't start with 0" do
      param = [
        { media_id: 1,
          position: 2 },
        { media_id: 2,
          position: 3 },
        { media_id: 3,
          position: 1 }
      ]
      result = described_class.valid_sorting? param
      expect(result).to eq false
    end
  end
end
