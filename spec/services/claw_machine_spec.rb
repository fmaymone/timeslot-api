require 'rails_helper'

RSpec.describe ClawMachine, type: :service do
  describe "search", :vcr do
    let(:search_term) { "baye" }
    let(:limit) { 6 }

    context "queries with timestamp" do
      let(:timestamp) { "2016-04-29T12:43:28.907Z" }
      let(:query_params) {
        { q: search_term, limit: limit, timestamp: timestamp }
      }

      describe 'soccer' do
        let(:category) { 'soccer' }

        it "returns array of slots matching the search criteria" do
          result = described_class.new.search(category: category,
                                              query_params: query_params)
          json = JSON.parse(result)
          expect(json).to have_key('result')
          expect(json['result']).to have_key('slots')
          expect(json['result']['slots'].length).to eq limit
          expect(json['result']['slots'].first['title']).to match(/baye/i)
        end
      end

      describe 'cinema' do
        it "returns array of slots matching the search criteria" do
          result = described_class.new.search(category: 'cinema',
                                              query_params: query_params)
          json = JSON.parse(result)
          expect(json).to have_key('result')
          expect(json['result']).to have_key('slots')
          expect(json['result']['slots'].length).to eq limit
        end
      end
    end

    context "queries without timestamp" do
      let(:query_params) { { q: search_term, limit: limit } }

      describe "calendars" do
        it "finds calendars with matching name" do
          result = described_class.new.search(category: 'calendars',
                                              query_params: query_params)
          json = JSON.parse(result)
          expect(json).to have_key('result')
          expect(json['result']).to have_key('calendars')
          expect(json['result']['calendars'].first).to have_key('name')

          name = json['result']['calendars'].first['name']
          expect(name).to match /#{query_params[:q]}/i
        end
      end
    end
  end
end
