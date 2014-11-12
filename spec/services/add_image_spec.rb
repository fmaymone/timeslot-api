require 'spec_helper'

describe AddImage do
  let(:user) { FactoryGirl.create(:user) }
  let(:public_id) { FactoryGirl.attributes_for(:user_image)[:public_id] }

  describe :call do
    describe "passing valid parameters" do
      it "returns true" do
        expect(AddImage.call(user, public_id)).to eq true
      end

      it "it creates a new MediaItem of type image" do
        expect {
          AddImage.call(user, public_id)
        }.to change(user, :image)
        expect(user.image).not_to be nil
        expect(user.image.media_type).to eq "image"
      end
    end

    describe "passing invalid image data" do
      it "returns model with errors" do
        expect(AddImage.call(user, nil)).to eq user
        expect(user.errors.blank?).not_to be true
      end

      it "doesn't create a new MediaItem" do
        expect {
          AddImage.call(user, nil)
        }.not_to change(MediaItem, :count)
      end
    end
  end
end
