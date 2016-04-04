require 'rails_helper'

RSpec.describe V1::GlobalSlotsController, type: :controller do
  before(:each) { request.accept = "application/json" }

  describe "GET search" do
    # moment param is necessary to let vcr detect the correct cassettes
    # TODO: use Time.zone.now.next_month or so instead of hard-coded date
    let(:basic_params) { { category: 'cinema', q: 'foo', moment: '2015-11-11' } }

    it "returns http success", :vcr do
      get :search, basic_params
      expect(response).to be_success
    end

    context "invalid parameters, returns 403" do
      it "for invalid moment" do
        get :search, basic_params.merge(moment: 'foo')
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to include 'not a valid value'
        expect(response.body).to include 'moment'
      end

      it "for invalid moment 2" do
        get :search, basic_params.merge(moment: '2015-3foo')
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to include 'not a valid value'
        expect(response.body).to include 'moment'
      end
    end
  end
end
