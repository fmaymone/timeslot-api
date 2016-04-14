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
          expect(json['result']).to have_key(category)
          expect(json['result'][category]).to have_key('slots')
          slots = json['result'][category]['slots']
          expect(slots.length).to eq limit
          expect(slots.first['title']).to match(/baye/i)
        end
      end

      describe 'cinema' do
        let(:category) { 'cinema' }
        let(:search_term) { "man" }

        it "returns array of slots matching the search criteria" do
          result = described_class.new.search(category: category,
                                              query_params: query_params)
          json = JSON.parse(result)
          expect(json).to have_key('result')
          expect(json['result']).to have_key(category)
          expect(json['result'][category]).to have_key('slots')
          slots = json['result'][category]['slots']
          expect(slots.length).to eq limit
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
          expect(json['result']).to have_key('public')
          expect(json['result']['public']).to have_key('calendars')
          calendars = json['result']['public']['calendars']
          expect(calendars.first).to have_key('name')
          expect(calendars.first['name']).to match /#{query_params[:q]}/i
        end
      end
    end
  end
end
