require 'rails_helper'

RSpec.describe V1::MediaController, type: :controller do
  before(:each) { request.accept = "application/json" }

  describe "GET create_signature" do
    it "returns http success" do
      get :create_signature
      expect(response).to be_success
    end

    it "renders the create_signature template" do
      get :create_signature
      expect(response).to render_template("show")
    end
  end
end
