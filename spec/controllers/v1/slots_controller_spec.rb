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

  describe "POST create_stdslot" do
    describe "with valid params" do
      let(:valid_attributes) {
        attributes_for(:meta_slot, creator: current_user).merge(
          visibility: 'private')
      }
      it "responds with http status Created (201)" do
        post :create_stdslot, valid_attributes
        expect(response).to have_http_status(:created)
      end

      it "renders the create template" do
        post :create_stdslot, valid_attributes
        expect(response).to render_template("create")
      end

      it "creates a new MetaSlot" do
        expect {
          post :create_stdslot, valid_attributes
        }.to change(MetaSlot, :count).by(1)
      end

      it "creates a new StdSlot" do
        expect {
          post :create_stdslot, valid_attributes
        }.to change(StdSlot.unscoped, :count).by(1)
      end

      it "creates a new SlotSetting" do
        expect {
          post :create_stdslot, valid_attributes.merge(
                 settings: { alerts: '1110111010' })
        }.to change(SlotSetting, :count).by(1)
      end
    end
  end
end
