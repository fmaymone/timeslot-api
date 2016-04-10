require 'rails_helper'

RSpec.describe CandyShop, type: :service do
  describe 'slot', :vcr do
    let(:muid) { attributes_for(:global_slot)[:slot_uuid] }

    context "valid data", :seed do
      it "returns a global slot from TS_DATA_MALL" do
        slot = described_class.new.slot(muid)

        expect(slot).to have_key :muid
        expect(slot).to have_key :meta
        expect(slot[:meta]).not_to be_nil
        expect(slot[:meta]).to have_key :title
        expect(slot[:meta]).to have_key :start_date
        expect(slot[:meta]).to have_key :end_date
        expect(slot).to have_key :category_uuid
        expect(slot).to have_key :url
        expect(slot).to have_key :media
        expect(slot).to have_key :notes
        expect(slot[:muid]).to eq muid
        expect(slot[:meta][:title]).not_to be_nil
        expect(slot[:meta][:start_date]).not_to be_nil
        expect(slot[:meta][:end_date]).not_to be_nil
        expect(slot[:category_uuid]).not_to be_nil
      end
    end
  end

  describe 'location', :vcr do
    let(:loc_muid) { attributes_for(:slot, :with_candy_location)[:location_uid] }

    it "returns a location from TS_DATA_MALL" do
      location = described_class.new.location(loc_muid)

      expect(location).to respond_to :name
      expect(location).to respond_to :locality
      expect(location).to respond_to :administrative_area
      expect(location).to respond_to :postal_code
      expect(location).to respond_to :country
      expect(location).to respond_to :latitude
      expect(location).to respond_to :longitude
      expect(location.locality).not_to be_nil
      expect(location.iso_country_code).not_to be_nil
      expect(location.latitude).not_to be_nil
      expect(location.longitude).not_to be_nil
    end
  end

  describe 'category', :vcr do
    let(:category_muid) { '4870f9d3-a629-9578-edcc-3e6c954baeba' }
      # attributes_for(:slot, :with_candy_location)[:location_uid] }

    it "returns a new user with role global_slot_category" do
      category = described_class.new.category(category_muid)

      expect(category.class).to eq User
      expect(category.valid?).to be true
      expect(category.user_uuid).to eq category_muid
      expect(category.username).not_to be_nil
      expect(category.picture).not_to be_nil
      expect(category.global_slot_category?).to be true
      expect(category.role).to eq 'global_slot_category'
      expect(
        category.email
      ).to eq "#{category.username.downcase}.category@timeslot.com"
    end
  end
end
