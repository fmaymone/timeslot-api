require 'rails_helper'

RSpec.describe ClawMachine, type: :service do
  describe "search", :vcr do
    let(:query_params) { { q: 'tim', limit: 2 } }

    context "calendars" do
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
