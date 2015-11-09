require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/slots/:id" do
    let(:std_slot) { create(:std_slot_public) }

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
        expect(json['visibility']).to eq 'public'
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

    context "ReSlot, with valid ID" do
      let(:std_slot) {
        create(:std_slot_public, :with_media, :with_notes) }
      let(:re_slot_1) {
        create(:re_slot, predecessor: std_slot,
               meta_slot: std_slot.meta_slot, parent: std_slot) }
      let(:re_slot_2) {
        create(:re_slot, predecessor: re_slot_1,
               meta_slot: std_slot.meta_slot, parent: std_slot) }

      it "returns success" do
        get "/v1/slots/#{re_slot_2.id}", {}, auth_header
        expect(response).to have_http_status(200)
      end

      it "has the same media items as the parent slot" do
        get "/v1/slots/#{re_slot_2.id}", {}, auth_header
        expect(json).to have_key('media')
        expect(response.body).to include std_slot.images.first.public_id
      end

      it "has the same notes as the parent slot" do
        get "/v1/slots/#{re_slot_2.id}", {}, auth_header
        expect(json).to have_key('notes')
        expect(
          json['notes'][1]['title']
        ).to eq(std_slot.notes.second.title)
      end
    end

    context "GroupSlot, with valid ID" do
      let(:group) { create(:group, owner: current_user) }
      let(:group_slot) { create(:group_slot, group: group) }

      it "returns success" do
        get "/v1/slots/#{group_slot.id}", {}, auth_header
        expect(response).to have_http_status(200)
        expect(json['id']).to eq(group_slot.id)
        expect(json).to have_key('group')
        expect(json['group']['id']).to eq(group_slot.group_id)
      end
    end
  end

  describe "POST /v1/stdlot" do
    context "StdSlot with valid params" do
      let(:visibility) { 'private' }
      let(:valid_slot) {
        attr = attributes_for(:meta_slot).merge(
          visibility: visibility, settings: { alerts: '1110001100' })
        attr.transform_keys { |key| key.to_s.camelize(:lower) }
      }

      it "responds with Created (201)" do
        post "/v1/stdslot/", valid_slot, auth_header
        expect(response).to have_http_status(:created)
      end

      it "adds a new StdSlot entry to the DB" do
        expect {
          post "/v1/stdslot/", valid_slot, auth_header
        }.to change(StdSlot.unscoped, :count).by 1
      end

      it "adds a new MetaSlot entry to the DB" do
        expect {
          post "/v1/stdslot/", valid_slot, auth_header
        }.to change(MetaSlot, :count).by 1
      end

      it "adds a new SlotSetting entry to the DB" do
        expect {
          post "/v1/stdslot/", valid_slot, auth_header
        }.to change(SlotSetting, :count).by 1
      end

      it "returns the ID of the new slot" do
        post "/v1/stdslot/", valid_slot, auth_header
        expect(json['id']).to eq(StdSlot.unscoped.last.id)
      end

      it "sets slot to 'open End' if empty end_date" do
        valid_slot[:startDate] = "2014-09-08 13:31:02"
        valid_slot[:endDate] = ""
        post "/v1/stdslot/", valid_slot, auth_header
        expect(response).to have_http_status(:created)
        slot = StdSlot.unscoped.last
        # need to cast to_datetime bc of different millisecond precision
        expect(slot.end_date)
          .to eq slot.start_date.to_datetime.next_day.at_midday
        expect(slot.open_end).to be true
      end

      context "visibility" do
        let(:visibility) { 'foaf' }

        it "creates slot with visibility friends-of-friends" do
          expect {
            post "/v1/stdslot/", valid_slot, auth_header
          }.to change(StdSlotFoaf, :count)
          expect(response).to have_http_status :created
        end
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        attr = attributes_for(:meta_slot).merge(visibility: 'private')
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

        it "if start_date equals end_date" do
          slot = attributes_for(:meta_slot,
                                start_date: "2014-09-08 13:31:02",
                                end_date: "2014-09-08 13:31:02")
          slot = slot.transform_keys { |key| key.to_s.camelize(:lower) }

          post "/v1/stdslot/", slot.merge(visibility: 'public'), auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "if start_date after end_date"  do
          slot = attributes_for(:meta_slot,
                                start_date: "2014-09-08 13:31:02",
                                end_date: "2014-07-07 13:31:02")
          slot = slot.transform_keys { |key| key.to_s.camelize(:lower) }

          post "/v1/stdslot/", slot.merge(visibility: 'public'), auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "for empty visibility" do
          invalid_attributes[:visibility] = ""
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for missing visibility" do
          invalid_attributes.extract! 'visibility'
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          invalid_attributes[:visibility] = "$$"
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'error'
        end

        it "if visibility has to much characters" do
          invalid_attributes[:visibility] = "101"
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'error'
        end

        it "if locationId and IosLocation are submitted both" do
          invalid_attributes[:iosLocation] = { name: 'foo' }
          invalid_attributes[:locationId] = 1
          post "/v1/stdslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'error'
        end
      end
    end
  end

  describe "POST /v1/groupslot" do
    let(:group) { create(:group, :members_can_post) }
    let!(:membership) {
      create(:membership, :active, group: group, user: current_user) }

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
        }.to change(GroupSlot.unscoped, :count).by(1)
      end

      it "adds a new meta_slot entry to the DB" do
        expect {
          post "/v1/groupslot/", valid_slot, auth_header
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/groupslot/", valid_slot, auth_header
        expect(json['id']).to eq(GroupSlot.unscoped.last.id)
      end
    end

    describe "create GroupSlot for existing metaslot" do
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
          }.to change(GroupSlot.unscoped, :count).by(1)
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
          }.to change(GroupSlot.unscoped, :count).by(1)
        end

        it "sets the correct group on the new group_slot" do
          post "/v1/groupslot/", group_slot_params, auth_header
          expect(GroupSlot.unscoped.last.group_id).to eq group.id
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
          }.to change(GroupSlot.unscoped, :count).by(1)
        end
      end
    end

    context "with invalid params" do
      let(:metaslot) { attributes_for(:meta_slot).merge(groupId: group.id) }
      let(:invalid_attributes) {
        metaslot.transform_keys! { |key| key.to_s.camelize(:lower) }
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
          metaslot[:title] = ""
          post "/v1/groupslot/", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid start_date" do
          metaslot[:start_date] = "|$%^@wer"
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
    context "with valid params" do
      let(:pred) { create(:std_slot_public) }
      let(:valid_attributes) {
        attributes_for(:re_slot, predecessorId: pred.id)
      }

      context "ReSlot from StdSlot" do
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

        context "ReSlot from private std_slot" do
          let(:pred) { create(:std_slot_private) }

          it "responds with 422" do
            post "/v1/reslot/", valid_attributes, auth_header
            expect(response).to have_http_status :unauthorized
          end

          it "doesn't add a new entry to the DB" do
            expect {
              post "/v1/reslot/", valid_attributes, auth_header
            }.not_to change(ReSlot, :count)
          end
        end
      end

      context "ReSlot from ReSlot" do
        let!(:pred) { create(:re_slot) }

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

        it "sets the parent of the new reslot to the original parent" do
          post "/v1/reslot/", valid_attributes, auth_header
          new_reslot = ReSlot.last
          expect(new_reslot.parent_id).to eq pred.parent_id
        end
      end

      # TODO: @sh: I think this shouln't be possible at all...???
      # but since we don't know where the product is going we'll just
      # leave it here as it is until it hurts us
      context "ReSlot from GroupSlot" do
        let(:pred) do
          slot = create(:group_slot)
          create(:membership, :active, group: slot.group, user: current_user)
          slot
        end

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

      context "duplicate reslot" do
        let!(:existing_reslot) {
          create(:re_slot, predecessor: pred, slotter: current_user)
        }

        it "doesn't create a new reslot" do
          expect {
            post "/v1/reslot/", valid_attributes, auth_header
          }.not_to change(ReSlot, :count)
        end

        it "returns the existing reslot" do
          post "/v1/reslot/", valid_attributes, auth_header
          expect(json['id']).to eq(existing_reslot.id)
        end
      end

      context "reslot peviously deleted reslot" do
        # a user makes a reslot of an event, then deletes the reslot, then
        # does a reslot of the same event again
        let(:reslot) { create(:re_slot, predecessor: pred) }
        let!(:existing_deleted_reslot) {
          create(:re_slot, predecessor: reslot, slotter: current_user,
                 deleted_at: Time.zone.now)
        }

        it "doesn't create a new reslot" do
          expect {
            post "/v1/reslot/", valid_attributes, auth_header
          }.not_to change(ReSlot, :count)
        end

        it "returns the existing reslot" do
          post "/v1/reslot/", valid_attributes, auth_header
          expect(json['id']).to eq(existing_deleted_reslot['id'])
        end

        it "unsets deleted_at on the existing reslot" do
          post "/v1/reslot/", valid_attributes, auth_header
          existing_deleted_reslot.reload
          expect(existing_deleted_reslot.deleted_at).to be nil
        end

        it "updates the predecessor" do
          expect(existing_deleted_reslot.predecessor_id).to eq reslot.id
          post "/v1/reslot/", valid_attributes, auth_header
          existing_deleted_reslot.reload
          expect(existing_deleted_reslot.predecessor_id).to eq pred.id
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
        metaslot.update(end_date: "2019-09-09 13:31:02")
        patch "/v1/metaslot/#{metaslot.id}",
              { endDate: "2019-12-11 13:31:02" }, auth_header
        metaslot.reload
        expect(metaslot.end_date).to eq("2019-12-11 13:31:02")
        expect(metaslot.open_end).to be false
      end

      it "sets slot to 'open End' if empty end_date" do
        metaslot.update(start_date: "2014-09-08 07:31:02")
        patch "/v1/metaslot/#{metaslot.id}", { endDate: "" }, auth_header
        expect(response).to have_http_status(:no_content)
        metaslot.reload
        # need to cast to_datetime bc of different millisecond precision
        expect(metaslot.end_date)
          .to eq metaslot.start_date.to_datetime.at_end_of_day
        expect(metaslot.open_end).to be true
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

        it "for invalid end_date" do
          patch "/v1/metaslot/#{metaslot.id}",
                { endDate: "|$%^@wer" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('not a valid value')
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
    let!(:std_slot) { create(:std_slot_private, owner: current_user) }

    describe "handling non-media params" do
      context "valid params" do
        it "responds with No Content (204)" do
          patch "/v1/stdslot/#{std_slot.id}",
                { title: "Something" }, auth_header
          expect(response).to have_http_status(:ok)
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

        it "updates the visibility of a given StdSlot" do
          expect(std_slot.visibility).to eq 'private'
          patch "/v1/stdslot/#{std_slot.id}",
                { visibility: 'public' }, auth_header
          std_slot.reload
          expect(std_slot.visibility).to eq 'public'
        end

        it "updates the end_date of a given StdSlot" do
          std_slot.meta_slot.update(end_date: "2019-12-09 13:31:02")
          patch "/v1/stdslot/#{std_slot.id}",
                { endDate: "2019-12-11 13:31:02" }, auth_header
          std_slot.reload
          expect(std_slot.end_date).to eq("2019-12-11 13:31:02")
          expect(std_slot.open_end).to be false
        end

        it "sets slot to 'open End' if empty end_date" do
          std_slot.meta_slot.update(start_date: "2014-09-08 13:31:02")
          patch "/v1/stdslot/#{std_slot.id}", { endDate: "" }, auth_header
          expect(response).to have_http_status(:ok)
          std_slot.reload
          # need to cast to_datetime bc of different millisecond precision
          expect(std_slot.end_date)
            .to eq std_slot.start_date.to_datetime.next_day.at_midday
          expect(std_slot.open_end).to be true
        end

        context "slot with open end" do
          let!(:std_slot) do
            create(:std_slot_private,
                   owner: current_user,
                   start_date: "2014-09-08 13:31:02",
                   end_date: "")
          end
          let(:endDate) { "2014-09-08 15:18:31" }

          it "unsets 'openEnd' if end_date is set" do
            expect(std_slot.open_end).to be true
            patch "/v1/stdslot/#{std_slot.id}", { endDate: endDate }, auth_header
            std_slot.reload
            expect(std_slot.end_date).to eq endDate
            expect(std_slot.open_end).to be false
            expect(response).to have_http_status(:ok)
          end

          # BUG: this part has a potential lack
          #          it "doesn't unset 'openEnd' if same 'open' end_date is resubmitted" do
          #            expect(std_slot.open_end).to be true
          #            expect {
          #              patch "/v1/stdslot/#{std_slot.id}",
          #                    { endDate: std_slot.end_date }, auth_header
          #            }.not_to change(std_slot, :open_end)
          #            expect(response).to have_http_status(:ok)
          #            #expect(json['openEnd']).to be true
          #            expect(json['endDate']).to be nil
          #          end
        end
      end

      context "invalid params" do
        describe "User not owner of StdSlot" do
          let(:std_slot) { create(:std_slot_private) }

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

          it "for invalid end_date" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { endDate: "|$%^@wer" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('not a valid value')
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

          it "for invalid visibility" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { visibility: "Something" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('visibility')
          end

          it "for empty visibility" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { visibility: '' }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('visibility')
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
        expect(std_slot.notes.first.creator_id).to eq(current_user.id)
      end

      it "adds the submitted note to the db" do
        patch "/v1/stdslot/#{std_slot.id}", add_note, auth_header
        std_slot.reload
        expect(std_slot.notes.first.title).to eq(note[:title])
        expect(std_slot.notes.first.content).to eq(note[:content])
        expect(std_slot.notes.first.creator_id).to eq(current_user.id)
      end

      it "adds an additional new note" do
        create(:note, slot: std_slot, creator: current_user)

        patch "/v1/stdslot/#{std_slot.id}", add_note, auth_header
        std_slot.reload
        expect(std_slot.notes.size).to eq(2)
        expect(std_slot.notes.first.creator_id).to eq(current_user.id)
      end

      context "patch with valid params" do
        let(:std_slot) { create(:std_slot_private, :with_note, owner: current_user) }
        let(:changed_note) {
          { notes: [{ id: std_slot.notes.first.id, title: "something new" }] }
        }
        it "updates an existing note" do
          patch "/v1/stdslot/#{std_slot.id}", changed_note, auth_header
          std_slot.reload
          expect(std_slot.notes.size).to eq 1
          expect(std_slot.notes.first.title).to eq "something new"
          expect(std_slot.notes.first.creator_id).to eq(current_user.id)
        end
      end

      context "patch non-existing note" do
        let(:std_slot) { create(:std_slot_private, :with_note, owner: current_user) }
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
        let(:std_slot) { create(:std_slot_private, :with_note, owner: current_user) }
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
      let(:add_media_item) { { media: media } }

      context "add images with valid params" do
        let(:media) do
          [{ publicId: "foo-image",
             mediaType: 'image',
             position: "1" }]
        end

        it "returns success" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "returns a mediaId" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(*json['media']).to have_key('mediaId')
        end

        it "returns the ID of new media_item" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(json['media'][0]['mediaId']).to eq std_slot.media_items[0].id
        end

        it "adds a new image" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(std_slot.media_items.size).to eq(1)
          expect(std_slot.images.first.creator_id).to eq(current_user.id)
        end

        it "adds the submitted image to the db" do
          patch "/v1/stdslot/#{std_slot.id}", add_media_item, auth_header
          std_slot.reload
          expect(std_slot.media_items[0].media_type).to eq 'image'
          expect(std_slot.images[0].public_id).to eq(media.first[:publicId])
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
          let(:media) { [{ publicId: "foo-image", mediaType: "image" }] }
          let!(:std_slot) {
            create(:std_slot_private, :with_media, owner: current_user)
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
          let(:media) { [{ publicId: "foo-image",
                           mediaType: 'image',
                           position: "0" }] }

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
        let(:media) { [{ position: "0", mediaType: 'image' }] }

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
            { media: [
                { mediaId: media_item_1.id,
                  mediaType: 'image',
                  position: 2 },
                { mediaId: media_item_2.id,
                  mediaType: 'image',
                  position: 0 },
                { mediaId: media_item_3.id,
                  mediaType: 'image',
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
              { media: [
                  { mediaId: media_item_1.id,
                    mediaType: 'image',
                    position: 2 },
                  { mediaId: media_item_2.id,
                    mediaType: 'image',
                    position: 0 },
                  { mediaId: invalid_id,
                    mediaType: 'image',
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
              { media: [
                  { mediaId: media_item_1.id,
                    mediaType: 'image',
                    position: 1 },
                  { mediaId: media_item_2.id,
                    mediaType: 'image',
                    position: 0 },
                  { mediaId: media_item_3.id,
                    mediaType: 'image',
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
          [{ publicId: "foo-video",
             mediaType: "video"
           }]
        end

        it "adds a new video" do
          patch "/v1/stdslot/#{std_slot.id}", { media: media }, auth_header
          std_slot.reload
          expect(std_slot.videos[0].media_type).to eq 'video'
          expect(std_slot.videos[0].position).to eq 0
          expect(std_slot.videos[0].public_id).to eq(media.first[:publicId])
        end
      end

      context "audio" do
        let(:media) do
          [{ publicId: "foo-audio",
             mediaType: "audio",
             title: 'Nice sound',
             position: "1" }]
        end

        it "adds a new audio item" do
          patch "/v1/stdslot/#{std_slot.id}", { media: media }, auth_header
          std_slot.reload
          expect(std_slot.audios[0].media_type).to eq 'audio'
          expect(std_slot.audios[0].title).to eq 'Nice sound'
          expect(std_slot.audios[0].public_id).to eq(media.first[:publicId])
        end

        it "returns audio item in json" do
          patch "/v1/stdslot/#{std_slot.id}", { media: media }, auth_header
          expect(json).to have_key 'media'
          expect(json['media'].first).to have_key 'mediaId'
          expect(json['media'].first).to have_key 'publicId'
          expect(json['media'].first).to have_key 'localId'
          expect(json['media'].first).to have_key 'position'
          expect(json['media'].first).to have_key 'duration'
          expect(json['media'].first).to have_key 'title'
          expect(json['media'].first['title']).to eq 'Nice sound'
        end
      end
    end

    describe "handling mixed params" do
      let(:note) { attributes_for(:note) }

      context "valid params" do
        let(:new_params) { { title: '2015',
                             notes: [note] } }

        it "returns success" do
          patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "updates slot with all new params" do
          patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          std_slot.reload
          expect(std_slot.title).to eq '2015'
          expect(std_slot.notes.size).to eq(1)
        end
      end

      context "invalid params" do
        let(:new_params) { { title: '',
                             notes: [note] } }

        it "returns unprocessable entity" do
          patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe :ios_location do
      let(:new_params) do
        { location: { locality: "Berlin", name: "Berlin Custom", country: "Germany",
                      longitude: 13.4113999, latitude: 52.5234051
                    } }
      end

      context "new ios_location" do
        it "creates a new iosLocation" do
          expect {
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          }.to change(IosLocation, :count).by 1
          new_location = IosLocation.last
          expect(new_location.locality).to eq 'Berlin'
        end

        describe "slot without ios_location" do
          it "sets the iosLocation" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            std_slot.reload
            expect(std_slot.ios_location).not_to be nil
            expect(std_slot.ios_location.locality).to eq 'Berlin'
          end

          it "returns ok" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(response).to have_http_status :ok
          end

          it "returns the new location" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(json).to have_key 'location'
            expect(json['location']).not_to be nil
            expect(json['location']['locality']).to eq 'Berlin'
          end
        end

        describe "slot with ios_location" do
          let(:std_slot) do
            create(:std_slot_public, :with_ios_location, owner: current_user,
                   title: 'whoa')
          end

          it "updates iosLocation" do
            expect(std_slot.ios_location.locality).not_to eq 'Berlin'
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            std_slot.reload
            expect(std_slot.ios_location).not_to be nil
            expect(std_slot.ios_location.locality).to eq 'Berlin'
          end

          it "returns ok" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(response).to have_http_status :ok
          end

          it "returns the new location" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(json).to have_key 'location'
            expect(json['location']).not_to be nil
            expect(json['location']['locality']).to eq 'Berlin'
          end
        end
      end

      context "duplicate ios_location" do
        let!(:existing_location) do
          create(:ios_location, locality: "Berlin", name: "Berlin Custom", country: "Germany",
                 longitude: 13.4113999, latitude: 52.5234051)
        end

        it "doesn't create a new iosLocation" do
          expect {
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
          }.not_to change(IosLocation, :count)
        end

        describe "slot without ios_location" do
          it "sets the iosLocation" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            std_slot.reload
            expect(std_slot.ios_location).not_to be nil
            expect(std_slot.ios_location.locality).to eq 'Berlin'
            expect(std_slot.ios_location.name).to eq 'Berlin Custom'
          end

          it "returns ok" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(response).to have_http_status :ok
          end

          it "returns the new location" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(json).to have_key 'location'
            expect(json['location']).not_to be nil
            expect(json['location']['locality']).to eq 'Berlin'
            expect(json['location']['name']).to eq 'Berlin Custom'
          end
        end

        describe "slot with ios_location" do
          let(:std_slot) {
            create(:std_slot_public, :with_ios_location, owner: current_user)
          }

          it "updates iosLocation" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            std_slot.reload
            expect(std_slot.ios_location).not_to be nil
            expect(std_slot.ios_location.locality).to eq 'Berlin'
            expect(std_slot.ios_location.name).to eq 'Berlin Custom'
          end

          it "returns ok" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(response).to have_http_status :ok
          end

          it "returns the new location" do
            patch "/v1/stdslot/#{std_slot.id}", new_params, auth_header
            expect(json).to have_key 'location'
            expect(json['location']).not_to be nil
            expect(json['location']['locality']).to eq 'Berlin'
            expect(json['location']['name']).to eq 'Berlin Custom'
          end
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

    context "with valid alerts" do
      it "responds with 200" do
        patch "/v1/reslot/#{re_slot.id}",
              { settings: { alerts: '1110001100' }}, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "updates the alert of a given ReSlot" do
        patch "/v1/reslot/#{re_slot.id}",
              { settings: { alerts: '1110001101' } }, auth_header
        re_slot.reload
        expect(current_user.alerts(re_slot)).to eq("1110001101")
      end
    end

    context "with valid media params" do
      let(:add_media_item) { { media: media } }
      let(:media) do
        [{ publicId: "foo-image",
           mediaType: 'image',
           position: "1" }]
      end

      it "responds with 200" do
        patch "/v1/reslot/#{re_slot.id}", add_media_item, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "adds new media to the parent slot" do
        patch "/v1/reslot/#{re_slot.id}", add_media_item, auth_header
        re_slot.reload
        expect(re_slot.images.first.public_id).to eq("foo-image")
      end
    end

    describe "handling notes" do
      let(:note) { attributes_for(:note) }
      let(:add_note) { { notes: [note] } }

      it "returns success" do
        patch "/v1/reslot/#{re_slot.id}", add_note, auth_header
        expect(response).to have_http_status(:ok)
      end

      it "adds a new note to the parent slot" do
        patch "/v1/reslot/#{re_slot.id}", add_note, auth_header
        re_slot.reload
        expect(re_slot.notes.size).to eq(1)
      end

      it "adds the submitted note to the db" do
        patch "/v1/reslot/#{re_slot.id}", add_note, auth_header
        re_slot.reload
        expect(re_slot.notes.first.title).to eq(note[:title])
        expect(re_slot.notes.first.content).to eq(note[:content])
      end
    end
  end

  describe "DELETE /v1/stdslot/:id" do
    let!(:std_slot) { create(:std_slot_private, owner: current_user) }

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
    let(:parent) { create(:std_slot) }
    let!(:re_slot) { create(:re_slot, slotter: current_user, parent: parent) }

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

      context "parent attributes" do
        context "likes" do
          let(:parent) { create(:std_slot, :with_likes) }

          it "doesn't destroy the likes of the parent slot" do
            expect {
              delete "/v1/reslot/#{re_slot.id}", {}, auth_header
            }.not_to change(parent.likes, :count)
          end
        end

        context "comments" do
          let(:parent) { create(:std_slot, :with_comments) }

          it "doesn't destroy the comments of the parent slot" do
            expect {
              delete "/v1/reslot/#{re_slot.id}", {}, auth_header
            }.not_to change(parent.comments, :count)
          end
        end

        context "media" do
          let(:parent) { create(:std_slot, :with_media) }

          it "doesn't destroy the media of the parent slot" do
            expect {
              delete "/v1/reslot/#{re_slot.id}", {}, auth_header
            }.not_to change(parent.media_items, :count)
          end
        end
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

  describe "GET /v1/slots/:id/share" do
    let(:slot) { create(:std_slot_public) }

    it "returns data of slot including share url" do
      get "/v1/slots/#{slot.id}/share", {}, auth_header

      expect(response).to have_http_status :ok
      expect(json).to have_key 'shareUrl'
      expect(json["shareUrl"]).to include slot.share_id
    end
  end

  describe "GET /v1/slots/:uid/slotdata" do
    let!(:slot) { create(:std_slot_private, :with_notes, :with_location,
                         :with_real_image, share_id: '12345xyz',
                         shared_by: create(:user)) }
    before { current_user.webview! }

    it "returns data of slot" do
      get "/v1/slots/#{slot.share_id}/sharedata", {}, auth_header
      expect(response).to have_http_status :ok
      expect(json["title"]).to eq slot.title
      expect(json["startDate"]).to eq slot.start_date.as_json
    end
  end

  describe "POST /v1/slots/:id/like" do
    let(:std_slot) { create(:std_slot_public) }

    context "StdSlot" do
      it "creates a new like" do
        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.to change(Like, :count).by 1
      end

      it "handles re-liking the same slot gracefully" do
        create(:like, user: current_user, slot: std_slot)
        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.not_to change(Like, :count)
        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.not_to raise_error
      end

      it "re-like slot which was unliked" do
        like = create(:like, user: current_user, slot: std_slot,
                      deleted_at: Time.zone.now)
        expect(like.deleted_at).not_to be nil

        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.not_to change(Like, :count)

        like.reload
        expect(like.deleted_at).to be nil

        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.not_to raise_error
      end
    end

    context "ReSlot" do
      let(:parent) { std_slot }
      let(:re_slot) { create(:re_slot, slotter: current_user, parent: parent) }

      it "creates a new like" do
        expect {
          post "/v1/slots/#{re_slot.id}/like", {}, auth_header
        }.to change(Like, :count).by 1
      end

      it "adds the new like to the parent slot" do
        post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        post "/v1/slots/#{re_slot.id}/like", {}, auth_header
        expect(Like.last.slot.id).to eq parent.id
        expect(Like.last.slot.id).to eq re_slot.parent.id
      end

      # test for bug BKD-288
      it "liking reslot of already liked parent slot (does nothing)" do
        create(:like, user: current_user, slot: parent)
        expect(Like.count).to be 1

        expect {
          post "/v1/slots/#{re_slot.id}/like", {}, auth_header
        }.not_to raise_error

        expect(Like.count).to be 1
        expect(response).to have_http_status :ok
      end
    end
  end

  describe "DELETE /v1/slots/:id/like" do
    context "StdSlot" do
      let(:std_slot) { create(:std_slot) }
      let!(:like) { create(:like, user: current_user, slot: std_slot) }

      it "sets deleted_at on the like" do
        delete "/v1/slots/#{std_slot.id}/like", {}, auth_header
        like.reload
        expect(like.deleted_at?).to be true
      end
    end

    context "ReSlot" do
      let(:re_slot) { create(:re_slot, slotter: current_user) }
      let!(:like) { create(:like, user: current_user, slot: re_slot.parent) }

      it "sets deleted_at on the like" do
        delete "/v1/slots/#{re_slot.id}/like", {}, auth_header
        expect(response).to have_http_status :ok
        like.reload
        expect(like.deleted_at?).to be true
      end
    end
  end

  describe "GET /v1/slots/1/likes" do
    let(:std_slot) { create(:std_slot_public, :with_likes) }

    context "ReSlot" do
      let(:re_slot) {
        create(:re_slot, slotter: current_user, parent: std_slot) }

      it "retrieves a list of all likes with user details" do
        get "/v1/slots/#{re_slot.id}/likes", {}, auth_header
        expect(json.count).to eq std_slot.likes.count
      end
    end
  end

  describe "POST /v1/slots/:id/comment" do
    let(:parent) { create(:std_slot_public) }
    let(:re_slot) { create(:re_slot, slotter: current_user, parent: parent) }
    let(:new_comment) { { content: "Liebe ist ein Kind der Freiheit" } }

    it "creates a new comment" do
      expect {
        post "/v1/slots/#{re_slot.id}/comment", new_comment, auth_header
      }.to change(Comment, :count).by 1
    end

    it "adds the new comment to the parent slot" do
      post "/v1/slots/#{re_slot.id}/comment", new_comment, auth_header
      expect(Comment.last.slot.id).to eq parent.id
      expect(Comment.last.slot.id).to eq re_slot.parent.id
      expect(Comment.last.content).to eq new_comment[:content]
    end
  end

  describe "POST /v1/slots/:id/copy" do
    # rspec seems to have bug regarding post parameters with array of hashes
    # so I can not test copying into stdslots and groupslots at the same time
    # however, from the console it seems to work that's why I think it's rspec
    # using :

    # let(:copy_params) { { copyTo: [
    #                         { slot_type: 'public', details: 'false' },
    #                         { group_id: group_1.id, details: 'false' }
    #                       ] } }

    # gives me:

    # pry(#<V1::SlotsController>)> params
    # => {"copyTo"=>[
    #          {"slot_type"=>"public", "details"=>"false", "group_id"=>"6"},
    #          {"details"=>"false"}],

    # couldn't find a way to solve this yet

    let(:group_1) { create(:group) }
    let(:group_2) { create(:group) }

    describe "copy groupSlot to stdslots without details" do
      let!(:group_slot) { create(:group_slot_public, :with_likes, :with_notes) }

      let(:copy_params) { { copyTo: [
                              { slotType: 'public',
                                details: 'false' },
                              { slotType: 'private',
                                details: 'false' }
                            ] } }

      it "creates new slots" do
        expect {
          post "/v1/slots/#{group_slot.id}/copy", copy_params, auth_header
        }.to change(BaseSlot.unscoped, :count).by 2
      end
    end

    describe "copy into groups without details" do
      let!(:std_slot) { create(:std_slot_public, owner: current_user) }
      let(:copy_params) { { copyTo: [
                              { groupId: group_1.id,
                                details: 'false' },
                              { groupId: group_2.id,
                                details: 'false' }
                            ] } }

      it "creates new slots" do
        expect {
          post "/v1/slots/#{std_slot.id}/copy", copy_params, auth_header
        }.to change(GroupSlot.unscoped, :count).by 2
      end
    end

    describe "copy groupslot with details into private stdslot" do
      let!(:current_user) { create(:user) }
      let!(:user) { create(:user) }
      let!(:group_slot) { create(:group_slot_public, :with_media, :with_likes,
                                 :with_notes, creator: user) }
      let(:copy_params) { { copyTo: [ { slotType: 'private',
                                        details: 'true' }] } }

      it "copys media data and notes unless explictly disabled" do
        post "/v1/slots/#{group_slot.id}/copy", copy_params, auth_header
        new_slot = BaseSlot.unscoped.last
        expect(new_slot.notes.size).to eq 3
        expect(new_slot.notes.second.title).to eq group_slot.notes.second.title
        expect(new_slot.likes.size).to eq 0
        expect(new_slot.media_items.size).to eq 6
        expect(new_slot.images.first.public_id).to eq group_slot.images.first.public_id
        expect(new_slot.images.first.id).not_to eq group_slot.images.first.id
        expect(new_slot.images.first.creator).to eq user
      end
    end

    describe "copy stdslot with details into groupslot" do
      let!(:current_user) { create(:user) }
      let!(:user) { create(:user) }
      let!(:std_slot) { create(:std_slot_public, :with_media, :with_likes,
                               :with_notes, creator: user) }
      let(:copy_params) { { copyTo: [{ groupId: group_1.id,
                                       details: 'true' },
                                     { groupId: group_2.id,
                                       details: true }] } }

      it "copys media data and notes unless explictly disabled" do
        post "/v1/slots/#{std_slot.id}/copy", copy_params, auth_header
        new_slot = BaseSlot.unscoped.last
        expect(new_slot.notes.size).to eq 3
        expect(new_slot.notes.second.title).to eq std_slot.notes.second.title
        expect(new_slot.likes.size).to eq 0
        expect(new_slot.media_items.size).to eq 6
        expect(new_slot.images.first.public_id).to eq std_slot.images.first.public_id
        expect(new_slot.images.first.id).not_to eq std_slot.images.first.id
        expect(new_slot.images.first.creator).to eq user
      end
    end
  end

  describe "POST /v1/slots/:id/move" do
    let!(:std_slot) { create(:std_slot_private, owner: current_user) }

    context "move to public slots without details" do
      let(:move_params) { { slotType: 'public',
                            details: 'false' } }

      it "creates a new slot" do
        expect {
          post "/v1/slots/#{std_slot.id}/move", move_params, auth_header
        }.to change(StdSlot.unscoped, :count).by 1
      end

      it "owner of the new slot is current user" do
        post "/v1/slots/#{std_slot.id}/move", move_params, auth_header
        expect(StdSlot.unscoped.last.owner).to eq current_user
      end

      it "deletes to original slot" do
        post "/v1/slots/#{std_slot.id}/move", move_params, auth_header
        std_slot.reload
        expect(std_slot.deleted_at?).to be true
      end
    end

    context "move to friendslots without details" do
      let(:move_params) { { slotType: 'friends',
                            details: false } }

      it "creates a new slot" do
        expect {
          post "/v1/slots/#{std_slot.id}/move", move_params, auth_header
        }.to change(StdSlot.unscoped, :count).by 1
      end
    end

    context "move to friendslots with details" do
      let!(:std_slot) {
        create(:std_slot_private, :with_real_image, owner: current_user) }
      let(:image) { std_slot.media_items.first }
      let(:move_params) { { slotType: 'friends',
                            details: true } }
      before {
        Cloudinary::Uploader.remove_tag("replaced", image.public_id)
      }

      it "doesn't mark the cloudinary resource as deleted", :vcr do
        post "/v1/slots/#{std_slot.id}/move", move_params, auth_header

        tags = Cloudinary::Api.resource(image.public_id)["tags"]
        expect(tags).not_to include "replaced" if tags
        image.reload
        expect(image.deleted_at?).to be true
      end
    end

    context "move to group without details" do
      let(:move_params) { { groupId: create(:group).id,
                            details: false } }

      it "creates a new groupslot" do
        expect {
          post "/v1/slots/#{std_slot.id}/move", move_params, auth_header
        }.to change(GroupSlot.unscoped, :count).by 1
      end
    end
  end

  describe "GET /v1/slots/demo" do
    context "without pagination" do
      let!(:std_slot) { create(:std_slot_public) }
      let!(:re_slot) { create(:re_slot) }

      it "returns success" do
        get "/v1/slots/demo", {}, auth_header
        expect(response.status).to be(200)
      end

      it "gets the latest/newest stdslots" do
        get "/v1/slots/demo", {}, auth_header
        expect(response.body).to include std_slot.title
      end

      it "dosn't include reslots" do
        get "/v1/slots/demo", {}, auth_header
        # when creating a reslot, a stdslot is created implicitly as its parent
        # of course, this parent is included in the result so I rather look
        # for a reslot specific json attribute
        expect(response.body).not_to include 'parent'
      end
    end

    context "pagination", :keep_slots do
      let(:limit) { 4 }
      let(:query_string) { { limit: limit } }

      before(:all) do
        current_user = create(:user, :with_email, :with_password)

        create(:std_slot_private,
               start_date: Time.zone.tomorrow,
               title: 'private upcoming slot')
        create(:std_slot_public,
               start_date: Time.zone.tomorrow,
               title: 'public upcoming slot')
        create(:std_slot_private,
               start_date: Time.zone.tomorrow,
               title: 'my private upcoming slot',
               owner: current_user)
        create(:std_slot_public,
               start_date: Time.zone.tomorrow,
               title: 'my public upcoming slot',
               owner: current_user)
        create_list(:std_slot_public, 3,
                    start_date: Time.zone.tomorrow,
                    owner: current_user)
      end

      it "returns success" do
        get "/v1/slots/demo", query_string, auth_header
        expect(response.status).to be(200)
      end

      it "returns pagination metadata" do
        get "/v1/slots/demo", query_string, auth_header

        expect(json).to have_key 'data'
        expect(json).to have_key 'paging'
        paging = json['paging']
        expect(paging).to have_key 'moment'
        expect(paging).to have_key 'limit'
        expect(paging).to have_key 'before'
        expect(paging).to have_key 'after'
        expect(paging['before']).not_to be nil
        expect(paging['after']).not_to be nil
      end

      it "returns upcoming public stdslots" do
        latest_slot = StdSlotPublic.last
        public_slot_count = StdSlotPublic.all.count

        get "/v1/slots/demo",
            { limit: public_slot_count, status: 'upcoming'},
            auth_header

        expect(response.body).to include latest_slot.title
        expect(response.body).to include 'public upcoming slot'
        expect(response.body).to include 'my public upcoming slot'
        expect(json['data'].size).to eq public_slot_count
      end

      it "doesn't return private slots" do
        slot_count = StdSlot.unscoped.all.count

        get "/v1/slots/demo",
            { limit: slot_count, status: 'upcoming'},
            auth_header

        expect(response.body).not_to include 'private upcoming slot'
        expect(response.body).not_to include 'my private upcoming slot'
      end

      context "filter / status" do
        it "upcoming" do
          get "/v1/slots/demo",
              { limit: limit, status: 'upcoming'},
              auth_header
          expect(json).to have_key 'paging'
        end
      end
    end
  end
end
