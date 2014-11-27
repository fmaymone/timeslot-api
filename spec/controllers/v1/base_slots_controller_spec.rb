require 'rails_helper'

RSpec.describe V1::BaseSlotsController, type: :controller do
  before(:each) { request.accept = "application/json" }

  let(:valid_session) { {} }
  let!(:current_user) { create(:user) }

  describe "GET index" do
    let(:metas) { create_list(:meta_slot, 2, creator: current_user) }
    let!(:std_slots_1) { create(:std_slot, meta_slot: metas[0]) }
    let!(:std_slots_2) { create(:std_slot, meta_slot: metas[1]) }
    let!(:re_slots) { create_list(:re_slot, 4, slotter: current_user) }

    let(:groups) { create_list(:group, 2) }
    let!(:memberships) {
      create(:membership, group: groups[0], user: current_user)
      create(:membership, group: groups[1], user: current_user) }
    let!(:group_slots_1) { create_list(:group_slot, 3, group: groups[0]) }
    let!(:group_slots_2) { create_list(:group_slot, 5, group: groups[1]) }

    it "assigns all groups as @groups" do
      get :index, {}, valid_session
      slots_count = 2 + re_slots.size + group_slots_1.size + group_slots_2.size
      expect(assigns(:slots).length).to eq slots_count
    end
  end

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
        expect {
          post :create, { new_slot: valid_attributes }, valid_session
        }.to change(SlotSetting, :count).by(1)
      end

      it "assigns a newly created base_slot as @slot" do
        post :create, { new_slot: valid_attributes }, valid_session
        expect(assigns(:slot)).to be_a(BaseSlot)
        expect(assigns(:slot)).to be_persisted
      end
    end
  end
end
