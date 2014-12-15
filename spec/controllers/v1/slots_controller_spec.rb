require 'rails_helper'

RSpec.describe V1::SlotsController, type: :controller do
  before(:each) {
    request.accept = "application/json"
    described_class.new.current_user = current_user
  }
  let(:current_user) { create(:user) }
  let(:valid_session) { {} }

  describe "GET index" do
    let(:metas) { create_list(:meta_slot, 2, creator: current_user) }
    let!(:std_slots_1) {
      create(:std_slot, meta_slot: metas[0], owner: current_user) }
    let!(:std_slots_2) {
      create(:std_slot, meta_slot: metas[1], owner: current_user) }
    let!(:re_slots) { create_list(:re_slot, 4, slotter: current_user) }

    let(:groups) { create_list(:group, 2) }
    let!(:memberships) {
      create(:membership, group: groups[0], user: current_user)
      create(:membership, group: groups[1], user: current_user) }
    let!(:group_slots_1) { create_list(:group_slot, 3, group: groups[0]) }
    let!(:group_slots_2) { create_list(:group_slot, 5, group: groups[1]) }

    it "assigns all slots as @slots" do
      get :index, {}, valid_session
      slots_count = 2 + re_slots.size + group_slots_1.size + group_slots_2.size
      expect(assigns(:slots).length).to eq slots_count
    end
  end

  describe "GET show" do
    let(:std_slot) { create(:std_slot) }

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
        attr = attributes_for(:meta_slot, creator: current_user).merge(
          visibility: '10')
        attr.transform_keys { |key| key.to_s.camelize(:lower) }
      }
      it "responds with http status Created (201)" do
        post :create_stdslot, newSlot: valid_attributes
        expect(response).to have_http_status(:created)
      end

      it "renders the create template" do
        post :create_stdslot, newSlot: valid_attributes
        expect(response).to render_template("show")
      end

      it "creates a new MetaSlot" do
        expect {
          post :create_stdslot, { newSlot: valid_attributes }, valid_session
        }.to change(MetaSlot, :count).by(1)
      end

      it "creates a new StdSlot" do
        expect {
          post :create_stdslot, { newSlot: valid_attributes }, valid_session
        }.to change(StdSlot, :count).by(1)
      end

      it "creates a new SlotSetting" do
        expect {
          post :create_stdslot, { newSlot: valid_attributes.merge(
                                  alerts: '1110111010') }, valid_session
        }.to change(SlotSetting, :count).by(1)
      end

      it "assigns a newly created std_slot as @slot" do
        post :create_stdslot, { newSlot: valid_attributes }, valid_session
        expect(assigns(:slot)).to be_a(StdSlot)
        expect(assigns(:slot)).to be_persisted
      end
    end
  end

  describe "POST create_groupslot" do
    describe "with valid params" do
      let(:group) { create(:group) }
      let(:valid_attributes) {
        attr = attributes_for(
          :meta_slot, creator: current_user).merge(groupId: group.id)
        attr.transform_keys { |key| key.to_s.camelize(:lower) }
      }
      it "responds with http status Created (201)" do
        post :create_groupslot, newSlot: valid_attributes
        expect(response).to have_http_status(:created)
      end

      it "renders the create template" do
        post :create_groupslot, newSlot: valid_attributes
        expect(response).to render_template("show")
      end

      it "creates a new MetaSlot" do
        expect {
          post :create_groupslot, { newSlot: valid_attributes }, valid_session
        }.to change(MetaSlot, :count).by(1)
      end

      it "creates a new GroupSlot" do
        expect {
          post :create_groupslot, { newSlot: valid_attributes }, valid_session
        }.to change(GroupSlot, :count).by(1)
      end

      it "creates a new SlotSetting" do
        expect {
          post :create_groupslot, { newSlot: valid_attributes.merge(
                                    alerts: '1110111010') }, valid_session
        }.to change(SlotSetting, :count).by(1)
      end

      it "assigns a newly created group_slot as @slot" do
        post :create_groupslot, { newSlot: valid_attributes }, valid_session
        expect(assigns(:slot)).to be_a(GroupSlot)
        expect(assigns(:slot)).to be_persisted
      end
    end
  end

  describe "POST create_reslot" do
    describe "with valid params" do
      let(:pred) { create(:std_slot) }
      let(:valid_attributes) { attributes_for(:re_slot, predecessorId: pred.id) }

      it "responds with Created (201)" do
        post :create_reslot, reSlot: valid_attributes
        expect(response).to have_http_status(:created)
      end

      it "renders the show template" do
        post :create_reslot, reSlot: valid_attributes
        expect(response).to render_template("show")
      end

      it "creates a new ReSlot" do
        expect {
          post :create_reslot, { reSlot: valid_attributes }, valid_session
        }.to change(ReSlot, :count).by(1)
      end

      it "doesn't create a new SlotSetting" do
        expect {
          post :create_reslot, { reSlot: valid_attributes }, valid_session
        }.not_to change(SlotSetting, :count)
      end

      it "assigns a newly created re_slot as @slot" do
        post :create_reslot, { reSlot: valid_attributes }, valid_session
        expect(assigns(:slot)).to be_a(ReSlot)
        expect(assigns(:slot)).to be_persisted
      end
    end
  end

  describe "PATCH update" do
    let(:valid_slot) { create(:meta_slot, creator: current_user) }

    describe "with valid params" do
      it "respond with No Content (204)" do
        patch :update_metaslot, {
                id: valid_slot.id, metaSlot: { title: "New slot title" } }
        expect(response).to have_http_status(:no_content)
      end

      it "updates the requested slot" do
        patch :update_metaslot, {
                id: valid_slot.id, metaSlot: { title: "New slot title" } }
        valid_slot.reload
        expect(valid_slot.title).to eq("New slot title")
      end

      it "assigns the requested slot as @meta_slot" do
        patch :update_metaslot, {
                id: valid_slot.id, metaSlot: { title: "New slot title" } }
        expect(assigns(:meta_slot)).to be_a(MetaSlot)
        expect(assigns(:meta_slot)).to eq(valid_slot)
      end
    end

    describe "with invalid params" do
      it "assigns the slot as @meta_slot" do
        patch :update_metaslot, {
                id: valid_slot.id, metaSlot: { title: nil } }
        expect(assigns(:meta_slot)).to eq(valid_slot)
      end

      it "responds with Unprocessable Entity (422)" do
        patch :update_metaslot, {
                id: valid_slot.id, metaSlot: { title: nil } }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE destroy_reslot" do
    let(:pred) { create(:std_slot) }
    let!(:reslot) { create(:re_slot, slotter: current_user, predecessor: pred) }

    describe "without custom alert" do
      it "responds with http status OK (200)" do
        delete :destroy_reslot, id: reslot.id
        expect(response).to have_http_status(:ok)
      end

      it "sets deleted_at on the reslot and baseslot" do
        delete :destroy_reslot, id: reslot.id
        reslot.reload
        expect(reslot.deleted_at?).to be true
        base_slot = BaseSlot.find(reslot.id)
        expect(base_slot.deleted_at?).to be true
      end

      it "doesn't destroy the reslot" do
        expect {
          delete :destroy_reslot, id: reslot.id
        }.not_to change(ReSlot, :count)
      end
    end

    describe "with custom alert" do
      let!(:slot_setting) {
        create(:slot_setting, user: current_user, meta_slot: reslot.meta_slot)
      }
      describe "when meta_slot is only referenced by reslot" do
        it "responds with http status OK (200)" do
          delete :destroy_reslot, id: reslot.id
          expect(response).to have_http_status(:ok)
        end

        it "sets deleted_at on the slot_setting" do
          skip "method awaits refactoring"
          delete :destroy_reslot, id: reslot.id
          slot_setting.reload
          expect(slot_setting.deleted_at?).to be true
        end

        it "doesn't destroy the slot_setting" do
          expect {
            delete :destroy_reslot, id: reslot.id
          }.not_to change(SlotSetting, :count)
        end
      end

      describe "when meta_slot is referenced" do
        context "by users group_slot" do
          let(:group) { create(:group) }
          let!(:memberships) {
            create(:membership, group: group, user: current_user)
          }
          let!(:group_slot) {
            create(:group_slot, group: group, meta_slot: reslot.meta_slot)
          }
          it "doesn't set deleted_at on the slot_setting" do
            skip "method awaits refactoring"
            delete :destroy_reslot, id: reslot.id
            slot_setting.reload
            expect(slot_setting.deleted_at?).to be false
          end

          it "sets deleted_at on the slot_setting when group_slot is deleted" do
            skip "method awaits refactoring"
            group_slot.update(deleted_at: Time.zone.now)

            delete :destroy_reslot, id: reslot.id
            slot_setting.reload
            expect(slot_setting.deleted_at?).to be true
          end
        end

        context "by users std_slot" do
          let!(:std_slot) {
            create(:std_slot, meta_slot: reslot.meta_slot, owner: current_user) }

          it "doesn't set deleted_at on the slot_setting" do
            reslot.meta_slot.update(creator: current_user)

            delete :destroy_reslot, id: reslot.id
            slot_setting.reload
            expect(slot_setting.deleted_at?).to be false
          end
        end
      end
    end
  end
end
