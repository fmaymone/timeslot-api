require 'spec_helper'

RSpec.describe AddImage, type: :service do
  before(:each) { DatabaseCleaner.start }
  after(:each) { DatabaseCleaner.clean }

  let(:user) { FactoryGirl.create(:user) }
  let(:public_id) { FactoryGirl.attributes_for(:mock_image)[:public_id] }

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

    describe "existing image" do
      let(:user) { FactoryGirl.create(:user, :with_image) }

      describe "passing valid parameters" do
        it "updates the image" do
          expect(user.image.public_id).not_to eq public_id
          expect {
            AddImage.call(user, public_id)
          }.not_to change(MediaItem, :count)
          expect(user.image.public_id).to eq public_id
        end
      end
    end
  end

  describe :unlink_existing_image do
    it "unsets the models image" do
      user = FactoryGirl.create(:user, :with_image)
      AddImage.instance_eval do
        unlink_existing_image user
      end
      expect(user.image).to be nil
    end

    it "removes the media_item from the database" do
      user = FactoryGirl.create(:user, :with_image)
      expect {
        AddImage.instance_eval {
          unlink_existing_image user
        }
      }.to change(MediaItem, :count).by(-1)
    end

    it "adds a cloudinary tag to the image" do
      user = FactoryGirl.create(:user, :with_real_image)
      public_id = user.image.public_id
      AddImage.instance_eval {
        unlink_existing_image user
      }
      tags = Cloudinary::Api.resource(public_id)["tags"]
      expect(tags).to include("replaced", "model-id:#{user.id}")

      Cloudinary::Uploader.remove_tag("replaced", public_id)
      Cloudinary::Uploader.remove_tag("model-id:#{user.id}", public_id)
    end
  end
end
