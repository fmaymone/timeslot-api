require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/slots/:id" do
    let(:std_slot) { create(:std_slot_public) }

    describe "StdSlot" do
      context "with valid ID" do
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

      # this is basically a policy test, not sure if it's a good idea to test
      # this here
      describe "StdSlot visibility" do
        context "friends of friends" do
          let(:std_slot) { create(:std_slot_foaf) }
          let(:common_friend) { create(:user) }

          it "is visible to the owner" do
            get "/v1/slots/#{std_slot.id}", {},
                'Authorization' => "Token token=#{std_slot.creator.auth_token}"
            expect(response).to have_http_status :ok
          end

          it "is visible to friends of owner" do
            create(:friendship, :established, user: current_user,
                   friend: std_slot.creator)
            get "/v1/slots/#{std_slot.id}", {}, auth_header
            expect(response).to have_http_status :ok
          end

          it "is visible to friends of friends of owner" do
            create(:friendship, :established, user: current_user,
                   friend: common_friend)
            create(:friendship, :established, user: common_friend,
                   friend: std_slot.creator)

            get "/v1/slots/#{std_slot.id}", {}, auth_header
            expect(response).to have_http_status :ok
          end

          it "is not visible to unrelated users" do
            get "/v1/slots/#{std_slot.id}", {}, auth_header
            expect(response).to have_http_status :not_found
          end

          it "is not visible to strangers (not logged in)" do
            get "/v1/slots/#{std_slot.id}", {}, auth_header
            expect(response).to have_http_status :not_found
          end
        end
      end
    end

    describe "GlobalSlot" do
      let(:global_slot) { create(:global_slot) }

      it "returns success" do
        get "/v1/slots/#{global_slot.id}"
        expect(response).to have_http_status(200)
      end

      it "returns details of slot with given id" do
        get "/v1/slots/#{global_slot.id}"
        expect(json).to have_key('id')
        expect(json).to have_key('muid')
        expect(json).to have_key('title')
        expect(json).to have_key('startDate')
        expect(json).to have_key('endDate')
        expect(json).to have_key('notes')
        expect(json).to have_key('visibility')
        expect(json).to have_key('createdAt')
        expect(json).to have_key('updatedAt')
      end
    end

    describe "Slot in SlotGroup" do
      let(:slot) { create(:std_slot_private) }
      let(:group) { create(:group) }
      let!(:containership) {
        create(:containership, slot: slot, group: group)}

      context "user is member" do
        let!(:membership) {
          create(:membership, :active, group: group, user: current_user) }

        it "returns success" do
          get "/v1/slots/#{slot.id}", {}, auth_header
          expect(response).to have_http_status(200)
          expect(json['id']).to eq slot.id
        end
      end

      context "user not member" do
        it "returns Not Found" do
          get "/v1/slots/#{slot.id}", {}, auth_header
          expect(response).to have_http_status :not_found
        end
      end
    end
  end

  describe "POST /v1/slots" do
    let(:current_user) { create(:user, :with_default_calendars) }
    let(:my_friend_slots) { current_user.slot_sets['my_friend_slots_uuid'] }
    let(:my_private_slots) {
      uuid = current_user.slot_sets['my_private_slots_uuid']
      Group.find_by uuid: uuid
    }
    let(:my_public_slots) {
      uuid = current_user.slot_sets['my_public_slots_uuid']
      Group.find_by uuid: uuid
    }

    context "valid params" do
      let(:visibility) { 'private' }
      let(:valid_slot) {
        attributes_for(:meta_slot).merge(
          visibility: visibility, settings: { alerts: '1110001100' })
      }

      it "responds with Created (201)" do
        post "/v1/slots", valid_slot, auth_header
        expect(response).to have_http_status(:created)
      end

      it "adds a new StdSlot entry to the DB" do
        expect {
          post "/v1/slots", valid_slot, auth_header
        }.to change(StdSlot.unscoped, :count).by 1
      end

      it "adds a new MetaSlot entry to the DB" do
        expect {
          post "/v1/slots", valid_slot, auth_header
        }.to change(MetaSlot, :count).by 1
      end

      it "adds a new SlotSetting entry to the DB" do
        expect {
          post "/v1/slots", valid_slot, auth_header
        }.to change(SlotSetting, :count).by 1
      end

      it "returns the ID of the new slot" do
        post "/v1/slots", valid_slot, auth_header
        expect(json['id']).to eq(StdSlot.unscoped.last.id)
      end

      it "sets slot to 'open End' if empty end_date" do
        valid_slot[:start_date] = "2014-09-08 13:31:02"
        valid_slot[:end_date] = ""
        post "/v1/slots", valid_slot, auth_header
        expect(response).to have_http_status(:created)
        slot = StdSlot.unscoped.last
        # need to cast to_datetime bc of different millisecond precision
        expect(slot.end_date)
          .to eq slot.start_date.to_datetime.next_day.at_midday
        expect(slot.open_end).to be true
      end
    end

    # to maintain backward compatibility
    context "with visibility (deprecated)" do
      let(:valid_slot) {
        attributes_for(:meta_slot).merge(
          visibility: visibility, settings: { alerts: '1110001100' })
      }

      describe 'private' do
        let(:visibility) { 'private' }

        it "creates slot with visibility 'private'" do
          expect {
            post "/v1/slots", valid_slot, auth_header
          }.to change(StdSlotPrivate, :count).by 1
          expect(response).to have_http_status :created
        end

        context "no calendar at all submitted" do
          # let!(:my_private_slots) {
          #   uuid = current_user.slot_sets['my_private_slots_uuid']
          #   create(:group, uuid: uuid)
          # }

          it "puts the slot into 'My Private Slots' calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(my_private_slots.slots).to include StdSlot.last
            expect(response).to have_http_status :created
          end
        end

        context "at least one private calendar submitted" do
          let(:private_calendar) { create(:group, owner: current_user) }
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              visibility: visibility, settings: { alerts: '1110001100' })
            params['slot_groups'] = [private_calendar.uuid]
            params
          }

          it "puts the slot into the submitted private calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            private_calendar.reload
            expect(private_calendar.slots).to include StdSlot.last
          end

          it "doesn't put the slot into 'My Private Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            expect(my_private_slots.slots).not_to include StdSlot.last
          end
        end

        context "at least one public calendar submitted" do
          let!(:public_calendar) {
            create(:group, public: true, owner: current_user)
          }
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              visibility: visibility, settings: { alerts: '1110001100' })
            params['slot_groups'] = [public_calendar.uuid]
            params
          }

          it "creates slot with visibility 'public'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotPublic, :count).by 1
            expect(response).to have_http_status :created
          end

          it "set 'share_with_friends' to false" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be false
          end

          it "puts the slot into submitted public calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count)
            new_slot = StdSlotPublic.last
            expect(public_calendar.slots).to include new_slot
            expect(response).to have_http_status :created
          end

          it "doesn't put the slot into 'My Public Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            new_slot = StdSlot.last
            expect(my_public_slots.slots).not_to include new_slot
          end

          it "puts the slot into 'My Private Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            new_slot = StdSlot.last
            expect(my_private_slots.slots).to include new_slot
          end
        end
      end

      describe 'friends' do
        let(:visibility) { 'friends' }
        context "no calendar at all submitted" do
          # let!(:my_private_slots) {
          #   uuid = current_user.slot_sets['my_private_slots_uuid']
          #   create(:group, uuid: uuid)
          # }

          it "creates slot with visibility 'friends'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotFriends, :count).by 1
            expect(response).to have_http_status :created
          end

          it "set 'share_with_friends' to true" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlotFriends.last.share_with_friends).to be true
          end

          it "puts the slot into 'My Private Slots' calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(my_private_slots.slots).to include StdSlot.last
            expect(response).to have_http_status :created
          end
        end

        context "only private calendar submitted" do
          let(:private_calendar) { create(:group, owner: current_user) }
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              visibility: visibility, settings: { alerts: '1110001100' })
            params['slot_groups'] = [private_calendar.uuid]
            params
          }

          it "creates slot with visibility 'friends'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotFriends, :count).by 1
            expect(response).to have_http_status :created
          end

          it "set 'share_with_friends' to true" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlotFriends.last.share_with_friends).to be true
          end

          it "puts the slot into the submitted private calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(private_calendar.slots).to include StdSlot.last
          end

          it "doesn't put the slot into 'My Private Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            expect(my_private_slots.slots).not_to include StdSlot.last
          end
        end

        context "at least one public calendar submitted" do
          let!(:public_calendar) {
            create(:group, public: true, owner: current_user)
          }
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              visibility: visibility, settings: { alerts: '1110001100' })
            params['slot_groups'] = [public_calendar.uuid]
            params
          }

          it "creates slot with visibility 'public'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotPublic, :count).by 1
            expect(response).to have_http_status :created
          end

          it "set 'share_with_friends' to true" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be true
          end

          it "puts the slot into submitted public calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count)
            new_slot = StdSlotPublic.last
            expect(public_calendar.slots).to include new_slot
            expect(response).to have_http_status :created
          end

          it "doesn't put the slot into 'My Public Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            new_slot = StdSlotPublic.last
            expect(my_public_slots.slots).not_to include new_slot
          end

          it "puts the slot into 'My Private Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            new_slot = StdSlotPublic.last
            expect(my_private_slots.slots).to include new_slot
          end
        end
      end

      # not used
      describe 'foaf' do
        let(:visibility) { 'foaf' }

        it "creates slot with visibility friends-of-friends" do
          skip 'foaf not supported'
          expect {
            post "/v1/slots", valid_slot, auth_header
          }.to change(StdSlotFoaf, :count).by 1
          expect(response).to have_http_status :created
        end
      end

      describe 'public' do
        let(:visibility) { 'public' }

        it "creates slot with visibility 'public'" do
          expect {
            post "/v1/slots", valid_slot, auth_header
          }.to change(StdSlotPublic, :count).by 1
          expect(response).to have_http_status :created
        end

        context "no public calendar submitted" do
          it "puts the slot into 'My Public Slots' calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(my_public_slots.slots).to include StdSlotPublic.last
            expect(response).to have_http_status :created
          end
        end

        context "at least one public calendar submitted" do
          let!(:public_calendar) {
            create(:group, public: true, owner: current_user)
          }
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              visibility: visibility, settings: { alerts: '1110001100' })
            params['slot_groups'] = [public_calendar.uuid]
            params
          }

          it "puts the slot into submitted public calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count)
            new_slot = StdSlotPublic.last
            expect(public_calendar.slots).to include new_slot
            expect(response).to have_http_status :created
          end

          it "doesn't put the slot into 'My Public Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            new_slot = StdSlotPublic.last
            expect(my_public_slots.slots).not_to include new_slot
          end
        end
      end
    end

    context "without visibility" do
      let(:valid_slot) {
        attributes_for(:meta_slot).merge(settings: { alerts: '1110001100' })
      }

      describe "no calendar submitted" do
        context "not shared with friends" do
          it "responds with http status ok" do
            post "/v1/slots", valid_slot, auth_header
            expect(response).to have_http_status :created
          end

          it "creates slot with visibility 'private'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotPrivate, :count).by 1
          end

          it "sets 'share_with_friends' to false" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be false
          end

          it "puts the slot into 'My Private Slots' calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(my_private_slots.slots).to include StdSlotPrivate.last
          end
        end

        context "shared with friends (friend-uuid submitted)" do
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              settings: { alerts: '1110001100' })
            params['slot_groups'] = [my_friend_slots]
            params
          }

          it "responds with http status ok" do
            post "/v1/slots", valid_slot, auth_header
            expect(response).to have_http_status :created
          end

          it "creates slot with visibility 'friends'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotFriends, :count).by 1
          end

          it "sets 'share_with_friends' to true" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be true
          end

          it "puts the slot into 'My Private Slots' calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(my_private_slots.slots).to include StdSlot.last
          end
        end
      end

      describe "my schedule" do
        let(:valid_slot) { attributes_for(:meta_slot) }

        it "creates a new passengership" do
          expect {
            post "/v1/slots", valid_slot, auth_header
          }.to change(Passengership, :count).by 1
        end

        context "my_calendar_uuid submitted" do
          let(:valid_slot) {
            params = attributes_for(:meta_slot)
            params['slot_groups'] = [current_user.slot_sets['my_cal_uuid']]
            params
          }

          it "adds the slot to the users schedule" do
            post "/v1/slots", valid_slot, auth_header
            new_slot = StdSlot.last
            expect(current_user.my_calendar_slots).to include new_slot
          end
        end

        context "my_calendar_uuid not submitted" do
          it "doesn't add the slot to the users schedule" do
            post "/v1/slots", valid_slot, auth_header
            new_slot = StdSlot.last
            expect(current_user.my_calendar_slots).not_to include new_slot
          end
        end
      end

      describe "only private calendars submitted" do
        let(:valid_slot) {
          params = attributes_for(:meta_slot).merge(
            settings: { alerts: '1110001100' })
          params['slot_groups'] = [private_calendar.uuid]
          params
        }
        let!(:private_calendar) {
          create(:group, public: false, owner: current_user)
        }

        context "not shared with friends" do
          it "responds with http status ok" do
            post "/v1/slots", valid_slot, auth_header
            expect(response).to have_http_status :created
          end

          it "creates slot with visibility 'private'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotPrivate, :count).by 1
          end

          it "sets 'share_with_friends' to false" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be false
          end

          it "puts the slot into the submitted private calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(private_calendar.slots).to include StdSlotPrivate.last
          end

          it "doesn't put the slot into 'My Private Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            expect(my_private_slots.slots).not_to include StdSlotPrivate.last
          end
        end

        context "shared with friends" do
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              settings: { alerts: '1110001100' })
            params['slot_groups'] = [my_friend_slots, private_calendar.uuid]
            params
          }

          it "creates slot with visibility 'friends'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotFriends, :count).by 1
            expect(response).to have_http_status :created
          end

          it "sets 'share_with_friends' to true" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be true
          end
        end
      end

      describe "at least one public calendar submitted" do
        let(:valid_slot) {
          params = attributes_for(:meta_slot).merge(
            settings: { alerts: '1110001100' })
          params['slot_groups'] = [public_calendar.uuid]
          params
        }
        let!(:public_calendar) {
          create(:group, public: true, owner: current_user)
        }

        context "not shared with friends" do
          it "responds with http status ok" do
            post "/v1/slots", valid_slot, auth_header
            expect(response).to have_http_status :created
          end

          it "creates slot with visibility 'public'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotPublic, :count).by 1
          end

          it "sets 'share_with_friends' to false" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be false
          end

          it "puts the slot into the submitted public calendar" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(Containership, :count).by 1
            expect(public_calendar.slots).to include StdSlotPublic.last
          end

          it "doesn't put the slot into 'My Public Slots' calendar" do
            post "/v1/slots", valid_slot, auth_header
            expect(my_public_slots.slots).not_to include StdSlotPublic.last
          end
        end

        context "shared with friends" do
          let(:valid_slot) {
            params = attributes_for(:meta_slot).merge(
              settings: { alerts: '1110001100' })
            params['slot_groups'] = [my_friend_slots, public_calendar.uuid]
            params
          }

          it "creates slot with visibility 'public'" do
            expect {
              post "/v1/slots", valid_slot, auth_header
            }.to change(StdSlotPublic, :count).by 1
            expect(response).to have_http_status :created
          end

          it "sets 'share_with_friends' to true" do
            post "/v1/slots", valid_slot, auth_header
            expect(StdSlot.last.share_with_friends).to be true
          end
        end
      end
    end

    context "invalid params" do
      skip
      let(:invalid_attributes) {
        attributes_for(:meta_slot).merge(visibility: 'private')
      }
      describe "does not add a new entry to the DB" do
        it "for empty title" do
          invalid_attributes[:title] = nil
          expect {
            post "/v1/slots", invalid_attributes, auth_header
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include('title')
        end

        it "for empty start_date" do
          invalid_attributes[:start_date] = ""
          expect {
            post "/v1/slots", invalid_attributes, auth_header
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include('start_date')
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      describe "responds with Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/slots", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid start_date" do
          invalid_attributes[:start_date] = "|$%^@wer"
          post "/v1/slots", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "if start_date equals end_date" do
          slot = attributes_for(:meta_slot,
                                start_date: "2014-09-08 13:31:02",
                                end_date: "2014-09-08 13:31:02")

          post "/v1/slots", slot.merge(visibility: 'public'), auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "if start_date after end_date"  do
          slot = attributes_for(:meta_slot,
                                start_date: "2014-09-08 13:31:02",
                                end_date: "2014-07-07 13:31:02")

          post "/v1/slots", slot.merge(visibility: 'public'), auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "for empty visibility" do
          invalid_attributes[:visibility] = ""
          post "/v1/slots", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          invalid_attributes[:visibility] = "$$"
          post "/v1/slots", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'error'
        end

        it "if visibility has to much characters" do
          invalid_attributes[:visibility] = "101"
          post "/v1/slots", invalid_attributes, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'error'
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
              { start_date: "2014-07-07 13:31:02" }, auth_header
        metaslot.reload
        expect(metaslot.start_date).to eq("2014-07-07 13:31:02")
      end

      it "updates the end_date of a given metaslot" do
        metaslot.update(end_date: "2019-09-09 13:31:02")
        patch "/v1/metaslot/#{metaslot.id}",
              { end_date: "2019-12-11 13:31:02" }, auth_header
        metaslot.reload
        expect(metaslot.end_date).to eq("2019-12-11 13:31:02")
        expect(metaslot.open_end).to be false
      end

      it "sets slot to 'open End' if empty end_date" do
        metaslot.update(start_date: "2014-09-08 07:31:02")
        patch "/v1/metaslot/#{metaslot.id}", { end_date: "" }, auth_header
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
                { start_date: "" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid start_date" do
          patch "/v1/metaslot/#{metaslot.id}",
                { start_date: "|$%^@wer" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('blank')
        end

        it "for invalid end_date" do
          patch "/v1/metaslot/#{metaslot.id}",
                { end_date: "|$%^@wer" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('not a valid value')
        end

        it "if start_date equals end_date" do
          metaslot.update(start_date: "2014-09-08 13:31:02")
          patch "/v1/metaslot/#{metaslot.id}",
                { end_date: "2014-09-08 13:31:02" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end

        it "if end_date before start_date" do
          metaslot.update(start_date: "2014-09-08 13:31:02")
          patch "/v1/metaslot/#{metaslot.id}",
                { end_date: "2014-07-07 13:31:02" }, auth_header
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('start_date')
        end
      end
    end
  end

  describe "PATCH /v1/stdslot/:id" do
    let!(:std_slot) {
      create(:std_slot_private, owner: current_user, creator: current_user) }

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
                { start_date: "2014-07-07 13:31:02" }, auth_header
          std_slot.reload
          expect(std_slot.start_date).to eq("2014-07-07 13:31:02")
        end

        it "updates the visibility of a given StdSlot" do
          expect(std_slot.visibility).to eq 'private'
          patch "/v1/stdslot/#{std_slot.id}",
                { visibility: 'public' }, auth_header
          slot = BaseSlot.find std_slot.id
          expect(slot.visibility).to eq 'public'
        end

        it "updates the end_date of a given StdSlot" do
          std_slot.meta_slot.update(end_date: "2019-12-09 13:31:02")
          patch "/v1/stdslot/#{std_slot.id}",
                { end_date: "2019-12-11 13:31:02" }, auth_header
          std_slot.reload
          expect(std_slot.end_date).to eq("2019-12-11 13:31:02")
          expect(std_slot.open_end).to be false
        end

        it "sets slot to 'open End' if empty end_date" do
          std_slot.meta_slot.update(start_date: "2014-09-08 13:31:02")
          patch "/v1/stdslot/#{std_slot.id}", { end_date: "" }, auth_header
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
                   creator: current_user,
                   start_date: "2014-09-08 13:31:02",
                   end_date: "")
          end
          let(:end_date) { "2014-09-08 15:18:31" }

          it "unsets 'openEnd' if end_date is set" do
            expect(std_slot.open_end).to be true
            patch "/v1/stdslot/#{std_slot.id}", { end_date: end_date }, auth_header
            std_slot.reload
            expect(std_slot.end_date).to eq end_date
            expect(std_slot.open_end).to be false
            expect(response).to have_http_status(:ok)
          end

          # BUG: this part has a potential lack
          #          it "doesn't unset 'openEnd' if same 'open' end_date is resubmitted" do
          #            expect(std_slot.open_end).to be true
          #            expect {
          #              patch "/v1/stdslot/#{std_slot.id}",
          #                    { end_date: std_slot.end_date }, auth_header
          #            }.not_to change(std_slot, :open_end)
          #            expect(response).to have_http_status(:ok)
          #            #expect(json['openEnd']).to be true
          #            expect(json['end_date']).to be nil
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
                  { start_date: "" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('blank')
          end

          it "for invalid start_date" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { start_date: "|$%^@wer" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('blank')
          end

          it "for invalid end_date" do
            patch "/v1/stdslot/#{std_slot.id}",
                  { end_date: "|$%^@wer" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('not a valid value')
          end

          it "if start_date equals end_date" do
            std_slot.meta_slot.update(start_date: "2014-09-08 13:31:02")
            patch "/v1/stdslot/#{std_slot.id}",
                  { end_date: "2014-09-08 13:31:02" }, auth_header
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include('start_date')
          end

          it "if end_date before start_date" do
            std_slot.meta_slot.update(start_date: "2014-09-08 13:31:02")
            patch "/v1/stdslot/#{std_slot.id}",
                  { end_date: "2014-07-07 13:31:02" }, auth_header
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
        let(:std_slot) { create(:std_slot_private, :with_note, owner: current_user,
                                creator: current_user) }
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
        let(:std_slot) { create(:std_slot_private, :with_note, owner: current_user,
                                creator: current_user) }
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
        let(:std_slot) { create(:std_slot_private, :with_note, owner: current_user,
                                creator: current_user) }
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
          [{ public_id: "foo-image",
             media_type: 'image',
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
          expect(std_slot.images[0].public_id).to eq(media.first[:public_id])
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
          expect(new_media_item.public_id).to eq(media.first[:public_id])
          expect(new_media_item.position).to eq(media.first[:position].to_i)
        end

        context "missing position parameter" do
          let(:media) { [{ public_id: "foo-image", media_type: "image" }] }
          let!(:std_slot) {
            create(:std_slot_private, :with_media, owner: current_user,
                   creator: current_user)
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
          let(:media) { [{ public_id: "foo-image",
                           media_type: 'image',
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
        let(:media) { [{ position: "0", media_type: 'image' }] }

        it "returns 422 if public_id is missing" do
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
                { media_id: media_item_1.id,
                  media_type: 'image',
                  position: 2 },
                { media_id: media_item_2.id,
                  media_type: 'image',
                  position: 0 },
                { media_id: media_item_3.id,
                  media_type: 'image',
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
                  { media_id: media_item_1.id,
                    media_type: 'image',
                    position: 2 },
                  { media_id: media_item_2.id,
                    media_type: 'image',
                    position: 0 },
                  { media_id: invalid_id,
                    media_type: 'image',
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
                  { media_id: media_item_1.id,
                    media_type: 'image',
                    position: 1 },
                  { media_id: media_item_2.id,
                    media_type: 'image',
                    position: 0 },
                  { media_id: media_item_3.id,
                    media_type: 'image',
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
          [{ public_id: "foo-video",
             media_type: "video"
           }]
        end

        it "adds a new video" do
          patch "/v1/stdslot/#{std_slot.id}", { media: media }, auth_header
          std_slot.reload
          expect(std_slot.videos[0].media_type).to eq 'video'
          expect(std_slot.videos[0].position).to eq 0
          expect(std_slot.videos[0].public_id).to eq(media.first[:public_id])
        end
      end

      context "audio" do
        let(:media) do
          [{ public_id: "foo-audio",
             media_type: "audio",
             title: 'Nice sound',
             position: "1" }]
        end

        it "adds a new audio item" do
          patch "/v1/stdslot/#{std_slot.id}", { media: media }, auth_header
          std_slot.reload
          expect(std_slot.audios[0].media_type).to eq 'audio'
          expect(std_slot.audios[0].title).to eq 'Nice sound'
          expect(std_slot.audios[0].public_id).to eq(media.first[:public_id])
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
                   creator: current_user, title: 'whoa')
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
          create(:ios_location, locality: "Berlin", name: "Berlin Custom",
                 country: "Germany", longitude: 13.4113999, latitude: 52.5234051)
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
            create(:std_slot_public, :with_ios_location, owner: current_user,
                   creator: current_user) }

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

  describe "DELETE /v1/stdslot/:id" do
    let!(:std_slot) { create(:std_slot_private, owner: current_user, creator: current_user) }

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

    # context "with an invalid ID" do
    #   let(:wrong_id) { std_slot.id + 1 }

    #   it "responds with Not Found" do
    #     delete "/v1/stdslot/#{wrong_id}", {}, auth_header
    #     expect(response).to have_http_status(:not_found)
    #   end

    #   it "does not remove an entry from the DB" do
    #     expect {
    #       delete "/v1/stdslot/#{wrong_id}", {}, auth_header
    #     }.not_to change(StdSlot, :count)
    #   end
    # end
  end

  describe "POST /v1/slots/:id/slotgroups" do
    let(:slot) { create(:std_slot_public) }
    let(:group) { create(:group, owner: current_user) }

    context "normal slotgroups" do
      it "adds the slot to the given slotgroup" do
        post "/v1/slots/#{slot.id}/slotgroups",
             { slot_groups: [group.uuid] }, auth_header

        expect(group.slots).to include slot
        expect(response).to have_http_status :ok
      end
    end

    context "visibility" do
      describe "add to public slotgroups/calendars" do
        let(:slot) { create(:std_slot_private, creator: current_user) }
        let(:public_calendar) do
          group = create(:group, public: true)
          create(:membership, :active, user: current_user, group: group)
          group
        end

        it "sets the slot visibility to 'public'" do
          post "/v1/slots/#{slot.id}/slotgroups",
               { slot_groups: [public_calendar.uuid] }, auth_header
          # a bit strange, can not reload bc of STI, must pass the ID directly
          slot_id = slot.id
          slot = BaseSlot.find slot_id
          expect(slot.visibility).to eq 'public'
          expect(slot.StdSlotPublic?).to be true
          expect(slot.class).to be StdSlotPublic
          expect(response).to have_http_status :ok
        end
      end

      describe "remove from public slotgroups/calendars" do
        let(:slot) { create(:std_slot_public) }
        let(:public_calendar) do
          group = create(:group, public: true)
          create(:membership, :active, user: current_user, group: group)
          create(:containership, slot: slot, group: group)
          group
        end

        context "slot not in other public calendar" do
          it "sets the slot visibility to 'private'" do
            delete "/v1/slots/#{slot.id}/slotgroups",
                   { slot_groups: [public_calendar.uuid] }, auth_header

            # a bit strange, can not reload bc of STI, must pass the ID directly
            slot_id = slot.id
            slot = BaseSlot.find slot_id

            expect(slot.visibility).to eq 'private'
            expect(slot.StdSlotPrivate?).to be true
          end
        end

        context "slot is also in other public calendar" do
          let!(:in_other_public_calendar) {
            create(:containership, slot: slot,
                   group: create(:group, public: true))
          }
          it "keeps the slot visibility at 'public'" do
            delete "/v1/slots/#{slot.id}/slotgroups",
                   { slot_groups: [public_calendar.uuid] }, auth_header

            expect(slot.visibility).to eq 'public'
            expect(slot.StdSlotPublic?).to be true
          end
        end
      end
    end

    context "special slotsets" do
      it "adds the slot to myCalendar" do
        expect(current_user.reload.slot_sets).not_to be nil

        post "/v1/slots/#{slot.id}/slotgroups",
             { slot_groups: [current_user.slot_sets['my_cal_uuid']] },
             auth_header

        current_user.reload
        expect(current_user.my_calendar_slots).to include slot
        expect(response).to have_http_status :ok
      end

      context "mixed slotsets" do
        it "adds the slot to all slotsets" do
          expect(current_user.reload.slot_sets).not_to be nil

          post "/v1/slots/#{slot.id}/slotgroups",
               { slot_groups: [current_user.slot_sets['my_cal_uuid'],
                               group.uuid] },
               auth_header

          current_user.reload
          expect(group.slots).to include slot
          expect(current_user.my_calendar_slots).to include slot
          expect(response).to have_http_status :ok
        end
      end
    end
  end

  describe "DELETE /v1/slots/:id/slotgroups" do
    let(:group_1) { create(:group, owner: current_user) }
    let(:group_2) {
      group = create(:group)
      create(:membership, :active, group: group, user: current_user)
      group
    }
    let(:slot) {
      slot = create(:std_slot_public)
      create(:containership, group: group_1, slot: slot)
      create(:containership, group: group_2, slot: slot)
      slot
    }
    context "normal slotgroups" do
      it "removes the slot from the given slotgroups" do
        expect(group_1.slots).to include slot
        expect(group_2.slots).to include slot
        delete "/v1/slots/#{slot.id}/slotgroups",
               { slot_groups: [group_1.uuid, group_2.uuid] }, auth_header

        expect(group_1.slots).not_to include slot
        expect(group_2.slots).not_to include slot
        expect(response).to have_http_status :ok
      end
    end

    context "special slotsets" do
      let!(:passengership) {
        create(:passengership, slot: slot, user: current_user)
      }
      it "removes the slot from myCalendar" do
        expect(current_user.reload.slot_sets).not_to be nil
        expect(current_user.my_calendar_slots).to include slot

        delete "/v1/slots/#{slot.id}/slotgroups",
               { slot_groups: [current_user.slot_sets['my_cal_uuid']] },
               auth_header

        current_user.reload
        expect(current_user.my_calendar_slots).not_to include slot
        expect(response).to have_http_status :ok
      end
    end

    context "mixed slotsets" do
      let!(:passengership) {
        create(:passengership, slot: slot, user: current_user)
      }
      it "removes the slot from myCalendar" do
        expect(current_user.reload.slot_sets).not_to be nil
        expect(current_user.my_calendar_slots).to include slot
        expect(group_1.slots).to include slot
        expect(group_2.slots).to include slot

        delete "/v1/slots/#{slot.id}/slotgroups",
               { slot_groups: [group_1.uuid,
                               current_user.slot_sets['my_cal_uuid'],
                               group_2.uuid] },
               auth_header

        current_user.reload
        expect(current_user.my_calendar_slots).not_to include slot
        expect(group_1.slots).not_to include slot
        expect(group_2.slots).not_to include slot
        expect(response).to have_http_status :ok
      end
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
        expect(std_slot.likes.count).to eq std_slot.likes_count
        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.not_to raise_error
        expect(std_slot.likes.count).to eq std_slot.likes_count
      end

      it "re-like slot which was unliked" do
        like = create(:like, user: current_user, slot: std_slot,
                      deleted_at: Time.zone.now)
        # must manually decrement here
        BaseSlot.decrement_counter(:likes_count, std_slot.id)

        expect(like.deleted_at).not_to be nil
        std_slot.reload
        expect(std_slot.likes.count).to eq std_slot.likes_count

        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.not_to change(Like, :count)

        like.reload
        expect(like.deleted_at).to be nil
        std_slot.reload
        expect(std_slot.likes.count).to eq std_slot.likes_count

        expect {
          post "/v1/slots/#{std_slot.id}/like", {}, auth_header
        }.not_to raise_error
        expect(std_slot.likes.count).to eq std_slot.likes_count
      end
    end
  end

  describe "DELETE /v1/slots/:id/like" do
    context "StdSlot" do
      let(:std_slot) { create(:std_slot_public) }
      let!(:like) { create(:like, user: current_user, slot: std_slot) }

      it "sets deleted_at on the like" do
        expect(std_slot.likes.count).to eq 1
        expect(std_slot.likes_count).to eq 1

        delete "/v1/slots/#{std_slot.id}/like", {}, auth_header

        expect(response).to have_http_status :ok
        like.reload
        expect(like.deleted_at?).to be true
        std_slot.reload
        expect(std_slot.likes.count).to eq 0
        expect(std_slot.likes_count).to eq 0
      end

      it "is idempotent" do
        delete "/v1/slots/#{std_slot.id}/like", {}, auth_header
        expect(response).to have_http_status :ok
        delete "/v1/slots/#{std_slot.id}/like", {}, auth_header
        expect(response).to have_http_status :ok
      end
    end
  end

  describe "GET /v1/slots/1/likes" do
    let(:slot) { create(:std_slot_public, :with_likes) }

    it "retrieves a list of all likes with user details" do
      get "/v1/slots/#{slot.id}/likes", {}, auth_header
      expect(json.count).to eq slot.likes.count
    end
  end

  describe "POST /v1/slots/:id/comment" do
    let(:slot) { create(:std_slot_public) }
    let(:new_comment) { { content: "Liebe ist ein Kind der Freiheit" } }

    it "creates a new comment" do
      expect {
        post "/v1/slots/#{slot.id}/comment", new_comment, auth_header
      }.to change(Comment, :count).by 1
    end

    it "adds the new comment to the parent slot" do
      post "/v1/slots/#{slot.id}/comment", new_comment, auth_header
      expect(Comment.last.slot.id).to eq slot.id
      expect(Comment.last.content).to eq new_comment[:content]
    end
  end
end
