require 'documentation_helper'

resource "Slots" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  get "/v1/slots" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    let(:metas) { create_list(:meta_slot, 2, creator: current_user) }
    let!(:std_slot_1) {
      create(:std_slot, meta_slot: metas[0], owner: current_user) }
    let!(:std_slot_2) {
      create(:std_slot, meta_slot: metas[1], owner: current_user) }
    let!(:re_slots) {
      create_list(:re_slot, 4, :with_likes, slotter: current_user) }

    let(:groups) { create_list(:group, 2) }
    let!(:memberships) {
      create(:membership, group: groups[0], user: current_user)
      create(:membership, group: groups[1], user: current_user) }
    let!(:group_slots_1) { create_list(:group_slot, 3, group: groups[0]) }
    let!(:group_slots_2) { create_list(:group_slot, 2, group: groups[1]) }

    describe "Get all slots for current user" do

      response_field :id, "ID of the slot"
      response_field :title, "Title of the slot"
      response_field :startDate, "Startdate of the slot"
      response_field :endDate, "Enddate of the slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :alerts, "Alerts for the slot for the current user"
      response_field :notes, "A list of all notes on the slot"
      response_field :likes, "Number of likes for the slot"
      response_field :media, "Media Items for the slot"
      response_field :url, "direct url to fetch the slot"
      response_field :visibility, "Visibility if it's a StandardSlot"
      response_field :groupId, "ID of belonging Group if it's a GroupSlot"
      response_field :createdAt, "Creation datetime of the slot"
      response_field :updatedAt, "Last update of the slot"
      response_field :deletedAt, "Deletion datetime of the slot"

      example "Get all slots for current user", document: :v1 do
        explanation "Returns an array which includes StandardSlots," \
                    " ReSlots & GroupSlots\n\n" \
                    "If a user is authenticated the slot settings" \
                    " (alerts) will be included."
        do_request

        expect(response_status).to eq(200)
        slot_count = current_user.std_slots.count +
                     current_user.group_slots.count +
                     current_user.re_slots.count
        expect(json.length).to eq slot_count
        expect(json.first).to have_key("id")
        expect(json.first).to have_key("title")
        expect(json.first).to have_key("locationId")
        expect(json.first).to have_key("startDate")
        expect(json.first).to have_key("endDate")
        expect(json.first).to have_key("settings")
        expect(json.first).to have_key("createdAt")
        expect(json.first).to have_key("updatedAt")
        expect(json.first).to have_key("deletedAt")
        expect(json.first).to have_key("creatorId")
        expect(json.first).to have_key("notes")
        expect(json.first).to have_key("likes")
        expect(json.first).to have_key("visibility")
        expect(json.first).to have_key("media")
        expect(json.first).to have_key("url")
        expect(json)
          .to include("id" => std_slot_1.id,
                      "title" => std_slot_1.title,
                      "locationId" => std_slot_1.location_id,
                      "startDate" => std_slot_1.start_date.as_json,
                      "endDate" => std_slot_1.end_date.as_json,
                      "createdAt" => std_slot_1.created_at.as_json,
                      "updatedAt" => std_slot_1.updated_at.as_json,
                      "deletedAt" => std_slot_1.deleted_at,
                      "settings" => {
                        'alerts' => current_user.alerts(std_slot_1) },
                      "notes" => std_slot_1.notes,
                      "likes" => std_slot_1.likes.count,
                      "media" => std_slot_1.media_items,
                      "visibility" => std_slot_1.visibility,
                      "url" => v1_slot_url(std_slot_1, format: :json),
                      "creatorId" => std_slot_1.creator.id
                     )
        expect(json)
          .to include("id" => std_slot_2.id,
                      "title" => std_slot_2.title,
                      "locationId" => std_slot_2.location_id,
                      "startDate" => std_slot_2.start_date.as_json,
                      "endDate" => std_slot_2.end_date.as_json,
                      "settings" => {
                        'alerts' => current_user.alerts(std_slot_2) },
                      "createdAt" => std_slot_2.created_at.as_json,
                      "updatedAt" => std_slot_2.updated_at.as_json,
                      "deletedAt" => std_slot_2.deleted_at,
                      "notes" => std_slot_2.notes,
                      "likes" => std_slot_2.likes.count,
                      "media" => std_slot_2.media_items,
                      "visibility" => std_slot_2.visibility,
                      "url" => v1_slot_url(std_slot_2, format: :json),
                      "creatorId" => std_slot_2.creator.id
                     )
        expect(json)
          .to include("id" => re_slots[0].id,
                      "title" => re_slots[0].title,
                      "locationId" => re_slots[0].location_id,
                      "startDate" => re_slots[0].start_date.as_json,
                      "endDate" => re_slots[0].end_date.as_json,
                      "settings" => {
                        'alerts' => current_user.alerts(re_slots[0]) },
                      "createdAt" => re_slots[0].created_at.as_json,
                      "updatedAt" => re_slots[0].updated_at.as_json,
                      "deletedAt" => re_slots[0].deleted_at,
                      "notes" => re_slots[0].notes,
                      "likes" => re_slots[0].likes.count,
                      "media" => re_slots[0].media_items,
                      "url" => v1_slot_url(re_slots[0], format: :json),
                      "creatorId" => re_slots[0].creator.id
                     )
        expect(json)
          .to include("id" => group_slots_1[0].id,
                      "title" => group_slots_1[0].title,
                      "locationId" => group_slots_1[0].location_id,
                      "startDate" => group_slots_1[0].start_date.as_json,
                      "endDate" => group_slots_1[0].end_date.as_json,
                      "settings" => {
                        'alerts' => current_user.alerts(group_slots_1[0]) },
                      "groupId" => group_slots_1[0].group.id,
                      "createdAt" => group_slots_1[0].created_at.as_json,
                      "updatedAt" => group_slots_1[0].updated_at.as_json,
                      "deletedAt" => group_slots_1[0].deleted_at,
                      "notes" => group_slots_1[0].notes,
                      "likes" => group_slots_1[0].likes.count,
                      "media" => group_slots_1[0].media_items,
                      "url" => v1_slot_url(group_slots_1[0], format: :json),
                      "creatorId" => group_slots_1[0].creator.id
                     )
      end
    end
  end

  post "/v1/slots" do
    header "Accept", "application/json"

    parameter :ids, "Array of slot IDs to get", required: true

    describe "Get several slots at once" do

      response_field :id, "ID of the slot"
      response_field :title, "Title of the slot"
      response_field :startDate, "Startdate of the slot"
      response_field :endDate, "Enddate of the slot"
      response_field :createdAt, "Creation of slot"
      response_field :updatedAt, "Latest update of slot in db"
      response_field :deletedAt, "Delete date of slot or nil"
      response_field :location, "Location data for the slot"
      response_field :creator, "User who created the slot"
      response_field :settings, "User specific settings for the slot (alerts)"
      response_field :visibility, "Visibiltiy of the slot"
      response_field :notes, "Notes on the slot"
      response_field :likes, "Counter for likes of the slot"
      response_field :images, "Images for the slot"
      response_field :voices, "Voice recordings for the slot"
      response_field :videos, "Videos recordings for the slot"

      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253) }
      let(:slot1) { create(:std_slot, :with_media) }
      let(:slot2) { create(:std_slot, :with_media, meta_slot: meta_slot) }
      let!(:slot_setting) { create(:slot_setting,
                                   user: current_user,
                                   meta_slot: slot2.meta_slot,
                                   alerts: '1110001100') }
      let!(:medias) {
        create_list :slot_image, 3, mediable: slot2
        create_list :voice, 2, mediable: slot2
        create_list :video, 2, mediable: slot2
      }
      let(:raw_post) do
        { ids: [slot1.id, slot2.id] }
      end

      let(:deleted_at) { slot.deleted_at? ? slot.deleted_at.as_json : nil }

      example "Get several slots returns slot data", document: :v1 do
        explanation "if a user is authenticated the slot settings" \
                    " (alerts) will be included\n\n" \
                    "returns 404 if an ID is invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to eq 2
        expect(json.last).to have_key("id")
        expect(json.last["id"]).to eq slot2.id
        expect(json.last).to have_key("title")
        expect(json.last).to have_key("startDate")
        expect(json.last).to have_key("endDate")
        expect(json.last).to have_key("locationId")
        # expect(json.last['location']).to have_key("name")
        expect(json.last).to have_key("creatorId")
        # expect(json.last['creator']).to have_key("username")
        # expect(json.last).to have_key("settings")
        # expect(json.last['settings']).to have_key("alerts")
        expect(json.last).to have_key("createdAt")
        expect(json.last).to have_key("updatedAt")
        expect(json.last).to have_key("deletedAt")
        expect(json.last).to have_key("notes")
        expect(json.last).to have_key("likes")
        expect(json.last).to have_key("visibility")
        # expect(json.last).to have_key("photos")
        # expect(json.last).to have_key("voices")
        # expect(json.last).to have_key("videos")
        # expect(json.last.except('photos', 'voices', 'videos'))
        #   .to eq("id" => slot.id,
        #          "title" => slot.title,
        #          "startDate" => slot.start_date.as_json,
        #          "endDate" => slot.end_date.as_json,
        #          "createdAt" => slot.created_at.as_json,
        #          "updatedAt" => slot.updated_at.as_json,
        #          "deletedAt" => deleted_at,
        #          "location" => { "id" => 200_719_253,
        #                          "name" => slot.location.name,
        #                          "street" => slot.location.street,
        #                          "city" => slot.location.city,
        #                          "postcode" => slot.location.postcode,
        #                          "country" => slot.location.country,
        #                          "longitude" => slot.location.longitude,
        #                          "latitude" => slot.location.latitude,
        #                          "createdAt" => slot.location.created.as_json,
        #                          "updatedAt" => slot.location.last_update.as_json,
        #                          "categories" => slot.location.categories,
        #                          "images" => slot.location.images
        #                        },
        #          "creator" => { "id" => slot.creator.id,
        #                         "username" => slot.creator.username,
        #                         "createdAt" => slot.creator.created_at.as_json,
        #                         "updatedAt" => slot.creator.updated_at.as_json,
        #                         "deletedAt" => nil },
        #          # "settings" => { 'alerts' => '1110001100' },
        #          "visibility" => slot.visibility,
        #          "notes" => slot.notes
        #         )
        # expect(json.last["photos"].length).to eq(slot.photos.length)
        # expect(json.last["photos"].first['clyid']).to eq(slot.photos.first.public_id)
      end
    end
  end

  get "/v1/slots/:id", :vcr do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the slot to get", required: true

    describe "Get slot with valid ID" do

      response_field :id, "ID of the slot"
      response_field :title, "Title of the slot"
      response_field :startDate, "Startdate of the slot"
      response_field :endDate, "Enddate of the slot"
      response_field :createdAt, "Creation of slot"
      response_field :updatedAt, "Latest update of slot in db"
      response_field :deletedAt, "Delete date of slot or nil"
      response_field :location, "Location data for the slot"
      response_field :creator, "User who created the slot"
      response_field :settings, "User specific settings for the slot (alerts)"
      response_field :visibility, "Visibiltiy of the slot"
      response_field :notes, "Notes on the slot"
      response_field :likes, "Likes for the slot"
      response_field :images, "Images for the slot"
      response_field :voices, "Voice recordings for the slot"
      response_field :videos, "Videos recordings for the slot"

      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253) }
      let(:slot) { create(:std_slot, :with_media, :with_likes,
                          meta_slot: meta_slot, share_id: 'abcd1234') }

      let!(:slot_setting) { create(:slot_setting,
                                   user: current_user,
                                   meta_slot: slot.meta_slot,
                                   alerts: '1110001100') }
      let!(:medias) {
        create_list :slot_image, 3, mediable: slot
        create_list :voice, 2, mediable: slot
        create_list :video, 2, mediable: slot
      }
      let(:id) { slot.id }
      let(:deleted_at) { slot.deleted_at? ? slot.deleted_at.as_json : nil }

      example "Get slot returns slot data", document: :v1 do
        explanation "if a user is authenticated the slot settings" \
                    " (alerts) will be included\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("id")
        expect(json).to have_key("title")
        expect(json).to have_key("startDate")
        expect(json).to have_key("endDate")
        expect(json).to have_key("location")
        expect(json['location']).to have_key("name")
        expect(json).to have_key("creator")
        expect(json['creator']).to have_key("username")
        expect(json).to have_key("settings")
        expect(json['settings']).to have_key("alerts")
        expect(json).to have_key("createdAt")
        expect(json).to have_key("updatedAt")
        expect(json).to have_key("deletedAt")
        expect(json).to have_key("notes")
        expect(json).to have_key("likes")
        expect(json).to have_key("shareUrl")
        expect(json).to have_key("visibility")
        expect(json).to have_key("photos")
        expect(json).to have_key("voices")
        expect(json).to have_key("videos")
        expect(json.except('photos', 'voices', 'videos', 'shareUrl'))
          .to eq("id" => slot.id,
                 "title" => slot.title,
                 "startDate" => slot.start_date.as_json,
                 "endDate" => slot.end_date.as_json,
                 "createdAt" => slot.created_at.as_json,
                 "updatedAt" => slot.updated_at.as_json,
                 "deletedAt" => deleted_at,
                 "location" => { "id" => 200_719_253,
                                 "name" => slot.location.name,
                                 "street" => slot.location.street,
                                 "city" => slot.location.city,
                                 "postcode" => slot.location.postcode,
                                 "country" => slot.location.country,
                                 "longitude" => slot.location.longitude,
                                 "latitude" => slot.location.latitude,
                                 "createdAt" => slot.location.created.as_json,
                                 "updatedAt" => slot.location.last_update.as_json,
                                 "categories" => slot.location.categories,
                                 "images" => slot.location.images
                               },
                 "creator" => { "id" => slot.creator.id,
                                "username" => slot.creator.username,
                                "createdAt" => slot.creator.created_at.as_json,
                                "updatedAt" => slot.creator.updated_at.as_json,
                                "deletedAt" => nil },
                 "settings" => { 'alerts' => '1110001100' },
                 "visibility" => slot.visibility,
                 "notes" => slot.notes,
                 "likes" => slot.likes.count
                )
        expect(json["photos"].length).to eq(slot.photos.length)
        expect(json["photos"].first['clyid']).to eq(slot.photos.first.public_id)
        expect(json["shareUrl"]).to include slot.share_id
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
    header "Authorization", :auth_header

    parameter :title, "Title of slot (max. 48 characters)",
              required: true
    parameter :startDate,
              "Startdate and Time of the Slot",
              required: true
    parameter :endDate,
              "Enddate and Time of the Slot (startdate + duration)",
              required: true
    parameter :locationId,
              "ID of the location associated with this slot"
    parameter :notes, "Notes for to the Slot"
    parameter :settings, "User specific settings for the slot (alerts)"
    parameter :alerts, "Alerts for the Slot", scope: :settings

    describe "Create new standard slot" do

      parameter :visibility, "Visibility of the Slot",
                required: true

      response_field :id, "ID of the new slot"
      response_field :title, "Title of the new slot"
      response_field :startDate, "Startdate of the new slot"
      response_field :endDate, "Enddate of the new slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :alerts, "Alerts for the slot"
      response_field :note, "A Note on the slot"
      response_field :visibility, "Visibility of the slot"
      response_field :createdAt, "Creation datetime of the slot"
      response_field :updatedAt, "Last update of the slot"
      response_field :deletedAt, "Deletion datetime of the slot"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-13T22:03:24.000Z" }
      let(:locationId) { 200_719_253 }
      let(:notes) { [{ title: "revolutionizing the calendar",
                       content: "this is content" },
                     { title: "and another title",
                       content: "more content here" }] }
      let(:alerts) { '0101010101' }
      let(:visibility) { 10 }

      example "Create StandardSlot", document: :v1 do
        explanation "Returns data of new slot.\n\n" \
                    "Missing unrequiered fields will be filled" \
                    " with default values.\n\n" \
                    "returns 422 if parameters are invalid\n\n" \
                    "returns 422 if required parameters are missing"
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key("id")
        expect(json).to have_key("title")
        expect(json).to have_key("startDate")
        expect(json).to have_key("endDate")
        expect(json).to have_key("creator")
        expect(json).to have_key("notes")
        expect(json).to have_key("visibility")
        expect(json["notes"].length).to eq(notes.length)
      end
    end

    describe "Create std slot with invalid params" do

      parameter :visibility, "Visibility of the Slot",
                required: true

      response_field :pgerror, "Explanation which param couldn't be saved"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-10T13:31:02.000Z" }
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
                required: true

      response_field :endDate, "The missing parameter"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:visibility) { 10 }

      example "Create std slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("end_date")
      end
    end
  end

  post "/v1/groupslot" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :title, "Title of slot (max. 48 characters)",
              required: true
    parameter :startDate,
              "Startdate and Time of the Slot",
              required: true
    parameter :endDate,
              "Enddate and Time of the Slot (startdate + duration)",
              required: true
    parameter :groupId, "Group ID if GroupSlot",
              required: true
    parameter :note, "A note which belongs to the Slot"
    parameter :settings, "User specific settings for the slot (alerts)"
    parameter :alerts, "Alerts for the Slot", scope: :settings

    let(:group) { create(:group, owner: current_user) }

    describe "Create new group slot" do

      response_field :id, "ID of the new slot"
      response_field :title, "Title of the new slot"
      response_field :startDate, "Startdate of the new slot"
      response_field :endDate, "Enddate of the new slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :alerts, "Alerts for the slot"
      response_field :note, "A Note on the slot"
      response_field :groupId, "ID of the group the slot belongs to"
      response_field :createdAt, "Creation datetime of the slot"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-13T22:03:24.000Z" }
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
        expect(json).to have_key("startDate")
        expect(json).to have_key("endDate")
        expect(json).to have_key("creator")
        expect(json).to have_key("notes")
        expect(json).to have_key("groupId")
        expect(response_status).to eq(201)
      end
    end

    describe "Create group slot with invalid params" do

      response_field :pgerror, "Explanation which param couldn't be saved"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-10T13:31:02.000Z" }
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

      response_field :endDate, "The missing parameter"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:groupId) { group.id }

      example "Create group slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("end_date")
      end
    end
  end

  post "/v1/reslot" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :predecessorId,
              "ID of the Slot which was resloted",
              required: true

    let(:pred) { create(:std_slot) }

    describe "Reslot a StandardSlot" do

      response_field :id, "ID of the new slot"
      response_field :title, "Title of the slot"
      response_field :startDate, "Startdate of the slot"
      response_field :endDate, "Enddate of the slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :slotterId, "ID of the User who did reslot"
      response_field :note, "A Note on the slot"
      response_field :createdAt, "Creation datetime of the slot"
      response_field :updatedAt, "Last update of the slot"
      response_field :deletedAt, "Deletion datetime of the slot"

      let(:predecessorId) { pred.id }
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
        expect(json).to have_key("startDate")
        expect(json).to have_key("endDate")
        expect(json).to have_key("creator")
        expect(json).to have_key("slotterId")
        expect(json["title"]).to eq pred.title
        expect(json["startDate"]).to eq pred.start_date.as_json
        expect(json["creator"]["id"]).to eq pred.creator.id
        expect(json["slotterId"]).to eq current_user.id
      end
    end
  end

  patch "/v1/metaslot/:id" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the slot to update", required: true

    describe "Update an existing MetaSlot" do

      parameter :title, "Updated title of slot"
      parameter :startDate, "Updated Startdate and Time of the Slot"
      parameter :endDate,
                "Updated Enddate and Time of the Slot (startdate + duration)"

      let!(:meta_slot) { create(:meta_slot, creator: current_user) }
      let(:id) { meta_slot.id }
      let(:title) { "New title for a Slot" }

      example "Update MetaSlot", document: :v1 do
        explanation "Update content of MetaSlot.\n\n" \
                    "User must be creator of MetaSlot.\n\n" \
                    "returns 204 if update succeded \n\n" \
                    "returns 404 if User not creator or ID is invalid\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(204)
        expect(response_body).to eq("")
        expect(MetaSlot.last.title).to eq title
      end
    end
  end

  patch "/v1/stdslot/:id" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the slot to update", required: true

    let!(:std_slot) { create(:std_slot, owner: current_user) }
    let(:id) { std_slot.id }

    describe "Update an existing StdSlot" do
      parameter :title, "Updated title of slot"
      parameter :startDate, "Updated Startdate and Time of the Slot"
      parameter :endDate,
                "Updated Enddate and Time of the Slot (startdate + duration)"
      parameter :locationId, "Location ID"
      parameter :visibility, "Visibility of slot"

      let(:title) { "New title for a Slot" }

      example "Update StdSlot", document: :v1 do
        explanation "Update content of StdSlot.\n\n" \
                    "User must be owner of StdSlot.\n\n" \
                    "returns 200 and slot data if update succeded \n\n" \
                    "returns 404 if User not owner or ID is invalid\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(200)
        std_slot.reload
        expect(std_slot.title).to eq title
      end
    end

    describe "Add notes" do
      parameter :notes, "Scope for new notes",
                required: true
      parameter :title, "Title of the note",
                required: true,
                scope: :notes
      parameter :content, "Content of the note",
                required: true,
                scope: :notes

      let(:notes) { [attributes_for(:note), attributes_for(:note)] }

      example "Add notes", document: :v1 do
        do_request

        expect(response_status).to eq(200)
        expect(StdSlot.last.notes.last.title).to eq notes.first[:title]
      end
    end

    describe "Adding media items to existing slot" do

      parameter :photos, "Scope for array of new photos/voices/videos",
                required: true
      parameter :publicId, "Cloudinary ID / URL",
                required: true, scope: :photos
      parameter :position, "Sorting order of the new media item." \
                           " If not submitted it will be added at the end",
                scope: :photos

      response_field :mediaItemId, "Timeslot internal ID for this media item"

      let(:photos) { [publicId: "v1234567/dfhjghjkdisudgfds7iyf.jpg",
                      position: "1"] }

      example "Add photo", document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary client updates the slot with the image" \
                    " information.\n\n" \
                    "returns 422 if the media data is invalid\n\n" \
                    "returns 200 and slot details including the new mediaID"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("photos")
        expect(*json['photos']).to have_key("mediaId")
        std_slot.reload
        expect(std_slot.photos.size).to eq 1
      end
    end

    describe "Reordering media data of existing slot" do

      parameter :photos, "Array with mediaIds and position parameter",
                required: true
      parameter :mediaId, "Timeslot's internal ID for this media item",
                required: true, scope: :photos
      parameter :position, "Sorting order of the image/video/voice. If not " \
                           "supplied the media items will be sortet as they" \
                           " are ordered in the array.",
                required: true, scope: :photos

      let!(:photo_1) { create(:slot_image, mediable: std_slot, position: 0) }
      let!(:photo_2) { create(:slot_image, mediable: std_slot, position: 1) }
      let!(:photo_3) { create(:slot_image, mediable: std_slot, position: 2) }

      let(:photos) { [{ mediaId: photo_1.id,
                        position: 2 },
                      { mediaId: photo_2.id,
                        position: 0 },
                      { mediaId: photo_3.id,
                        position: 1 }] }

      example "Reorder media items", document: :v1 do
        explanation "An array with the media_item keys and corresponding" \
                    " position/ordering number (starting from 0) for all" \
                    " images of the slot must be send.\n\n" \
                    "returns 404 if a mediaId doesn't exist\n\n" \
                    "returns 422 if position params are invalid\n\n" \
                    "returns 200 and slot details on success"
        do_request

        expect(response_status).to eq(200)
        expect(std_slot.media_items.find(photo_1.id).position).to eq(2)
        expect(std_slot.media_items.find(photo_2.id).position).to eq(0)
        expect(std_slot.media_items.find(photo_3.id).position).to eq(1)
      end
    end
  end

  delete "/v1/stdslot/:id" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Standard Slot to delete", required: true

    let!(:std_slot) { create(:std_slot, :with_media, owner: current_user) }

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
                                "startDate" => std_slot.start_date.as_json,
                                "endDate" => std_slot.end_date.as_json,
                                "visibility" => std_slot.visibility,
                                "createdAt" => std_slot.created_at.as_json,
                                "updatedAt" => std_slot.updated_at.as_json,
                                "deletedAt" => std_slot.deleted_at.as_json,
                                "notes" => std_slot.notes
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
    header "Authorization", :auth_header

    parameter :id, "ID of the Group Slot to delete", required: true

    let(:group) { create(:group, owner: current_user) }
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
                                "startDate" => group_slot.start_date.as_json,
                                "endDate" => group_slot.end_date.as_json,
                                "groupId" => group_slot.group.id,
                                "createdAt" => group_slot.created_at.as_json,
                                "updatedAt" => group_slot.updated_at.as_json,
                                "deletedAt" => group_slot.deleted_at.as_json,
                                "notes" => group_slot.notes
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
    header "Authorization", :auth_header

    parameter :id, "ID of the ReSlot to delete", required: true

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
        expect(json).to include("id" => re_slot.id,
                                "title" => re_slot.title,
                                "slotterId" => re_slot.slotter.id,
                                "createdAt" => re_slot.created_at.as_json,
                                "updatedAt" => re_slot.updated_at.as_json,
                                "deletedAt" => re_slot.deleted_at.as_json,
                                "notes" => re_slot.notes
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

  get "/v1/slots/:id/likes" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the likes for", required: true

    let(:slot) { create(:group_slot, :with_likes) }
    let!(:membership) {
      create(:membership, :active, group: slot.group, user: current_user) }
    let!(:like) { create(:like, user: create(:user, :with_image), slot: slot) }

    describe "Get Likes for Slot" do
      let(:id) { slot.id }

      example "Get Likes for Slot", document: :v1 do
        explanation "returns a list of all likes for the slot." \
                    " Includes User data and timestamp.\n\n" \
                    "returns 401 if User not allowed to see Likes data\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to eq slot.likes.count
        expect(json.first).to have_key "userId"
        expect(json.first).to have_key "username"
        expect(json.first).to have_key "createdAt"
        expect(json.first).to have_key "userimage"
      end
    end
  end
end
