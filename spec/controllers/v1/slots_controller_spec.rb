require 'rails_helper'

RSpec.describe V1::SlotsController, type: :controller do
  before(:each) {
    request.accept = "application/json"
    request.headers['Authorization'] = "Token token=#{current_user.auth_token}"
  }
  let(:current_user) { create(:user, :with_email, :with_password) }

  describe "GET show" do
    let(:std_slot) { create(:std_slot_public) }

    it "returns http success" do
      get :show, id: std_slot.id
      expect(response).to be_success
    end

    it "assigns the requested slot as @slot" do
      get :show, id: std_slot.id
      expect(assigns(:slot)).to eq(std_slot)
    end

    it "renders the show template" do
      get :show, id: std_slot.id
      expect(response).to render_template("show")
    end
  end
end
