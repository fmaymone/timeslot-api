require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/slots" do
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
      get "/v1/slots", {}, auth_header
      expect(response.status).to be(200)
    end

    it "returns all slots for the current_user" do
      get "/v1/slots", {}, auth_header
      slots_count = 2 + re_slots.size + group_slots_1.size + group_slots_2.size
      expect(json.length).to eq slots_count
    end
  end

  describe "GET /v1/slots/:id" do
    let(:std_slot) { create(:std_slot) }
    let(:group_slot) { create(:group_slot) }

    context "GroupSlot, with valid ID" do
      it "returns success" do
        get "/v1/slots/#{group_slot.id}", {}, auth_header
        expect(response).to have_http_status(200)
        expect(json).to have_key('groupId')
        expect(json['id']).to eq(group_slot.id)
        expect(json['groupId']).to eq(group_slot.group_id)
      end
    end

    context "StdSlot, with location" do
      let(:meta_slot) { create(:meta_slot, location_id: 200719253) }
      let(:std_slot) { create(:std_slot, meta_slot: meta_slot) }

      it "returns the location" do
        get "/v1/slots/#{std_slot.id}"
        expect(json).to have_key('location')
        expect(json['location']['id']).to eq 200719253
      end
    end

    context "StdSlot, with valid ID" do
      it "returns success" do
        get "/v1/slots/#{std_slot.id}"
        expect(response).to have_http_status(200)
      end

      it "returns details of slot with given id" do
        get "/v1/slots/#{std_slot.id}"
        expect(json).to have_key('id')
        expect(json).to have_key('title')
        expect(json).to have_key('startDate')
        expect(json).to have_key('endDate')
        expect(json).to have_key('notes')
        expect(json).to have_key('visibility')
        expect(json).to have_key('createdAt')
        expect(json).to have_key('updatedAt')
      end

      it "does return the correct attributes" do
        get "/v1/slots/#{std_slot.id}"
        expect(json['id']).to eq(std_slot.id)
        expect(json['title']).to eq(std_slot.title)
        expect(json['startDate']).to eq(std_slot.start_date.as_json)
        expect(json['endDate']).to eq(std_slot.end_date.as_json)
        expect(json['notes']).to eq(std_slot.notes)
        expect(json['visibility']).to eq(std_slot.visibility)
      end

      it "does return the slot title" do
        std_slot.meta_slot.update(title: "Expected title")
        get "/v1/slots/#{std_slot.id}"
        expect(json['title']).to eq("Expected title")
      end
    end

    context "with invalid ID" do
      it "returns not found" do
        wrong_id = std_slot.id + 1
        get "/v1/slots/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /v1/stdlot" do
    context "StdSlot with valid params" do
      let(:valid_slot) {
        attr = attributes_for(:meta_slot).merge(
          visibility: '10', settings: { alerts: '1110001100' })
        attr.transform_keys { |key| key.to_s.camelize(:lower) }
      }

      it "responds with Created (201)" do
        post "/v1/stdslot/", valid_slot, auth_header
        expect(response).to have_http_status(:created)
      end

      it "adds a new StdSlot entry to the DB" do
        expect {
          post "/v1/stdslot/", valid_slot, auth_header
        }.to change(StdSlot, :count).by(1)
      end

      it "adds a new MetaSlot entry to the DB" do
        expect {
          post "/v1/stdslot/", valid_slot, auth_header
        }.to change(MetaSlot, :count).by(1)
      end

      it "adds a new SlotSetting entry to the DB" do
        expect {
          post "/v1/stdslot/", valid_slot, auth_header
        }.to change(SlotSetting, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/stdslot/", valid_slot, auth_header
        expect(json['id']).to eq(StdSlot.last.id)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        attr = attributes_for(:meta_slot).merge(visibility: '01')
        attr.transform_keys { |key| key.to_s.camelize(:lower) }
      }
      describe "does not add a new entry to the DB" do
        it "for empty title" do
          invalid_attributes[:title] = nil
          expect {
            post "/v1/stdslot/", invalid_attributes, auth_header
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include('title')
        end

        it "for empty start_date" do
          invalid_attributes[:startDate] = ""
          expect {
            post "/v1/stdslot/", invalid_attributes, auth_header
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include('start_date')
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      describe "responds with Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid start_date" do
          invalid_attributes[:startDate] = "|$%^@wer"
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty end_date" do
          invalid_attributes[:endDate] = ""
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "if start_date equals end_date" do
          slot = attributes_for(:meta_slot,
                                start_date: "2014-09-08 13:31:02",
                                end_date: "2014-09-08 13:31:02")
          slot = slot.transform_keys { |key| key.to_s.camelize(:lower) }

          post "/v1/stdslot/", slot.merge(visibility: '11'), auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "if start_date after end_date"  do
          slot = attributes_for(:meta_slot,
                                start_date: "2014-09-08 13:31:02",
                                end_date: "2014-07-07 13:31:02")
          slot = slot.transform_keys { |key| key.to_s.camelize(:lower) }

          post "/v1/stdslot/", slot.merge(visibility: '11'), auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "for empty visibility" do
          invalid_attributes[:visibility] = ""
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          invalid_attributes[:visibility] = "$$"
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end

        it "if visibility has to much characters" do
          invalid_attributes[:visibility] = "101"
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end
      end
    end
  end

  describe "POST /v1/groupslot" do
    let(:group) { create(:group, :members_can_post) }

    context "GroupSlot with valid params" do
      let(:valid_slot) {
        attr = attributes_for(:meta_slot).merge(groupId: group.id)
        attr.transform_keys { |key| key.to_s.camelize(:lower) }
      }
      it "responds with Created (201)" do
        post "/v1/groupslot/", valid_slot, auth_header
        expect(response).to have_http_status(:created)
      end

      it "adds a new group_slot entry to the DB" do
        expect {
          post "/v1/groupslot/", valid_slot, auth_header
        }.to change(GroupSlot, :count).by(1)
      end

      it "adds a new meta_slot entry to the DB" do
        expect {
          post "/v1/groupslot/", valid_slot, auth_header
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/groupslot/", valid_slot, auth_header
        expect(json['id']).to eq(GroupSlot.last.id)
      end
    end

    describe "create GroupSlot via copy from existing slot" do
      context "copy GroupSlot from existing std_slot" do
        let!(:existing_slot) { create(:std_slot) }
        let(:group_slot_params) {
          params = existing_slot.as_json
                   .transform_keys { |key| key.to_s.camelize(:lower) }
          params.merge(groupId: group.id)
        }
        it "responds with Created (201)" do
          post "/v1/groupslot/", group_slot_params, auth_header
          expect(response).to have_http_status(:created)
        end

        it "adds a new group_slot entry to the DB" do
          expect {
            post "/v1/groupslot/", group_slot_params, auth_header
          }.to change(GroupSlot, :count).by(1)
        end
      end

      context "copy GroupSlot from existing group_slot" do
        let!(:existing_slot) { create(:group_slot) }
        let(:group_slot_params) {
          params = existing_slot.as_json
                   .transform_keys { |key| key.to_s.camelize(:lower) }
          params.merge(groupId: group.id)
        }
        it "responds with Created (201)" do
          post "/v1/groupslot/", group_slot_params, auth_header
          expect(response).to have_http_status(:created)
        end

        it "adds a new group_slot entry to the DB" do
          expect {
            post "/v1/groupslot/", group_slot_params, auth_header
          }.to change(GroupSlot, :count).by(1)
        end

        it "sets the correct group on the new group_slot" do
          post "/v1/groupslot/", group_slot_params, auth_header
          expect(GroupSlot.last.group_id).to eq group.id
        end
      end

      context "copy GroupSlot from existing re_slot" do
        let!(:existing_slot) { create(:re_slot) }
        let(:group_slot_params) {
          params = existing_slot.as_json
                   .transform_keys { |key| key.to_s.camelize(:lower) }
          params.merge(groupId: group.id)
        }
        it "responds with Created (201)" do
          post "/v1/groupslot/", group_slot_params, auth_header
          expect(response).to have_http_status(:created)
        end

        it "adds a new group_slot entry to the DB" do
          expect {
            post "/v1/groupslot/", group_slot_params, auth_header
          }.to change(GroupSlot, :count).by(1)
        end
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        attributes_for(:meta_slot).merge(groupId: group.id)
      }
      describe "does not add a new entry to the DB" do
        it "with missing group ID" do
          expect {
            post "/v1/groupslot/", attributes_for(:meta_slot), auth_header
          }.not_to change(MetaSlot, :count) || change(GroupSlot, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "with invalid group ID" do
          expect {
            post "/v1/groupslot/", attributes_for(:meta_slot).merge(
                   groupId: 1), auth_header
          }.not_to change(MetaSlot, :count) || change(GroupSlot, :count)
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "responds with Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/groupslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid start_date" do
          invalid_attributes[:start_date] = "|$%^@wer"
          post "/v1/groupslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty end_date" do
          invalid_attributes[:endDate] = ""
          post "/v1/groupslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "if start_date equals end_date" do
          group_slot = attributes_for(:meta_slot,
                                      start_date: "2014-09-08 13:31:02",
                                      end_date: "2014-09-08 13:31:02",
                                      group_id: group.id)
          group_slot.transform_keys! { |key| key.to_s.camelize(:lower) }
          post "/v1/groupslot/", group_slot, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "if start_date after end_date" do
          group_slot = attributes_for(:meta_slot,
                                      start_date: "2014-09-08 13:31:02",
                                      end_date: "2014-07-07 13:31:02",
                                      group_id: group.id)
          group_slot.transform_keys! { |key| key.to_s.camelize(:lower) }

          post "/v1/groupslot/", group_slot, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end
      end
    end
  end

  describe "POST /v1/reslot" do
    let(:group) { create(:group) }

    context "with valid params" do
      context "ReSlot from StdSlot" do
        let(:pred) { create(:std_slot) }
        let(:valid_attributes) {
          attributes_for(:re_slot, predecessorId: pred.id) }

        it "responds with Created (201)" do
          post "/v1/reslot/", valid_attributes, auth_header
          expect(response).to have_http_status(:created)
        end

        it "adds a new entry to the DB" do
          expect {
            post "/v1/reslot/", valid_attributes, auth_header
          }.to change(ReSlot, :count).by(1)
        end

        it "returns the ID of the new reslot" do
          post "/v1/reslot/", valid_attributes, auth_header
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
          post "/v1/reslot/", valid_attributes, auth_header
          expect(response).to have_http_status(:created)
        end

        it "adds a new entry to the DB" do
          expect {
            post "/v1/reslot/", valid_attributes, auth_header
          }.to change(ReSlot, :count).by(1)
        end

        it "returns the ID of the new reslot" do
          post "/v1/reslot/", valid_attributes, auth_header
          expect(json['id']).to eq(ReSlot.last.id)
        end
      end

      context "ReSlot from GroupSlot" do
        let(:pred) { create(:group_slot) }
        let(:valid_attributes) {
          attributes_for(:re_slot, predecessorId: pred.id)
        }
        it "responds with Created (201)" do
          post "/v1/reslot/", valid_attributes, auth_header
          expect(response).to have_http_status(:created)
        end

        it "adds a new entry to the DB" do
          expect {
            post "/v1/reslot/", valid_attributes, auth_header
          }.to change(ReSlot, :count).by(1)
        end

        it "returns the ID of the new slot" do
          post "/v1/reslot/", valid_attributes, auth_header
          expect(json['id']).to eq(ReSlot.last.id)
        end
      end
    end
  end

  describe "PATCH /v1/metaslot/:id" do
    let(:metaslot) { create(:meta_slot, creator: current_user) }

    context "with valid params" do
      it "responds with No Content (204)" do
        patch "/v1/metaslot/#{metaslot.id}",
              { title: "Something" }, auth_header
        expect(response).to have_http_status(:no_content)
      end

      it "updates the title of a given metaslot" do
        metaslot.update(title: "Old title")
        patch "/v1/metaslot/#{metaslot.id}",
              { title: "New title" }, auth_header
        metaslot.reload
        expect(metaslot.title).to eq("New title")
      end

      it "updates the start_date of a given metaslot" do
        metaslot.update(start_date: "2014-09-08 13:31:02")
        patch "/v1/metaslot/#{metaslot.id}",
              { startDate: "2014-07-07 13:31:02" }, auth_header
        metaslot.reload
        expect(metaslot.start_date).to eq("2014-07-07 13:31:02")
      end

      it "updates the end_date of a given metaslot" do
        metaslot.update(end_date: "2014-09-09 13:31:02")
        patch "/v1/metaslot/#{metaslot.id}",
              { endDate: "2014-11-11 13:31:02" }, auth_header
        metaslot.reload
        expect(metaslot.end_date).to eq("2014-11-11 13:31:02")
      end
    end

    context "with invalid params" do
      describe "User not creator of MetaSlot" do
        let(:creator) { create(:user) }
        let(:metaslot) { create(:meta_slot, creator: creator) }

        it "responds with Not Found (404)" do
          patch "/v1/metaslot/#{metaslot.id}",
                { title: "Something" }, auth_header
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "for invalid ID" do
        it "responds with Not Found (404)" do
          wrong_id = metaslot.id + 1
          patch "/v1/metaslot/#{wrong_id}",
                { title: "Something" }, auth_header
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "responds with Unprocessable Entity (422)" do
        it "for empty title" do
          patch "/v1/metaslot/#{metaslot.id}",
                { title: "" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty start_date" do
          patch "/v1/metaslot/#{metaslot.id}",
                { startDate: "" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid start_date" do
          patch "/v1/metaslot/#{metaslot.id}",
                { startDate: "|$%^@wer" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for empty end_date" do
          patch "/v1/metaslot/#{metaslot.id}",
                { endDate: "" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid end_date" do
          patch "/v1/metaslot/#{metaslot.id}",
                { endDate: "|$%^@wer" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "if start_date equals end_date" do
          metaslot.update(start_date: "2014-09-08 13:31:02")
          patch "/v1/metaslot/#{metaslot.id}",
                { endDate: "2014-09-08 13:31:02" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "if end_date before start_date" do
          metaslot.update(start_date: "2014-09-08 13:31:02")
          patch "/v1/metaslot/#{metaslot.id}",
                { endDate: "2014-07-07 13:31:02" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end
      end
    end
  end

  describe "PATCH /v1/stdslot/:id" do
    let!(:std_slot) { create(:std_slot, owner: current_user) }

    describe "handling non-media params" do
      context "valid params" do
        it "responds with No Content (204)" do
          patch "/v1/stdslot/#{std_slot.id}",
                { title: "Something" }, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "updates the visibiltiy of a given StdSlot" do
          std_slot.update(visibility: "00")
          patch "/v1/stdslot/#{std_slot.id}",
                { visibility: "11" }, auth_header
          std_slot.reload
          expect(std_slot.visibility).to eq("11")
        end

        it "updates the title of a given StdSlot" do
          std_slot.meta_slot.title = "Old title"
          patch "/v1/stdslot/#{std_slot.id}",
                { title: "New title" }, auth_header
          std_slot.reload
          expect(std_slot.title).to eq("New title")
        end

        it "updates the start_date of a given StdSlot" do
          std_slot.meta_slot.update(start_date: "2014-09-08 13:31:02")
          patch "/v1/stdslot/#{std_slot.id}",
                { startDate: "2014-07-07 13:31:02" }, auth_header
          std_slot.reload
          expect(std_slot.start_date).to eq("2014-07-07 13:31:02")
        end

        it "updates the end_date of a given StdSlot" do
          std_slot.meta_slot.update(end_date: "2014-09-09 13:31:02")
          patch "/v1/stdslot/#{std_slot.id}",
                { endDate: "2014-11-11 13:31:02" }, auth_header
          std_slot.reload
          expect(std_slot.end_date).to eq("2014-11-11 13:31:02")
        end
      end

      context "invalid params" do
        describe "User not owner of StdSlot" do
          let(:std_slot) { create(:std_slot) }

          it "responds with Not Found (404)" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { title: "Something" }, auth_header
            expect(response).to have_http_status(:not_found)
          end
        end

        describe "for invalid ID" do
          it "responds with Not Found (404)" do
            wrong_id = std_slot.id + 1
            patch "/v1/stdslot/#{wrong_id}",
                  { title: "Something" }, auth_header
            expect(response).to have_http_status(:not_found)
          end
        end

        describe "responds with Unprocessable Entity (422)" do
          it "for empty title" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { title: "" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('blank')
          end

          it "for empty start_date" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { startDate: "" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('blank')
          end

          it "for invalid start_date" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { startDate: "|$%^@wer" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('blank')
          end

          it "for empty end_date" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { endDate: "" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('blank')
          end

          it "for invalid end_date" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { endDate: "|$%^@wer" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('blank')
          end

          it "if start_date equals end_date" do
            std_slot.meta_slot.update(start_date: "2014-09-08 13:31:02")
            patch "/v1/stdslot/#{std_slot.id}",
                  { endDate: "2014-09-08 13:31:02" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('start_date')
          end

          it "if end_date before start_date" do
            std_slot.meta_slot.update(start_date: "2014-09-08 13:31:02")
            patch "/v1/stdslot/#{std_slot.id}",
                  { endDate: "2014-07-07 13:31:02" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('start_date')
          end
        end
      end
    end

    describe "handling notes" do
      let(:note) { attributes_for(:note) }
      let(:add_note) { { notes: [note] } }

      it "returns success" do
        patch "/v1/stdslot/#{std_slot.id}", add_note, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "adds a new note to the slot" do
        patch "/v1/stdslot/#{std_slot.id}", add_note, auth_header
        std_slot.reload
        expect(std_slot.notes.size).to eq(1)
      end

      it "adds the submitted note to the db" do
        patch "/v1/stdslot/#{std_slot.id}", add_note, auth_header
        std_slot.reload
        expect(std_slot.notes[0].title).to eq(note[:title])
        expect(std_slot.notes[0].content).to eq(note[:content])
      end

      it "adds an additional new note" do
        create(:note, slot: std_slot)

        patch "/v1/stdslot/#{std_slot.id}", add_note, auth_header
        std_slot.reload
        expect(std_slot.notes.size).to eq(2)
      end

      context "patch with valid params" do
        let(:std_slot) { create(:std_slot, :with_note, owner: current_user) }
        let(:changed_note) {
          { notes: [{ id: std_slot.notes.first.id, title: "something new" }] }
        }
        it "updates an existing note" do
          patch "/v1/stdslot/#{std_slot.id}", changed_note, auth_header
          std_slot.reload
          expect(std_slot.notes.size).to eq 1
          expect(std_slot.notes.first.title).to eq "something new"
        end
      end

      context "patch non-existing note" do
        let(:std_slot) { create(:std_slot, :with_note, owner: current_user) }
        let(:changed_note) {
          { notes: [{ id: std_slot.notes.first.id + 1, title: "foo new" }] }
        }
        it "returns 404" do
          expect {
            patch "/v1/stdslot/#{std_slot.id}", changed_note, auth_header
          }.not_to change(std_slot.notes.first, :title)
          expect(response.status).to eq 404
        end
      end

      context "patch with invalid params" do
        let(:std_slot) { create(:std_slot, :with_note, owner: current_user) }
        let(:changed_note) {
          { notes: [{ id: std_slot.notes.first.id, title: "" }] }
        }
        it "doesn't update note" do
          expect {
            patch "/v1/stdslot/#{std_slot.id}", changed_note
          }.not_to change(std_slot.notes.first, :title)
        end

        it "returns 422 & error details" do
          patch "/v1/stdslot/#{std_slot.id}", changed_note, auth_header
          expect(response.status).to eq 422
          expect(json).to have_key "note"
          expect(*json["note"]).to have_key "title"
          expect(*json["note"][0]["title"]).to eq "can't be blank"
        end
      end
    end

    describe "handling media items" do
      let(:add_media_item) { { photos: media } }

      context "add images with valid params" do
        let(:media) do
          [{ publicId: "foo-image",
             position: "1" }]
        end

        it "returns success" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "returns a mediaId" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(*json['photos']).to have_key('mediaId')
        end

        it "returns the ID of new media_item" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(json['photos'][0]['mediaId']).to eq std_slot.media_items[0].id
        end

        it "adds a new image" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(std_slot.media_items.size).to eq(1)
        end

        it "adds the submitted image to the db" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(std_slot.media_items[0].media_type).to eq 'image'
          expect(std_slot.photos[0].public_id).to eq(media.first[:publicId])
          expect(std_slot.media_items[0].position)
            .to eq(media.first[:position].to_i)
        end

        it "adds an additional new image" do
          create(:slot_image, mediable: std_slot, position: 0)

          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(std_slot.media_items.size).to eq(2)
        end

        it "adds a 2nd submitted image to the db" do
          create(:slot_image, mediable: std_slot, position: 0)

          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          new_media_item = MediaItem.last
          expect(new_media_item.media_type).to eq 'image'
          expect(new_media_item.public_id).to eq(media.first[:publicId])
          expect(new_media_item.position).to eq(media.first[:position].to_i)
        end

        context "missing position parameter" do
          let(:media) { [{ publicId: "foo-image" }] }
          let!(:std_slot) {
            create(:std_slot, :with_media, owner: current_user)
          }

          it "adds it" do
            new_position = std_slot.media_items.size
            patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header

            expect(response).to have_http_status(:ok)
            new_media_item = MediaItem.last
            expect(new_media_item.position).to eq(new_position)
          end
        end

        context "existing position parameter" do
          let(:media) { [{ publicId: "foo-image", position: "0" }] }

          it "updates existing position" do
            existing_1 = create(:slot_image, mediable: std_slot, position: 0)
            existing_2 = create(:slot_image, mediable: std_slot, position: 1)

            patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header

            expect(response).to have_http_status(:ok)
            std_slot.reload
            existing_1.reload
            existing_2.reload

            expect(existing_1.position).to eq 1
            expect(existing_2.position).to eq 2
            expect(std_slot.media_items.last.position)
              .to eq media.first[:position].to_i
          end
        end
      end

      context "add images with invalid params" do
        let(:media) { [{ position: "0" }] }

        it "returns 422 if publicId is missing" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "returns the error" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          expect(response.body).to include 'public_id'
          expect(response.body).to include 'blank'
        end
      end

      describe "reorder images" do
        let!(:media_item_1) {
          create(:slot_image, mediable: std_slot, position: 0) }
        let!(:media_item_2) {
          create(:slot_image, mediable: std_slot, position: 1) }
        let!(:media_item_3) {
          create(:slot_image, mediable: std_slot, position: 2) }

        context "with valid params" do
          let(:media_reordering) do
            { photos: [
                { mediaId: media_item_1.id,
                  position: 2 },
                { mediaId: media_item_2.id,
                  position: 0 },
                { mediaId: media_item_3.id,
                  position: 1 }
              ] }
          end

          it "returns success" do
            patch "/v1/stdslot/#{std_slot.id}", media_reordering, auth_header
            expect(response).to have_http_status(:ok)
          end

          it "reorders media items" do
            patch "/v1/stdslot/#{std_slot.id}", media_reordering, auth_header
            std_slot.reload
            expect(std_slot.media_items.find(media_item_1.id).position).to eq(2)
            expect(std_slot.media_items.find(media_item_2.id).position).to eq(0)
            expect(std_slot.media_items.find(media_item_3.id).position).to eq(1)
          end
        end

        context "with invalid params" do
          describe "invalid mediaId" do
            let(:invalid_id) { media_item_3.id + 1 }
            let(:media_reordering) do
              { photos: [
                  { mediaId: media_item_1.id,
                    position: 2 },
                  { mediaId: media_item_2.id,
                    position: 0 },
                  { mediaId: invalid_id,
                    position: 1 }
                ] }
            end

            it "returns 404" do
              patch "/v1/stdslot/#{std_slot.id}", media_reordering, auth_header
              std_slot.reload
              expect(response).to have_http_status(:not_found)
            end
          end

          describe "invalid sorting" do
            let(:media_reordering) do
              { photos: [
                  { mediaId: media_item_1.id,
                    position: 1 },
                  { mediaId: media_item_2.id,
                    position: 0 },
                  { mediaId: media_item_3.id,
                    position: 1 }
                ] }
            end

            it "returns 422" do
              patch "/v1/stdslot/#{std_slot.id}", media_reordering, auth_header
              std_slot.reload
              expect(response).to have_http_status(:unprocessable_entity)
              expect(response.body).to include "invalid ordering"
            end
          end
        end
      end

      context "video" do
        let(:media) do
          [{ publicId: "foo-video" }]
        end

        it "adds a new video" do
          patch "/v1/stdslot/#{std_slot.id}",
                { videos: media }, auth_header
          std_slot.reload
          expect(std_slot.videos[0].media_type).to eq 'video'
          expect(std_slot.videos[0].position).to eq 0
          expect(std_slot.videos[0].public_id).to eq(media.first[:publicId])
        end
      end

      context "voice" do
        let(:media) do
          [{ publicId: "foo-voice",
             position: "1" }]
        end

        it "adds a new voice item" do
          patch "/v1/stdslot/#{std_slot.id}",
                { voices: media }, auth_header
          std_slot.reload
          expect(std_slot.voices[0].media_type).to eq 'voice'
          expect(std_slot.voices[0].public_id).to eq(media.first[:publicId])
        end
      end
    end

    describe "handling mixed params" do
      let(:note) { attributes_for(:note) }

      context "valid params" do
        let(:new_params) { { title: '2015',
                             visibility: '10',
                             notes: [note] } }

        it "returns success" do
          patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "updates slot with all new params" do
          patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          std_slot.reload
          expect(std_slot.title).to eq '2015'
          expect(std_slot.visibility).to eq '10'
          expect(std_slot.notes.size).to eq(1)
        end
      end

      context "invalid params" do
        let(:new_params) { { title: '',
                             visibility: '10',
                             notes: [note] } }

        it "returns unprocessable entity" do
          patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /v1/groupslot/:id" do
    let(:group) { create(:group, owner: current_user) }
    let!(:group_slot) { create(:group_slot, group: group) }

    context "with valid non-media params" do
      it "responds with 200" do
        patch "/v1/groupslot/#{group_slot.id}",
              { title: "Something" }, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "updates the title of a given GroupSlot" do
        group_slot.meta_slot.title = "Old title"
        patch "/v1/groupslot/#{group_slot.id}",
              { title: "New title" }, auth_header
        group_slot.reload
        expect(group_slot.title).to eq("New title")
      end
    end
  end

  describe "PATCH /v1/reslot/:id" do
    let!(:re_slot) { create(:re_slot, slotter: current_user) }

    context "with valid non-media params" do
      it "responds with 200" do
        patch "/v1/reslot/#{re_slot.id}",
              { title: "Something" }, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "updates the title of a given ReSlot" do
        re_slot.meta_slot.title = "Old title"
        patch "/v1/reslot/#{re_slot.id}",
              { title: "New title" }, auth_header
        re_slot.reload
        expect(re_slot.title).to eq("New title")
      end
    end
  end

  describe "DELETE /v1/stdslot/:id" do
    let!(:std_slot) { create(:std_slot, owner: current_user) }

    context "with a valid ID" do
      it "returns success" do
        delete "/v1/stdslot/#{std_slot.id}", {}, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "doesn't destroy the std_slot" do
        expect {
          delete "/v1/stdslot/#{std_slot.id}", {}, auth_header
        }.not_to change(StdSlot, :count)
      end
    end

    context "with an invalid ID" do
      let(:wrong_id) { std_slot.id + 1 }

      it "responds with Not Found" do
        delete "/v1/stdslot/#{wrong_id}", {}, auth_header
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        expect {
          delete "/v1/stdslot/#{wrong_id}", {}, auth_header
        }.not_to change(StdSlot, :count)
      end
    end
  end

  describe "DELETE /v1/groupslot/:id" do
    let(:group) { create(:group, owner: current_user) }
    let!(:group_slot) { create(:group_slot, group: group) }

    context "with a valid ID" do
      it "returns success" do
        delete "/v1/groupslot/#{group_slot.id}", {}, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "doesn't destroy the group_slot" do
        expect {
          delete "/v1/groupslot/#{group_slot.id}", {}, auth_header
        }.not_to change(GroupSlot, :count)
      end

      it "changes the number of active group_slots for the user" do
        expect {
          delete "/v1/groupslot/#{group_slot.id}", {}, auth_header
        }.to change(current_user.group_slots.active, :count)
      end
    end

    context "with an invalid ID" do
      let(:wrong_id) { group_slot.id + 1 }

      it "responds with Not Found" do
        delete "/v1/groupslot/#{wrong_id}", {}, auth_header
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        expect {
          delete "/v1/groupslot/#{wrong_id}", {}, auth_header
        }.not_to change(GroupSlot, :count)
      end
    end
  end

  describe "DELETE /v1/reslot/:id" do
    let!(:re_slot) { create(:re_slot, slotter: current_user) }

    context "with a valid ID" do
      it "returns success" do
        delete "/v1/reslot/#{re_slot.id}", {}, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "doesn't destroy the re_slot" do
        expect {
          delete "/v1/reslot/#{re_slot.id}", {}, auth_header
        }.not_to change(ReSlot, :count)
      end
    end

    context "with an invalid ID" do
      let(:wrong_id) { re_slot.id + 1 }

      it "responds with Not Found" do
        delete "/v1/reslot/#{wrong_id}", {}, auth_header
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        expect {
          delete "/v1/reslot/#{wrong_id}", {}, auth_header
        }.not_to change(ReSlot, :count)
      end
    end
  end

  describe "GET /v1/:uid/slotdata", :focus do
    let!(:slot) { create(:std_slot, :with_notes, :with_location,
                         :with_real_photo, share_url: '12345xyz') }

    it "returns data of slot" do
      get "/v1/slots/#{slot.share_url}/sharedata", {}, auth_header
      expect(response).to have_http_status :ok
      expect(json["title"]).to eq slot.title
      expect(json["startDate"]).to eq slot.start_date.as_json
    end
  end
end
