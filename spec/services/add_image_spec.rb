require 'rails_helper'

RSpec.describe AddImage, type: :service do
  before(:each) { DatabaseCleaner.start }
  after(:each) { DatabaseCleaner.clean }

  let(:user) { FactoryGirl.create(:user) }
  let(:public_id) { FactoryGirl.attributes_for(:mock_image)[:public_id] }

  describe :call do
    describe "passing valid parameters" do
      it "returns true" do
        expect(AddImage.call(user, user.id, public_id)).to eq true
      end

      it "it creates a new MediaItem of type image" do
        expect {
          AddImage.call(user, user.id, public_id)
        }.to change(user.images, :first)
        expect(user.image).not_to be nil
        expect(user.image.media_type).to eq('image')
        expect(user.image.creator).to eq(user)
      end
    end

    describe "passing invalid image data" do
      it "returns model with errors" do
        AddImage.call(user, user.id, nil)
        expect(user.errors.blank?).not_to be true
        expect(user.errors.messages).to have_key :mediaItem
      end

      it "doesn't create a new MediaItem if public_id is missing" do
        expect {
          AddImage.call(user, user.id, nil)
        }.not_to change(MediaItem, :count)
      end

      it "doesn't create a new MediaItem if creator_id is missing" do
        expect {
          AddImage.call(user, public_id, nil)
        }.not_to change(MediaItem, :count)
      end
    end

    describe "existing image" do
      let(:user) { FactoryGirl.create(:user, :with_image) }

      describe "passing valid parameters" do
        it "updates the image", :vcr do
          expect(user.image.public_id).not_to eq public_id
          expect {
            AddImage.call(user, user.id, public_id)
          }.to change(MediaItem, :count).by 1

          expect(user.image.public_id).to eq(public_id)
          expect(user.image.creator).to eq(user)
        end
      end
    end
  end
end
