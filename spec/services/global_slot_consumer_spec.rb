require 'rails_helper'

RSpec.describe GlobalSlotConsumer, type: :service do
  describe 'search', :vcr do
    let(:search_term) { "baye" }
    let(:limit) { 6 }
    let(:timestamp) { "2016-07-29T12:43:28.907Z" }
    let(:query) {
      { "q" => search_term, "timestamp" => timestamp, "limit" => limit }
    }
    context 'football' do
      it "returns array of elastic-search slots matching the search criteria" do
        result = described_class.new.search('football', query)
        expect(result.length).to eq limit
        expect(result.first.title).to match(/baye/i)
      end
    end

    context 'cinema' do
      it "returns array of elastic-search slots matching the search criteria" do
        result = described_class.new.search('cinema', query)
        expect(result.length).to eq limit
      end
    end
  end
end
