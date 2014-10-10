require 'rails_helper'

RSpec.describe V1::SlotsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Slot. As you add validations to Slot, be sure to
  # adjust the attributes here as well.
  let(:valid_slot) { create(:slot) }
  let(:valid_attributes) { attributes_for(:slot) }
  let(:invalid_attributes) { attributes_for(:slot, title: nil) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # V1::SlotsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) { request.accept = "application/json" }

  describe "GET show" do
    it "returns http success" do
      get :show, id: valid_slot.id
      expect(response).to be_success
    end

    it "assigns the requested slot as @slot" do
      get :show, { id: valid_slot.to_param }, valid_session
      expect(assigns(:slot)).to eq(valid_slot)
    end

    it "renders the show template" do
      get :show, id: valid_slot.id
      expect(response).to render_template("show")
      expect(response.body).to eq ""
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "returns http success" do
        post :create, valid_attributes
        expect(response).to be_success
      end

      it "responds with http status 422 aka Unprocessable Entity" do
        post :create, valid_attributes
        expect(response).to have_http_status(:created)
      end

      it "creates a new Slot" do
        expect {
          post :create, valid_attributes, valid_session
        }.to change(Slot, :count).by(1)
      end

      it "assigns a newly created slot as @slot" do
        post :create, valid_attributes
        expect(assigns(:slot)).to be_a(Slot)
        expect(assigns(:slot)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved slot as @slot" do
        post :create, invalid_attributes, valid_session
        expect(assigns(:slot)).to be_a_new(Slot)
      end

      it "responds with http status 422 aka Unprocessable Entity" do
        post :create, invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { attributes_for(:slot, title: "New slot title") }

      it "returns http success" do
        slot = Slot.create! valid_attributes
        put :update, { id: slot.to_param, slot: new_attributes }, valid_session
        expect(response).to be_success
      end

      it "updates the requested slot" do
        slot = Slot.create! valid_attributes
        put :update, { id: slot.to_param, slot: new_attributes }, valid_session
        slot.reload
        expect(slot.title).to eq("New slot title")
      end

      it "assigns the requested slot as @slot" do
        slot = Slot.create! valid_attributes
        put :update, { id: slot.to_param, slot: valid_attributes }
        expect(assigns(:slot)).to eq(slot)
      end
    end

    describe "with invalid params" do
      it "assigns the slot as @slot" do
        slot = Slot.create! valid_attributes
        put :update, { id: slot.to_param, slot: invalid_attributes }
        expect(assigns(:slot)).to eq(slot)
      end

      it "responds with http status 422 aka Unprocessable Entity" do
        slot = Slot.create! valid_attributes
        put :update, { id: slot.to_param, slot: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested slot" do
      slot = Slot.create! valid_attributes
      expect {
        delete :destroy, { id: slot.to_param }, valid_session
      }.to change(Slot, :count).by(-1)
    end
  end
end
