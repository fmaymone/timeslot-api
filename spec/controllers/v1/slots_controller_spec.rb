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
  # let(:valid_session) { {} }

  before(:each) { request.accept = "application/json" }

  describe "GET show" do
    it "returns http success" do
      get :show, id: valid_slot.id
      expect(response).to be_success
    end

    it "assigns the requested slot as @slot" do
      get :show, id: valid_slot.id
      expect(assigns(:slot)).to eq(valid_slot)
    end

    it "renders the show template" do
      get :show, id: valid_slot.id
      expect(response).to render_template("show")
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "responds with http status Created (201)" do
        post :create, valid_attributes
        expect(response).to have_http_status(:created)
      end

      it "creates a new Slot" do
        expect {
          post :create, valid_attributes
        }.to change(Slot, :count).by(1)
      end

      it "assigns a newly created slot as @slot" do
        post :create, valid_attributes
        expect(assigns(:slot)).to be_a(Slot)
        expect(assigns(:slot)).to be_persisted
      end

      it "renders the create template" do
        post :create, valid_attributes
        expect(response).to render_template("create")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved slot as @slot" do
        post :create, invalid_attributes
        expect(assigns(:slot)).to be_a_new(Slot)
      end

      it "responds with http status Unprocessable Entity (422)" do
        post :create, invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH update" do
    describe "with valid params" do
      let(:new_attributes) { attributes_for(:slot, title: "New slot title") }

      it "respond with http status No Content (204)" do
        patch :update, { id: valid_slot.id, slot: new_attributes }
        expect(response).to have_http_status(:no_content)
      end

      it "updates the requested slot" do
        patch :update, { id: valid_slot.id, slot: new_attributes }
        valid_slot.reload
        expect(valid_slot.title).to eq("New slot title")
      end

      it "assigns the requested slot as @slot" do
        patch :update, { id: valid_slot.id, slot: new_attributes }
        expect(assigns(:slot)).to be_a(Slot)
        expect(assigns(:slot)).to eq(valid_slot)
      end
    end

    describe "with invalid params" do
      it "assigns the slot as @slot" do
        patch :update, { id: valid_slot.id, slot: invalid_attributes }
        expect(assigns(:slot)).to eq(valid_slot)
      end

      it "responds with http status Unprocessable Entity (422)" do
        patch :update, { id: valid_slot.id, slot: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE destroy" do
    let!(:valid_slot) { create(:slot) }

    it "respond with http status No Content (204)" do
      delete :destroy, id: valid_slot.id
      expect(response.status).to eq(204)
    end

    it "destroys the requested slot" do
      expect {
        delete :destroy, id: valid_slot.id
      }.to change(Slot, :count).by(-1)
    end
  end
end
