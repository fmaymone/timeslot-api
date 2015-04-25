require 'documentation_helper'

resource "Slots" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/slots" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

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
      response_field :commentsCounter, "Number of comments on the slot"
      response_field :images, "Images for the slot"
      response_field :voices, "Voice recordings for the slot"
      response_field :videos, "Videos recordings for the slot"

      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253) }
      let(:slot1) {
        create(:std_slot_private, :with_media, owner: current_user) }
      let(:slot2) {
        create(:std_slot_private, :with_media, meta_slot: meta_slot,
               owner: current_user) }
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

      example "Get multiple slots", document: :v1 do
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
        expect(json.last).to have_key("commentsCounter")
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
      response_field :commentsCounter, "Number of comments on the slot"
      response_field :shareUrl, "Share URL for this slot, nil if not yet shared"
      response_field :images, "Images for the slot"
      response_field :voices, "Voice recordings for the slot"
      response_field :videos, "Videos recordings for the slot"

      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253) }
      let(:slot) { create(:std_slot_public, :with_media, :with_likes,
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

      example "Get slot", document: :v1 do
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
        expect(json).to have_key("commentsCounter")
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
                 "likes" => slot.likes.count,
                 "commentsCounter" => slot.comments.count
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
      response_field :visibility, "Visibility of the slot (private/friends/public)"
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
      let(:visibility) { 'private' }

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

      response_field :error, "Explanation which param couldn't be saved"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-10T13:31:02.000Z" }
      let(:visibility) { 'private' }
      let(:alerts) { "oh no" }

      example "Create std slot with invalid params returns 422 & failure details",
              document: false do
        explanation "Parameters that can not be written to db will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("error")
      end
    end

    describe "Create std slot with missing requiered params" do

      parameter :visibility, "Visibility of the Slot",
                required: true

      response_field :endDate, "The missing parameter"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:visibility) { 'private' }

      example "Create std slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("error")
        expect(response_body).to include "end_date"
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

      response_field :error, "Explanation which param couldn't be saved"

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
        expect(json).to have_key("error")
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
        expect(json).to have_key("error")
        expect(response_body).to include "end_date"
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

    let!(:std_slot) { create(:std_slot_private, owner: current_user) }
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
        expect(
          [notes.first[:title], notes.second[:title]]
        ).to include std_slot.notes.last.title
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

    let!(:std_slot) { create(:std_slot_private, :with_media, owner: current_user) }

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
                                "notes" => re_slot.notes)
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

  post "/v1/slots/:id/comment" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to make a comment on", required: true
    parameter :content, "Content of the comment", required: true

    let(:slot) { create(:std_slot_friends, :with_comments) }
    let!(:friendship) {
      create(:friendship, :established, friend: slot.owner, user: current_user)
    }
    describe "Make comment on Slot" do
      let(:id) { slot.id }
      let(:content) { "Liebe ist ein Kind der Freiheit" }

      example "Make Comment on Slot", document: :v1 do
        explanation "Current user makes a comment on a slot."
        do_request

        expect(response_status).to eq(200)
      end
    end
  end

  get "/v1/slots/:id/comments" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the comments for", required: true

    let(:slot) { create(:group_slot, :with_comments) }
    let!(:membership) {
      create(:membership, :active, group: slot.group, user: current_user) }
    let!(:comment) {
      create(:comment, user: create(:user, :with_image), slot: slot) }

    describe "Get Comments for Slot" do
      let(:id) { slot.id }

      example "Get Comments for Slot", document: :v1 do
        explanation "returns a list of all comments for the slot." \
                    " Includes User data and timestamp.\n\n" \
                    "returns 401 if User not allowed to see Comments data\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to eq slot.comments.count
        expect(json.first).to have_key "userId"
        expect(json.first).to have_key "username"
        expect(json.first).to have_key "content"
      end
    end
  end

  get "/v1/slots/:id/history" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the chronic for", required: true

    let!(:slot) { create(:std_slot) }
    let!(:reslot_1) { create(:re_slot, predecessor: slot,
                             meta_slot: slot.meta_slot, parent: slot) }
    let!(:reslot_2) { create(:re_slot, predecessor: reslot_1,
                             meta_slot: slot.meta_slot, parent: slot) }
    let!(:reslot_3) {
      create(:re_slot, predecessor: reslot_2, slotter: current_user,
             meta_slot: slot.meta_slot, parent: slot) }

    let(:id) { reslot_3.id }

    example "Get Reslot History/Chronic for Slot", document: :v1 do
      explanation "returns list of all previous reslots for the slot." \
                  " Includes User data and timestamp.\n\n" \
                  "returns 401 if User not allowed to see reslot history\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json['predecessors'].size).to eq 2
      expect(json).to have_key("parentUserId")
      expect(json["parentUserId"]).to eq slot.owner.id
    end
  end

  post "/v1/slots/:id/copy" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :copyTo, "contains an array of the copy targets",
              required: true
    parameter :target, "Type of slot to copy to. Must be own of " \
                       "[private_slots/friend_slots/public_slots] " \
                       "or a name of a group where the user is allowed " \
                       "to post.",
              required: true,
              scope: :copyTo
    parameter :details, "Duplicate all media data and notes " \
                        "on the copied slots. Defaults to 'true'.\n\n" \
                        "Must be one of [true/false]",
              scope: :copyTo

    let(:slot) { create(:std_slot_public, :with_comments) }
    let(:group) { create(:group, :members_can_post) }
    let!(:membership) do
      create(:membership, :active, user: current_user, group: group)
    end

    describe "Copy Slot into several targets" do
      let(:id) { slot.id }
      let(:target_1) { { slot_type: 'friends',
                         details: 'true' } }
      let(:target_2) { { group_id: group.id,
                         details: true } }

      let(:copyTo) { [target_1, target_2] }

      example "Copy Slot to Friend Slots and into a group", document: :v1 do
        explanation "Several new slot instances can be created which share " \
                    "the same Metadata as the copy source. If details is " \
                    "set to 'true' all media items and notes will " \
                    "be duplicated."
        do_request

        expect(response_status).to eq(200)
        expect(BaseSlot.all.length).to eq 3
        expect(GroupSlot.unscoped.last.title).to eq slot.title
        expect(GroupSlot.unscoped.last.end_date).to eq slot.end_date
      end
    end
  end

  post "/v1/slots/:id/move" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :slotType, "Type of slot to move to. Must be own of " \
                          "[private/friends/public]"
    parameter :groupId, "Contains the group ID if moving into a group" \
                         " User must be allowed to post to this group"
    parameter :details, "Move all media data and notes to the new " \
                        " slot. Otherwise they will be deleted.\n\n" \
                        "Defaults to 'true', must be one of [true/false]"

    let(:slot) { create(:std_slot_private, :with_media, owner: current_user) }

    describe "Move Slot from private to friends" do
      let(:id) { slot.id }
      let(:slotType) { 'friends' }
      let(:details) { 'true' }

      example "Move Slot from private Slots to Friend Slots", document: :v1 do
        explanation "A new slot will be created with  " \
                    "the same Metadata as it's source. Either slotType or " \
                    "groupId must be provided! If details is " \
                    "set to 'true' all media items and notes will " \
                    "be duplicated. The source will be deleted afterwards " \
                    "and with it all comments and likes."
        do_request

        expect(response_status).to eq(200)
        expect(BaseSlot.all.length).to eq 2
        expect(StdSlot.unscoped.last.StdSlotFriends?).to be true
        expect(StdSlot.unscoped.last.title).to eq slot.title
        expect(StdSlot.unscoped.last.end_date).to eq slot.end_date
      end
    end
  end
end
