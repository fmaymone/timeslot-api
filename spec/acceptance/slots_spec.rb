require 'documentation_helper'

resource "Slots" do
  let(:json) { JSON.parse(response_body) }

  get "/v1/slots" do
    header "Accept", "application/json"

    let!(:current_user) { create(:user) }

    let(:metas) { create_list(:meta_slot, 2, creator: current_user) }
    let!(:std_slot_1) {
      create(:std_slot, meta_slot: metas[0], owner: current_user) }
    let!(:std_slot_2) {
      create(:std_slot, meta_slot: metas[1], owner: current_user) }
    let!(:re_slots) { create_list(:re_slot, 4, slotter: current_user) }

    let(:groups) { create_list(:group, 2) }
    let!(:memberships) {
      create(:membership, group: groups[0], user: current_user)
      create(:membership, group: groups[1], user: current_user) }
    let!(:group_slots_1) { create_list(:group_slot, 3, group: groups[0]) }
    let!(:group_slots_2) { create_list(:group_slot, 2, group: groups[1]) }

    describe "Get all slots for current user" do

      response_field :id, "ID of the slot"
      response_field :title, "Title of the slot"
      response_field :stardate, "Startdate of the slot"
      response_field :enddate, "Enddate of the slot"
      response_field :creatorId, "ID of the User who created the slot"
      # response_field :alerts, "Alerts for the slot"
      response_field :note, "A Note on the slot"
      response_field :visibility, "Visibility if it's a StandardSlot"
      response_field :groupId, "ID of belonging Group if it's a GroupSlot"
      response_field :createdAt, "Creation datetime of the slot"
      response_field :updatedAt, "Last update of the slot"
      response_field :deletedAt, "Deletion datetime of the slot"

      example "Get all slots for current user", document: :v1 do
        explanation "Returns an array which includes StandardSlots," \
                    " ReSlots & GroupSlots"
        do_request

        expect(response_status).to eq(200)
        expect(json)
          .to include("id" => std_slot_1.id,
                      "title" => std_slot_1.title,
                      "creatorId" => std_slot_1.creator.id,
                      "startdate" => std_slot_1.startdate.iso8601,
                      "enddate" => std_slot_1.enddate.iso8601,
                      "note" => std_slot_1.note,
                      "visibility" => std_slot_1.visibility,
                      "createdAt" => std_slot_1.created_at.iso8601,
                      "updatedAt" => std_slot_1.updated_at.iso8601,
                      "deletedAt" => std_slot_1.deleted_at
                     )
        expect(json)
          .to include("id" => std_slot_2.id,
                      "title" => std_slot_2.title,
                      "creatorId" => std_slot_2.creator.id,
                      "startdate" => std_slot_2.startdate.iso8601,
                      "enddate" => std_slot_2.enddate.iso8601,
                      "note" => std_slot_2.note,
                      "visibility" => std_slot_2.visibility,
                      "createdAt" => std_slot_2.created_at.iso8601,
                      "updatedAt" => std_slot_2.updated_at.iso8601,
                      "deletedAt" => std_slot_2.deleted_at
                     )
        expect(json)
          .to include("id" => re_slots[0].id,
                      "title" => re_slots[0].title,
                      "creatorId" => re_slots[0].creator.id,
                      "startdate" => re_slots[0].startdate.iso8601,
                      "enddate" => re_slots[0].enddate.iso8601,
                      "note" => re_slots[0].note,
                      "createdAt" => re_slots[0].created_at.iso8601,
                      "updatedAt" => re_slots[0].updated_at.iso8601,
                      "deletedAt" => re_slots[0].deleted_at
                     )
        expect(json)
          .to include("id" => group_slots_1[0].id,
                      "title" => group_slots_1[0].title,
                      "creatorId" => group_slots_1[0].creator.id,
                      "startdate" => group_slots_1[0].startdate.iso8601,
                      "enddate" => group_slots_1[0].enddate.iso8601,
                      "note" => group_slots_1[0].note,
                      "groupId" => group_slots_1[0].group.id,
                      "createdAt" => group_slots_1[0].created_at.iso8601,
                      "updatedAt" => group_slots_1[0].updated_at.iso8601,
                      "deletedAt" => group_slots_1[0].deleted_at
                     )
      end
    end
  end

  get "/v1/slots/:id" do
    header "Accept", "application/json"

    parameter :id, "ID of the slot to get", required: true

    describe "Get slot with valid ID" do

      response_field :id, "ID of the slot"
      response_field :title, "Title of the slot"
      response_field :startdate, "Startdate of the slot"
      response_field :enddate, "Enddate of the slot"
      response_field :note, "A note on the slot"
      response_field :visibility, "Visibiltiy of the slot"
      response_field :media, "Media Items of the slot"
      response_field :createdAt, "Creation of slot"
      response_field :updatedAt, "Latest update of slot in db"

      let(:slot) { create(:std_slot) }
      let(:id) { slot.id }
      let(:deleted_at) { slot.deleted_at.nil? ? nil : group.deleted_at.iso8601 }

      example "Get slot returns slot data", document: :v1 do
        explanation "returns 404 if ID is invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json.except("media"))
          .to eq("id" => slot.id,
                 "title" => slot.title,
                 "startdate" => slot.startdate.iso8601,
                 "enddate" => slot.enddate.iso8601,
                 "creatorId" => slot.creator.id,
                 "note" => slot.note,
                 "visibility" => slot.visibility,
                 "createdAt" => slot.created_at.iso8601,
                 "updatedAt" => slot.updated_at.iso8601,
                 "deletedAt" => deleted_at
                )
        # expect(json["media"].length).to eq(slot.media_items.length)
      end
    end

    describe "Get slot with invalid ID" do
      let(:id) { 1 }

      example "Get slot with invalid ID returns not found", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  post "/v1/stdslot" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :title, "Title of slot (max. 48 characters)",
              required: true,
              scope: :new_slot
    parameter :startdate,
              "Startdate and Time of the Slot",
              required: true,
              scope: :new_slot
    parameter :enddate,
              "Enddate and Time of the Slot (startdate + duration)",
              required: true,
              scope: :new_slot
    parameter :note, "A note which belongs to the Slot", scope: :new_slot
    parameter :alerts, "Alerts for the Slot", scope: :new_slot

    let!(:current_user) { create(:user) }

    describe "Create new standard slot" do

      parameter :visibility, "Visibility of the Slot",
                required: true, scope: :new_slot

      response_field :id, "ID of the new slot"
      response_field :title, "Title of the new slot"
      response_field :stardate, "Startdate of the new slot"
      response_field :enddate, "Enddate of the new slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :alerts, "Alerts for the slot"
      response_field :note, "A Note on the slot"
      response_field :visibility, "Visibility of the slot"
      response_field :createdAt, "Creation datetime of the slot"
      response_field :updatedAt, "Last update of the slot"
      response_field :deletedAt, "Deletion datetime of the slot"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:enddate) { "2014-09-13T22:03:24.000Z" }
      let(:note) { "revolutionizing the calendar" }
      let(:alerts) { '0101010101' }
      let(:visibility) { 10 }

      example "Create StandardSlot",
              document: :v1 do
        explanation "Returns data of new slot.\n\n" \
                    "Missing unrequiered fields will be filled" \
                    " with default values.\n\n" \
                    "returns 422 if parameters are invalid\n\n" \
                    "returns 422 if required parameters are missing"
        do_request

        expect(json).to have_key("id")
        expect(json).to have_key("title")
        expect(json).to have_key("startdate")
        expect(json).to have_key("enddate")
        expect(json).to have_key("creatorId")
        expect(json).to have_key("note")
        expect(json).to have_key("visibility")
        expect(response_status).to eq(201)
      end
    end

    describe "Create std slot with invalid params" do

      parameter :visibility, "Visibility of the Slot",
                required: true, scope: :new_slot

      response_field :pgerror, "Explanation which param couldn't be saved"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:enddate) { "2014-09-10T13:31:02.000Z" }
      let(:visibility) { '10' }
      let(:alerts) { "oh no" }

      example "Create std slot with invalid params returns 422 & failure details",
              document: false do
        explanation "Parameters that can not be written to db will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("pgerror")
      end
    end

    describe "Create std slot with missing requiered params" do

      parameter :visibility, "Visibility of the Slot",
                required: true, scope: :new_slot

      response_field :enddate, "The missing parameter"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:visibility) { 10 }

      example "Create std slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("enddate")
      end
    end
  end

  post "/v1/groupslot" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :title, "Title of slot (max. 48 characters)",
              required: true,
              scope: :new_slot
    parameter :startdate,
              "Startdate and Time of the Slot",
              required: true,
              scope: :new_slot
    parameter :enddate,
              "Enddate and Time of the Slot (startdate + duration)",
              required: true,
              scope: :new_slot
    parameter :groupId, "Group ID if GroupSlot",
              required: true,
              scope: :new_slot
    parameter :note, "A note which belongs to the Slot",
              scope: :new_slot
    parameter :alerts, "Alerts for the Slot",
              scope: :new_slot

    let!(:current_user) { create(:user) }
    let(:group) { create(:group) }

    describe "Create new group slot" do

      response_field :id, "ID of the new slot"
      response_field :title, "Title of the new slot"
      response_field :stardate, "Startdate of the new slot"
      response_field :enddate, "Enddate of the new slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :alerts, "Alerts for the slot"
      response_field :note, "A Note on the slot"
      response_field :groupId, "ID of the group the slot belongs to"
      response_field :createdAt, "Creation datetime of the slot"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:enddate) { "2014-09-13T22:03:24.000Z" }
      let(:note) { "revolutionizing the calendar" }
      let(:alerts) { '0101010101' }
      let(:groupId) { group.id }

      example "Create GroupSlot",
              document: :v1 do
        explanation "Returns data of new slot.\n\n" \
                    "Missing unrequiered fields will be filled" \
                    " with default values.\n\n" \
                    "returns 404 if Group ID is invalid\n\n" \
                    "returns 422 if parameters are invalid\n\n" \
                    "returns 422 if required parameters are missing"
        do_request

        expect(json).to have_key("id")
        expect(json).to have_key("title")
        expect(json).to have_key("startdate")
        expect(json).to have_key("enddate")
        expect(json).to have_key("creatorId")
        expect(json).to have_key("note")
        expect(json).to have_key("groupId")
        expect(response_status).to eq(201)
      end
    end

    describe "Create group slot with invalid params" do

      response_field :pgerror, "Explanation which param couldn't be saved"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:enddate) { "2014-09-10T13:31:02.000Z" }
      let(:alerts) { "oh no" }
      let(:groupId) { group.id }

      example "Create group slot with invalid params returns 422 & failure details",
              document: false do
        explanation "Parameters that can not be written to db will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("pgerror")
      end
    end

    describe "Create group slot with missing requiered params" do

      response_field :enddate, "The missing parameter"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:groupId) { group.id }

      example "Create group slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("enddate")
      end
    end
  end

  post "/v1/reslot" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :predecessorId,
              "ID of the Slot which was resloted",
              required: true,
              scope: :re_slot
    parameter :predecessorType,
              "Type of the Slot which was resloted (StdSlot/GroupSlot/ReSlot)",
              required: true,
              scope: :re_slot

    let!(:current_user) { create(:user) }
    let(:pred) { create(:std_slot) }

    describe "Reslot a StandardSlot" do

      response_field :id, "ID of the new slot"
      response_field :title, "Title of the slot"
      response_field :stardate, "Startdate of the slot"
      response_field :enddate, "Enddate of the slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :slotterId, "ID of the User who did reslot"
      response_field :note, "A Note on the slot"
      response_field :createdAt, "Creation datetime of the slot"
      response_field :updatedAt, "Last update of the slot"
      response_field :deletedAt, "Deletion datetime of the slot"

      let(:predecessorId) { pred.id }
      let(:predecessorType) { pred.class.model_name.param_key }
      let(:note) { "re-revolutionizing the calendar" }

      example "Reslot a slot",
              document: :v1 do
        explanation "Returns data of new ReSlot.\n\n" \
                    "returns 404 if Predecessor Slot doesn't exist\n\n" \
                    "returns 422 if parameters are invalid\n\n" \
                    "returns 422 if required parameters are missing"
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key("id")
        expect(json).to have_key("title")
        expect(json).to have_key("startdate")
        expect(json).to have_key("enddate")
        expect(json).to have_key("creatorId")
        expect(json).to have_key("slotterId")
        expect(json["title"]).to eq pred.title
        expect(json["startdate"]).to eq pred.startdate.iso8601
        expect(json["creatorId"]).to eq pred.creator.id
        expect(json["slotterId"]).to eq current_user.id
      end
    end
  end

  patch "/v1/metaslot/:id" do
    header "Content-Type", "application/json"

    parameter :id, "ID of the slot to update", required: true

    describe "Update an existing MetaSlot" do

      parameter :title, "Updated title of slot", scope: :metaSlot
      parameter :startdate, "Updated Startdate and Time of the Slot",
                scope: :metaSlot
      parameter :enddate,
                "Updated Enddate and Time of the Slot (startdate + duration)",
                scope: :metaSlot

      let!(:meta_slot) { create(:meta_slot) }
      let(:id) { meta_slot.id }
      let(:title) { "New title for a Slot" }

      example "Update MetaSlot", document: :v1 do
        explanation "Update content of MetaSlot.\n\n" \
                    "User must be creator of MetaSlot.\n\n" \
                    "returns 404 User not creator of ID is invalid\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(204)
        expect(response_body).to eq("")
        expect(MetaSlot.last.title).to eq title
      end
    end

    describe "Adding media items to existing slot" do

      parameter :new_media, "Scope for attributes of new media item",
                required: true
      parameter :media_type, "Type of media (image/video/voice)",
                required: true,
                scope: :new_media
      parameter :publicId, "Cloudinary ID / URL",
                required: true,
                scope: :new_media
      parameter :ordering, "Order of the new media item." \
                           " If not submitted it will be added at the end",
                scope: :new_media

      response_field :mediaItemId, "Timeslot internal ID for this media item"

      let!(:slot) { create(:meta_slot) }
      let(:id) { slot.id }
      let(:media_type) { "image" }
      let(:publicId) { "v1234567/dfhjghjkdisudgfds7iyf.jpg" }
      let(:ordering) { "1" }

      example "Adding media items to existing slot returns ID & status created",
              document: :v1 do
        skip "No more media items here"
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary client updates the slot with the image" \
                    " information."
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key("mediaItemId")
        expect(MetaSlot.last.media_items.size).to eq(1)
      end
    end

    describe "Reordering media data of existing slot" do

      parameter :media_type, "Type of media (image/video/voice)",
                required: true
      parameter :ordering_media, "Array with mediaItemIds and ordering",
                required: true
      parameter :mediaItemId, "Timeslot's internal ID for this media item",
                required: true,
                scope: :ordering_media
      parameter :ordering, "Order of the image (ignored for video/voice)",
                required: true,
                scope: :ordering_media

      let!(:slot) { create(:meta_slot) }
      let!(:media_item_1) { create(:slot_image, mediable: slot, ordering: 0) }
      let!(:media_item_2) { create(:slot_image, mediable: slot, ordering: 1) }
      let!(:media_item_3) { create(:slot_image, mediable: slot, ordering: 2) }

      let(:id) { slot.id }
      let(:media_reordering) do
        { media_type: "image",
          ordering_media: [
            { mediaItemId: media_item_1.id,
              ordering: 2 },
            { mediaItemId: media_item_2.id,
              ordering: 0 },
            { mediaItemId: media_item_3.id,
              ordering: 1 }
          ] }
      end
      let(:raw_post) { media_reordering.to_json }

      example "Reordering media data of existing slot returns success",
              document: :v1 do
        skip "No more media items here"
        explanation "An array with the media_items keys and corresponding" \
                    " ordering number (starting from 0) for all images " \
                    " of the slot must be send."
        do_request

        expect(response_status).to eq(200)
        expect(slot.media_items.find(media_item_1.id).ordering).to eq(2)
        expect(slot.media_items.find(media_item_2.id).ordering).to eq(0)
        expect(slot.media_items.find(media_item_3.id).ordering).to eq(1)
      end
    end
  end

  delete "/v1/stdslot/:id" do
    parameter :id, "ID of the Standard Slot to delete", required: true

    let!(:current_user) { create(:user) }
    let!(:std_slot) { create(:std_slot, owner: current_user) }

    describe "Delete Standard Slot" do
      let(:id) { std_slot.id }

      example "Delete StandardSlot", document: :v1 do
        explanation "Sets 'deletedAt', returns updated Standard Slot data." \
                    " Doesn't delete anything.\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        std_slot.reload
        expect(std_slot.deleted_at?).to be true
        expect(response_status).to eq(200)
        expect(json).to include("id" => std_slot.id,
                                "title" => std_slot.title,
                                "creatorId" => std_slot.creator.id,
                                "startdate" => std_slot.startdate.iso8601,
                                "enddate" => std_slot.enddate.iso8601,
                                "note" => std_slot.note,
                                "visibility" => std_slot.visibility,
                                "createdAt" => std_slot.created_at.iso8601,
                                "updatedAt" => std_slot.updated_at.iso8601,
                                "deletedAt" => std_slot.deleted_at.iso8601
                               )
      end
    end

    describe "Delete StdSlot with invalid ID" do
      let(:id) { std_slot.id + 1 }

      example "Delete StdSlot with invalid ID returns Not found",
              document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  delete "/v1/groupslot/:id" do
    parameter :id, "ID of the Group Slot to delete", required: true

    let!(:current_user) { create(:user) }
    let(:group) { create(:group) }
    let!(:membership) { create(:membership, group: group, user: current_user) }
    let!(:group_slot) { create(:group_slot, group: group) }

    describe "Delete Group Slot" do
      let(:id) { group_slot.id }

      example "Delete GroupSlot", document: :v1 do
        explanation "Sets 'deletedAt', returns updated Group Slot data." \
                    " Doesn't delete anything.\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        group_slot.reload
        expect(group_slot.deleted_at?).to be true
        expect(response_status).to eq(200)
        expect(json).to include("id" => group_slot.id,
                                "title" => group_slot.title,
                                "creatorId" => group_slot.creator.id,
                                "startdate" => group_slot.startdate.iso8601,
                                "enddate" => group_slot.enddate.iso8601,
                                "note" => group_slot.note,
                                "groupId" => group_slot.group.id,
                                "createdAt" => group_slot.created_at.iso8601,
                                "updatedAt" => group_slot.updated_at.iso8601,
                                "deletedAt" => group_slot.deleted_at.iso8601
                               )
      end
    end

    describe "Delete GroupSlot with invalid ID" do
      let(:id) { group_slot.id + 1 }

      example "Delete GroupSlot with invalid ID returns Not found",
              document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  delete "/v1/reslot/:id" do
    parameter :id, "ID of the ReSlot to delete", required: true

    let!(:current_user) { create(:user) }
    let!(:re_slot) { create(:re_slot, slotter: current_user) }

    describe "Delete ReSlot" do
      let(:id) { re_slot.id }

      example "Delete ReSlot", document: :v1 do
        explanation "Sets 'deletedAt', returns updated reslot data." \
                    " Doesn't delete anything.\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        re_slot.reload
        expect(re_slot.deleted_at?).to be true
        expect(response_status).to eq(200)
        expect(json).to eq("id" => re_slot.id,
                           "title" => re_slot.title,
                           "creatorId" => re_slot.creator.id,
                           "startdate" => re_slot.startdate.iso8601,
                           "enddate" => re_slot.enddate.iso8601,
                           "note" => re_slot.note,
                           "slotterId" => re_slot.slotter.id,
                           "createdAt" => re_slot.created_at.iso8601,
                           "updatedAt" => re_slot.updated_at.iso8601,
                           "deletedAt" => re_slot.deleted_at.iso8601
                          )
      end
    end

    describe "Delete ReSlot with invalid ID" do
      let(:id) { re_slot.id + 1 }

      example "Delete ReSlot with invalid ID returns Not found",
              document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end
end
