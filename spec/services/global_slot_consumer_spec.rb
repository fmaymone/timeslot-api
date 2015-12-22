require 'rails_helper'

RSpec.describe GlobalSlotConsumer, type: :service do
  describe 'slot', :vcr do
    let(:muid) { attributes_for(:global_slot)[:muid] }

    context "valid data", :vcr, :seed do
      it "returns a global slot from TS_DATA_MALL" do
        slot = described_class.new.slot(muid)

        expect(slot).to have_key :muid
        expect(slot).to have_key :meta
        expect(slot[:meta]).not_to be_nil
        expect(slot[:meta]).to have_key :title
        expect(slot[:meta]).to have_key :start_date
        expect(slot[:meta]).to have_key :end_date
        expect(slot).to have_key :user
        expect(slot).to have_key :url
        expect(slot).to have_key :media
        expect(slot).to have_key :notes
        expect(slot[:muid]).to eq muid
        expect(slot[:meta][:title]).not_to be_nil
        expect(slot[:meta][:start_date]).not_to be_nil
        expect(slot[:meta][:end_date]).not_to be_nil
        expect(slot[:user]).not_to be_nil
      end
    end

    context "invalid data", :vcr do
      it "raises exception if globalslot domain has no matching backend user" do
        expect {
          described_class.new.slot(muid)
        }.to raise_error ActionController::ParameterMissing
      end
    end
  end

  describe 'location', :vcr do
    let(:loc_muid) { "19f95a00-2f9c-3578-7bdb-10b6276e08a8" }

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
      expect(location.country).not_to be_nil
      expect(location.latitude).not_to be_nil
      expect(location.longitude).not_to be_nil
    end
  end

  describe :search do
    it "returns global slots from data-teams elastic search service" do
      skip "Pending"
    end
  end
end
