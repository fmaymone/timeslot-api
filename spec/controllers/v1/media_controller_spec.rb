require 'rails_helper'

RSpec.describe V1::MediaController, type: :controller do
  before(:each) { request.accept = "application/json" }

  describe "GET show" do
    it "returns http success" do
      get :create_signature
      expect(response).to be_success
    end

    it "renders the show template" do
      get :create_signature
      expect(response).to render_template("show")
    end
  end

  describe "GET index" do
    it "renders a full list of media items" do
      expect(get: "/v1/users/1/media")
          .to route_to("v1/users#media_items",
                       user_id: '1',
                       format: :json)
    end
  end
end
