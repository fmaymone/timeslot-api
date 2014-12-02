require 'rails_helper'

RSpec.describe "V1::BaseSlots", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /v1/slots" do
    let!(:current_user) { create(:user) }

    let(:metas) { create_list(:meta_slot, 2, creator: current_user) }
    let!(:std_slot_1) {
      create(:std_slot, meta_slot: metas[0], owner: current_user) }
    let!(:std_slot_2) {
      create(:std_slot, meta_slot: metas[1], owner: current_user) }
    let!(:re_slots) { create_list(:re_slot, 3, slotter: current_user) }

    let(:groups) { create_list(:group, 2) }
    let!(:memberships) {
      create(:membership, group: groups[0], user: current_user)
      create(:membership, group: groups[1], user: current_user) }
    let!(:group_slots_1) { create_list(:group_slot, 3, group: groups[0]) }
    let!(:group_slots_2) { create_list(:group_slot, 5, group: groups[1]) }

    it "returns success" do
      get "/v1/slots"
      expect(response.status).to be(200)
    end

    it "returns all slots for the current_user" do
      get "/v1/slots"
      slots_count = 2 + re_slots.size + group_slots_1.size + group_slots_2.size
      expect(json.length).to eq slots_count
    end
  end

  describe "POST /v1/stdlot" do
    let!(:current_user) { create(:user) }

    context "StdSlot with valid params" do
      let(:valid_slot) { attributes_for(:meta_slot).merge(visibility: '10') }

      it "responds with Created (201)" do
        post "/v1/stdslot/", new_slot: valid_slot
        expect(response).to have_http_status(:created)
      end

      it "adds a new StdSlot entry to the DB" do
        expect {
          post "/v1/stdslot/", new_slot: valid_slot
        }.to change(StdSlot, :count).by(1)
      end

      it "adds a new MetaSlot entry to the DB" do
        expect {
          post "/v1/stdslot/", new_slot: valid_slot
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/stdslot/", new_slot: valid_slot
        expect(json['id']).to eq(StdSlot.last.id)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        attributes_for(:meta_slot).merge(visibility: '01')
      }
      describe "does not add a new entry to the DB" do
        it "for empty title" do
          invalid_attributes[:title] = nil
          expect {
            post "/v1/stdslot/", new_slot: invalid_attributes
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include('title')
        end

        it "for empty startdate" do
          invalid_attributes[:startdate] = ""
          expect {
            post "/v1/stdslot/", new_slot: invalid_attributes
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include('startdate')
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      describe "responds with Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/stdslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid startdate" do
          invalid_attributes[:startdate] = "|$%^@wer"
          post "/v1/stdslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty enddate" do
          invalid_attributes[:enddate] = ""
          post "/v1/stdslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "if startdate equals enddate" do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-09-08 13:31:02")
          post "/v1/stdslot/", new_slot: slot.merge(visibility: '11')
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start date')
        end

        it "if startdate after enddate"  do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-07-07 13:31:02")
          post "/v1/stdslot/", new_slot: slot.merge(visibility: '11')
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start date')
        end

        it "for empty visibility" do
          post "/v1/stdslot/", new_slot: attributes_for(:meta_slot, visibility: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          post "/v1/stdslot/", new_slot: attributes_for(:meta_slot, visibility: "$$")
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end

        it "if visibility has to much characters" do
          post "/v1/stdslot/", new_slot: attributes_for(:meta_slot, visibility: "101")
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end
      end
    end
  end

  describe "POST /v1/groupslot" do
    let!(:current_user) { create(:user) }
    let(:group) { create(:group) }

    context "GroupSlot with valid params" do
      let(:valid_slot) { attributes_for(:meta_slot).merge(groupId: group.id) }

      it "responds with Created (201)" do
        post "/v1/groupslot/", new_slot: valid_slot
        expect(response).to have_http_status(:created)
      end

      it "adds a new group_slot entry to the DB" do
        expect {
          post "/v1/groupslot/", new_slot: valid_slot
        }.to change(GroupSlot, :count).by(1)
      end

      it "adds a new meta_slot entry to the DB" do
        expect {
          post "/v1/groupslot/", new_slot: valid_slot
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/groupslot/", new_slot: valid_slot
        expect(json['id']).to eq(GroupSlot.last.id)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        attributes_for(:meta_slot).merge(groupId: group.id)
      }
      describe "does not add a new entry to the DB" do
        it "with missing group ID" do
          expect {
            post "/v1/groupslot/", new_slot: attributes_for(:meta_slot)
          }.not_to change(MetaSlot, :count) || change(GroupSlot, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "with invalid group ID" do
          expect {
            post "/v1/groupslot/", new_slot: attributes_for(:meta_slot).merge(
                   groupId: 1)
          }.not_to change(MetaSlot, :count) || change(GroupSlot, :count)
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "responds with Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/groupslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid startdate" do
          invalid_attributes[:startdate] = "|$%^@wer"
          post "/v1/groupslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty enddate" do
          invalid_attributes[:enddate] = ""
          post "/v1/groupslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "if startdate equals enddate" do
          group_slot = attributes_for(:meta_slot,
                                      startdate: "2014-09-08 13:31:02",
                                      enddate: "2014-09-08 13:31:02",
                                      groupId: group.id)
          post "/v1/groupslot/", new_slot: group_slot
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start date')
        end

        it "if startdate after enddate"  do
          group_slot = attributes_for(:meta_slot,
                                      startdate: "2014-09-08 13:31:02",
                                      enddate: "2014-07-07 13:31:02",
                                      groupId: group.id)
          post "/v1/groupslot/", new_slot: group_slot
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start date')
        end
      end
    end
  end

  describe "POST /v1/reslot" do
    let!(:current_user) { create(:user) }
    let(:group) { create(:group) }

    context "with valid params" do
      context "ReSlot from StdSlot" do
        let(:pred) { create(:std_slot) }
        let(:valid_attributes) {
          attributes_for(:re_slot,
                         predecessorId: pred.id,
                         predecessorType: pred.class.model_name.param_key)
        }
        it "responds with Created (201)" do
          post "/v1/reslot/", re_slot: valid_attributes
          expect(response).to have_http_status(:created)
        end

        it "adds a new entry to the DB" do
          expect {
            post "/v1/reslot/", re_slot: valid_attributes
          }.to change(ReSlot, :count).by(1)
        end

        it "returns the ID of the new reslot" do
          post "/v1/reslot/", re_slot: valid_attributes
          expect(json['id']).to eq(ReSlot.last.id)
        end
      end

      context "ReSlot from ReSlot" do
        let(:origin) { create(:std_slot) }
        let!(:pred) {
          create(:re_slot, predecessor_id: origin.id)
        }
        let(:valid_attributes) {
          attributes_for(:re_slot, predecessorId: pred.id)
        }
        it "responds with Created (201)" do
          post "/v1/reslot/", re_slot: valid_attributes
          expect(response).to have_http_status(:created)
        end

        it "adds a new entry to the DB" do
          expect {
            post "/v1/reslot/", re_slot: valid_attributes
          }.to change(ReSlot, :count).by(1)
        end

        it "returns the ID of the new reslot" do
          post "/v1/reslot/", re_slot: valid_attributes
          expect(json['id']).to eq(ReSlot.last.id)
        end
      end

      context "ReSlot from GroupSlot" do
        let(:pred) { create(:group_slot) }
        let(:valid_attributes) {
          attributes_for(:re_slot, predecessorId: pred.id)
        }
        it "responds with Created (201)" do
          post "/v1/reslot/", re_slot: valid_attributes
          expect(response).to have_http_status(:created)
        end

        it "adds a new entry to the DB" do
          expect {
            post "/v1/reslot/", re_slot: valid_attributes
          }.to change(ReSlot, :count).by(1)
        end

        it "returns the ID of the new slot" do
          post "/v1/reslot/", re_slot: valid_attributes
          expect(json['id']).to eq(ReSlot.last.id)
        end
      end
    end
  end

  describe "PATCH /v1/metaslot/:id" do
    let!(:current_user) { create(:user) }
    let(:metaslot) { create(:meta_slot, creator: current_user) }

    context "with valid params" do
      it "responds with No Content (204)" do
        patch "/v1/metaslot/#{metaslot.id}", metaSlot: { title: "Something" }
        expect(response).to have_http_status(:no_content)
      end

      it "updates the title of a given metaslot" do
        metaslot.update(title: "Old title")
        patch "/v1/metaslot/#{metaslot.id}", metaSlot: { title: "New title" }
        metaslot.reload
        expect(metaslot.title).to eq("New title")
      end

      it "updates the startdate of a given metaslot" do
        metaslot.update(startdate: "2014-09-08 13:31:02")
        patch "/v1/metaslot/#{metaslot.id}", metaSlot: { startdate: "2014-07-07 13:31:02" }
        metaslot.reload
        expect(metaslot.startdate).to eq("2014-07-07 13:31:02")
      end

      it "updates the enddate of a given metaslot" do
        metaslot.update(enddate: "2014-09-09 13:31:02")
        patch "/v1/metaslot/#{metaslot.id}", metaSlot: { enddate: "2014-11-11 13:31:02" }
        metaslot.reload
        expect(metaslot.enddate).to eq("2014-11-11 13:31:02")
      end
    end

    context "with invalid params" do
      describe "User not creator of MetaSlot" do
        let(:creator) { create(:user) }
        let(:metaslot) { create(:meta_slot, creator: creator) }

        it "responds with Not Found (404)" do
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { title: "Something" }
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "for invalid ID" do
        it "responds with Not Found (404)" do
          wrong_id = metaslot.id + 1
          patch "/v1/metaslot/#{wrong_id}", metaSlot: { title: "Something" }
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "responds with Unprocessable Entity (422)" do
        it "for empty title" do
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { title: "" }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty startdate" do
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { startdate: "" }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid startdate" do
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { startdate: "|$%^@wer" }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty enddate" do
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { enddate: "" }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid enddate" do
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { enddate: "|$%^@wer" }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "if startdate equals enddate" do
          metaslot.update(startdate: "2014-09-08 13:31:02")
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { enddate: "2014-09-08 13:31:02" }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start date')
        end

        it "if enddate before startdate" do
          metaslot.update(startdate: "2014-09-08 13:31:02")
          patch "/v1/metaslot/#{metaslot.id}", metaSlot: { enddate: "2014-07-07 13:31:02" }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start date')
        end
      end
    end
  end

  describe "DELETE /v1/stdslot/:id" do
    let!(:current_user) { create(:user) }
    let!(:std_slot) { create(:std_slot, owner: current_user) }

    context "with a valid ID" do
      it "returns success" do
        delete "/v1/stdslot/#{std_slot.id}"
        expect(response).to have_http_status(:ok)
      end

      it "doesn't destroy the std_slot" do
        expect {
          delete "/v1/stdslot/#{std_slot.id}"
        }.not_to change(StdSlot, :count)
      end
    end

    context "with an invalid ID" do
      let(:wrong_id) { std_slot.id + 1 }

      it "responds with Not Found" do
        delete "/v1/stdslot/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        expect {
          delete "/v1/stdslot/#{wrong_id}"
        }.not_to change(StdSlot, :count)
      end
    end
  end

  describe "DELETE /v1/groupslot/:id" do
    let!(:current_user) { create(:user) }
    let(:group) { create(:group) }
    let!(:membership) { create(:membership, group: group, user: current_user) }
    let!(:group_slot) { create(:group_slot, group: group) }

    context "with a valid ID" do
      it "returns success" do
        delete "/v1/groupslot/#{group_slot.id}"
        expect(response).to have_http_status(:ok)
      end

      it "doesn't destroy the group_slot" do
        expect {
          delete "/v1/groupslot/#{group_slot.id}"
        }.not_to change(GroupSlot, :count)
      end
    end

    context "with an invalid ID" do
      let(:wrong_id) { group_slot.id + 1 }

      it "responds with Not Found" do
        delete "/v1/groupslot/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        expect {
          delete "/v1/groupslot/#{wrong_id}"
        }.not_to change(GroupSlot, :count)
      end
    end
  end

  describe "DELETE /v1/reslot/:id" do
    let!(:current_user) { create(:user) }
    let!(:re_slot) { create(:re_slot, slotter: current_user) }

    context "with a valid ID" do
      it "returns success" do
        delete "/v1/reslot/#{re_slot.id}"
        expect(response).to have_http_status(:ok)
      end

      it "doesn't destroy the re_slot" do
        expect {
          delete "/v1/reslot/#{re_slot.id}"
        }.not_to change(ReSlot, :count)
      end
    end

    context "with an invalid ID" do
      let(:wrong_id) { re_slot.id + 1 }

      it "responds with Not Found" do
        delete "/v1/reslot/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        expect {
          delete "/v1/reslot/#{wrong_id}"
        }.not_to change(ReSlot, :count)
      end
    end
  end
end
