require 'rails_helper'

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
        }.to change(user.image, :first)
        expect(user.image.first).not_to be nil
        expect(user.image.first.media_type).to eq "image"
      end
    end

    describe "passing invalid image data" do
      it "returns model with errors" do
        AddImage.call(user, nil)
        expect(user.errors.blank?).not_to be true
        expect(user.errors.messages).to have_key :mediaItem
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
        it "updates the image", :vcr do
          expect(user.image.first.public_id).not_to eq public_id
          expect {
            AddImage.call(user, public_id)
          }.to change(MediaItem, :count).by 1

          expect(user.image.first.public_id).to eq public_id
        end
      end
    end
  end
end
