require 'rails_helper'

RSpec.describe V1::BaseSlotsController, type: :controller do
  before(:each) { request.accept = "application/json" }

  let(:valid_attributes) { attributes_for(:meta_slot) }
  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }
  let!(:current_user) { create(:user) }

  describe "POST create" do
    describe "with valid params" do
      let(:valid_attributes) {
        attributes_for(:meta_slot, creator: current_user).merge(
          visibility: '10', footest: "myfootest")

      }
      it "responds with http status Created (201)" do
        post :create, new_slot: valid_attributes
        expect(response).to have_http_status(:created)
      end

      it "renders the create template" do
        post :create, new_slot: valid_attributes
        expect(response).to render_template("show")
      end

      it "creates a new MetaSlot" do
        expect {
          post :create, { new_slot: valid_attributes }, valid_session
        }.to change(MetaSlot, :count).by(1)
      end

      it "creates a new StdSlot" do
        expect {
          post :create, { new_slot: valid_attributes }, valid_session
        }.to change(StdSlot, :count).by(1)
      end

      it "creates a new SlotSetting" do
        skip "Add primary key for SlotSetting"
        expect {
          post :create, { new_slot: valid_attributes }, valid_session
        }.to change(SlotSetting, :count).by(1)
      end

      it "assigns a newly created base_slot as @std_slot" do
        post :create, { new_slot: valid_attributes }, valid_session
        expect(assigns(:std_slot)).to be_a(StdSlot)
        expect(assigns(:std_slot)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved slot as @slot" do
        post :create, new_slot: invalid_attributes
        expect(assigns(:slot)).to be_a_new(MetaSlot)
      end

      it "responds with http status Unprocessable Entity (422)" do
        post :create, new_slot: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
