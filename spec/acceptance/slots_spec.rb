require 'documentation_helper'

resource "Slots" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  shared_context "default slot response fields" do
    response_field :id, "ID of the slot"
    response_field :title, "Title of the slot"
    response_field :startDate, "Startdate of the slot"
    response_field :endDate, "Enddate of the slot"
    response_field :openEnd, "OpenEnd Boolean Flag"
    response_field :createdAt, "Creation of slot"
    response_field :updatedAt, "Last update of slot"
    response_field :deletedAt, "Delete date of slot or nil"
    response_field :location, "Location data for the slot"
    response_field :creator, "User who created the slot"
    response_field :settings,
                   "Only included if it's a slot of the current User " \
                   "(created-/friend-/re-/groupslot),\n\n" \
                   "contains User specific settings for this slot (alerts)"
    response_field :visibility, "Visibiltiy of the slot"
    response_field :notes, "Notes on the slot"
    response_field :likes, "Likes for the slot"
    response_field :commentsCounter, "Number of comments on the slot"
    response_field :shareUrl, "Share URL for this slot, nil if not yet shared"
    response_field :images, "Images for the slot"
    response_field :audios, "Audio recordings for the slot"
    response_field :videos, "Videos recordings for the slot"
  end

  shared_context "group slot response fields" do
    include_context "default slot response fields"
    response_field :groupId, "ID of the group the slot belongs to"
  end

  shared_context "reslot response fields" do
    include_context "default slot response fields"
    response_field :slotterId, "ID of the User who did reslot"
  end

  shared_context "default slot parameter" do
    parameter :title, "Title of slot (max. 60 characters)",
              required: true
    parameter :startDate,
              "Startdate and Time of the Slot",
              required: true
    parameter :endDate,
              "Enddate and Time of the Slot (startdate + duration).",
              required: true
    #parameter :openEnd,
    #          "The OpenEnd Flag indicates if an user has set a specific end date to a Slot or not.",
    #          required: true
    parameter :location, "Location associated with this slot (see example)"
    parameter :media, "Media items (image/audio/video) of to the Slot " \
                      "(see example)"
    parameter :notes, "Notes for to the Slot (see example)"
    parameter :settings, "User specific settings for the slot (alerts)"
    parameter :alerts, "Alerts for the Slot", scope: :settings
  end

  shared_context "ios location params" do
    parameter :name, "Name of the location, eg. Timeslot Inc. (255 chars)",
              scope: :location
    parameter :thoroughfare, "Street address, eg. Dolziger Str. 9 (255 ch.)",
              scope: :location
    parameter :subThoroughfare, "house number, eg. 9 (255 chars)",
              scope: :location
    parameter :locality, "city, e.g. Berlin (255 chars)",
              scope: :location
    parameter :subLocality, "neighborhood, common name, eg. Mitte (255 ch.)",
              scope: :location
    parameter :postalCode, "zip code, eg. 94114 (32 chars)",
              scope: :location
    parameter :country, "country, eg. Germany (255 chars)",
              scope: :location
    parameter :isoCountryCode, "Country Code, eg. US (8 chars)",
              scope: :location
    parameter :inLandWater, "eg. Lake Tahoe", scope: :location
    parameter :ocean, "eg. Pacific Ocean", scope: :location
    parameter :areasOfInterest, "eg. Volkspark Friedrichshain",
              scope: :location
    parameter :latitude, "Latitude", scope: :location
    parameter :longitude, "Longitude", scope: :location
    parameter :privateLocation,
              "private location for this user (true/false) [not yet " \
              "sure what it will mean technically] -> default: false",
              scope: :location
  end

  post "/v1/slots" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :ids, "Array of slot IDs to get", required: true

    describe "Get several slots at once" do
      include_context "default slot response fields"

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
        create_list :audio, 2, mediable: slot2
        create_list :video, 2, mediable: slot2
      }
      let(:ids) { [slot1.id, slot2.id] }

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
        expect(json.last).to have_key("location")
        # expect(json.last['location']).to have_key("name")
        expect(json.last).to have_key("creator")
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
        # expect(json.last).to have_key("images")
        # expect(json.last).to have_key("audios")
        # expect(json.last).to have_key("videos")
        # expect(json.last.except('images', 'audios', 'videos'))
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
        # expect(json.last["images"].length).to eq(slot.images.length)
        # expect(json.last["images"].first['publicId']).to eq(slot.images.first.public_id)
      end
    end
  end

  get "/v1/slots/:id", :vcr do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the slot to get", required: true

    describe "Get slot with valid ID" do
      include_context "default slot response fields"

      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253) }
      let(:slot) { create(:std_slot_public, :with_media, :with_likes,
                          meta_slot: meta_slot, share_id: 'abcd1234') }

      let!(:slot_setting) { create(:slot_setting,
                                   user: current_user,
                                   meta_slot: slot.meta_slot,
                                   alerts: '1110001100') }
      let!(:medias) {
        create_list :slot_image, 3, mediable: slot
        create_list :audio, 2, mediable: slot
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
        # expect(json['location']).to have_key("name")
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
        expect(json).to have_key("media")
        expect(json.except('media', 'shareUrl'))
          .to eq("id" => slot.id,
                 "title" => slot.title,
                 "startDate" => slot.start_date.as_json,
                 "endDate" => slot.end_date.as_json,
                 "createdAt" => slot.created_at.as_json,
                 "updatedAt" => slot.updated_at.as_json,
                 "deletedAt" => deleted_at.as_json,
                 "location" => nil,
                 "creator" => { "id" => slot.creator.id,
                                "username" => slot.creator.username,
                                "createdAt" => slot.creator.created_at.as_json,
                                "updatedAt" => slot.creator.updated_at.as_json,
                                "deletedAt" => nil,
                                "image" => {
                                  "publicId" => nil,
                                  "localId" => nil
                                } },
                 "settings" => { 'alerts' => '1110001100' },
                 "visibility" => slot.visibility,
                 "notes" => slot.notes,
                 "likes" => slot.likes.count,
                 "commentsCounter" => slot.comments.count
                )
        expect(json["media"].length).to eq(slot.media_items.length)
        expect(response_body).to include slot.images.first.public_id
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

    include_context "default slot parameter"

    describe "Create new standard slot" do
      parameter :visibility, "Visibility of the Slot", required: true

      include_context "default slot response fields"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-13T22:03:24.000Z" }
      #let(:openEnd) { false }
      let(:notes) { [{ title: "revolutionizing the calendar",
                       content: "this is content" },
                     { title: "and another title",
                       content: "more content here" }] }
      let(:alerts) { '0101010101' }
      let(:visibility) { 'private' }

      context "slot without location" do
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

      context "slot with default location" do
        let(:locationId) { 200_719_253 }

        example "Create StandardSlot with default location", document: :false do
          explanation "Returns data of new slot.\n\n" \
                      "Missing unrequiered fields will be filled" \
                      " with default values.\n\n" \
                      "returns 422 if parameters are invalid\n\n" \
                      "returns 422 if required parameters are missing"
          do_request

          expect(response_status).to eq(201)
          expect(json).to have_key("id")
          expect(json).to have_key("title")
          expect(json).to have_key("location")
          # expect(json['location']).not_to be nil
          #expect(json['openEnd']).to be false
        end
      end

      context "slot with open End" do
        let(:endDate) { '' }

        example "Create StandardSlot with open End", document: :v1 do
          explanation "Returns data of new slot.\n\n" \
                      "The empty endDate will internally be set to the end of" \
                      " the start day but will not be returned in json.\n\n" \
                      "returns 422 if parameters are invalid\n\n" \
                      "returns 422 if required parameters are missing"
          do_request

          expect(response_status).to eq(201)
          new_slot = StdSlot.unscoped.last
          expect(new_slot.end_date)
            .to eq new_slot.start_date.to_datetime.next_day.at_noon
          expect(json).to have_key("id")
          expect(json).to have_key("title")
          expect(json['endDate']).to be nil
        end
      end

      context "slot with IOS location" do
        include_context "ios location params"

        let(:name) { 'Soho House' }
        let(:thoroughfare) { 'Torstrasse 1' }
        let(:locality) { 'Berlin' }
        let(:postal_code) { '10119' }
        let(:country) { 'Germany' }
        # google 52.527654, 13.415670
        # apple 52.527335,13.414259
        let(:latitude) { '52.527335' }
        let(:longitude) { '13.414259' }
        let(:private_location) { false }

        example "Create StandardSlot with IOS Location", document: :false do
          explanation "Returns data of new slot.\n\n" \
                      "Missing unrequiered fields will be filled" \
                      " with default values.\n\n" \
                      "returns 422 if parameters are invalid\n\n" \
                      "returns 422 if required parameters are missing"
          do_request

          slot = StdSlotPrivate.last
          expect(slot.ios_location_id).not_to be nil
          expect(response_status).to eq(201)
          expect(json).to have_key("id")
          expect(json).to have_key("location")
          location = json['location']
          expect(location['name']).to eq 'Soho House'
        end
      end
    end

    describe "Create std slot with invalid params" do
      parameter :visibility, "Visibility of the Slot",
                required: true

      response_field :error, "Explanation which param couldn't be saved"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-10T13:31:02.000Z" }
      #let(:openEnd) { false }
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

      response_field :error, "Contains Error message"

      let(:title) { "Time for a Slot" }
      let(:endDate) { "2014-09-08T13:31:02.000Z" }
      let(:visibility) { 'private' }

      example "Create std slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("error")
        expect(response_body).to include "start_date"
      end
    end
  end

  post "/v1/groupslot" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    include_context "default slot parameter"

    parameter :groupId, "ID of the group to which the Slot belongs",
              required: true

    let(:group) { create(:group, owner: current_user) }

    describe "Create new group slot" do
      include_context "group slot response fields"

      let(:title) { "Time for a Slot" }
      let(:startDate) { "2014-09-08T13:31:02.000Z" }
      let(:endDate) { "2014-09-13T22:03:24.000Z" }
      #let(:openEnd) { false }
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
        expect(json).to have_key("group")
        expect(json['group']).to have_key("id")
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
      response_field :error, "Contains Error message"

      let(:title) { "Time for a Slot" }
      let(:endDate) { "2014-09-08T13:31:02.000Z" }
      let(:groupId) { group.id }

      example "Create group slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("error")
        expect(response_body).to include "start_date"
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
      include_context "reslot response fields"

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
        expect(json).to have_key("slotter")
        expect(json["slotter"]["id"]).to eq current_user.id
        expect(json["title"]).to eq pred.title
        expect(json["startDate"]).to eq pred.start_date.as_json
        expect(json["endDate"]).to eq pred.end_date.as_json
        expect(json["creator"]["id"]).to eq pred.creator.id
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
      parameter :endDate, "Updated Enddate and Time of the Slot (startdate + duration)"
      #parameter :openEnd, "Updated OpenEnd Boolean Flag"

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
    include_context "default slot parameter"
    include_context "default slot response fields"

    let!(:std_slot) { create(:std_slot_private, owner: current_user) }
    let(:id) { std_slot.id }

    describe "Update an existing StdSlot" do
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
      parameter :localId, "Local ID of the note, temporary feature",
                scope: :notes

      let(:notes) { [attributes_for(:note).merge(localId: '123321'),
                     attributes_for(:note)] }

      example "Update Slot - Add notes", document: :v1 do
        do_request

        expect(response_status).to eq(200)
        expect(
          [notes.first[:title], notes.second[:title]]
        ).to include std_slot.notes.last.title
        expect(response_body).to include '123321'
      end
    end

    describe "Add Media to existing slot" do
      parameter :media, "array of new media items"
      parameter :mediaType, "one of image/video/audio",
                required: true, scope: :media
      parameter :publicId, "Cloudinary ID / URL",
                required: true, scope: :media
      parameter :localId, "iOS local ID (max 512 chars)",
                scope: :media
      parameter :position, "Sorting order of the new media item." \
                           " If not submitted it will be added at the end",
                scope: :media
      parameter :duration, "only for video and audio items"
      parameter :thumbnail, "public URL for video thumbnail"

      response_field :publicId, "Cloudinary URL of the media item"
      response_field :position, "Sorting order position of the media item"
      response_field :localId, "Ios specific local identifier"
      response_field :duration, "Duration of audio/video file"
      response_field :title, "Title of audio file"
      response_field :thumbnail, "Clouinary public URL of the video thumbnail"

      let(:media) { [publicId: "v1234567/dfhjghjkdisudgfds7sly.jpg",
                     position: "1",
                     mediaType: 'image',
                     localId: "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"] }

      example "Update Slot - Add media", document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary client updates the slot with the image" \
                    " information.\n\n" \
                    "returns 422 if the media data is invalid\n\n" \
                    "returns 200 and slot details including the new mediaID"
        do_request

        std_slot.reload
        expect(std_slot.images.size).to eq 1
        expect(std_slot.images.first.public_id)
          .to eq "v1234567/dfhjghjkdisudgfds7sly.jpg"
        expect(response_status).to eq(200)
        expect(json).to have_key("media")
        expect(*json['media']).to have_key("mediaId")
        expect(*json['media']).to have_key("publicId")
        expect(*json['media']).to have_key("mediaType")
        expect(*json['media']).to have_key("localId")
        expect(response_body).to include "v1234567/dfhjghjkdisudgfds7sly.jpg"
        expect(response_body)
          .to include "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
      end
    end

    describe "Reordering media data of existing slot" do
      parameter :media, "Array with mediaIds and position parameter",
                required: true
      parameter :mediaId, "Timeslot's internal ID for this media item",
                required: true, scope: :media
      parameter :position, "Sorting order of the image/video/audio. If not " \
                           "supplied the media items will be sortet as they" \
                           " are ordered in the array.",
                required: true, scope: :media

      let!(:image_1) { create(:slot_image, mediable: std_slot, position: 0) }
      let!(:image_2) { create(:slot_image, mediable: std_slot, position: 1) }
      let!(:image_3) { create(:slot_image, mediable: std_slot, position: 2) }

      let(:media) { [{ mediaId: image_1.id,
                       mediaType: 'image',
                       position: 2 },
                     { mediaId: image_2.id,
                       mediaType: 'image',
                       position: 0 },
                     { mediaId: image_3.id,
                       mediaType: 'image',
                       position: 1 }] }

      example "Update Slot - Reorder media items", document: :v1 do
        explanation "An array with the media_item keys and corresponding" \
                    " position/ordering number (starting from 0) for all" \
                    " images of the slot must be send.\n\n" \
                    "returns 404 if a mediaId doesn't exist\n\n" \
                    "returns 422 if position params are invalid\n\n" \
                    "returns 200 and slot details on success"
        do_request

        expect(response_status).to eq(200)
        expect(std_slot.media_items.find(image_1.id).position).to eq(2)
        expect(std_slot.media_items.find(image_2.id).position).to eq(0)
        expect(std_slot.media_items.find(image_3.id).position).to eq(1)
      end
    end

    describe "slot with IOS location" do
      include_context "ios location params"

      let(:name) { 'Soho House' }
      let(:thoroughfare) { 'Torstrasse 1' }
      let(:subThoroughfare) { '1' }
      let(:locality) { 'Berlin' }
      let(:subLocality) { 'Mitte' }
      let(:postalCode) { '10119' }
      let(:country) { 'Germany' }
      let(:isoCountryCode) { 'GER' }
      # google 52.527654, 13.415670
      # apple 52.527335,13.414259
      let(:latitude) { '52.527335' }
      let(:longitude) { '13.414259' }
      let(:privateLocation) { true }

      example "Update Slot - Add Location", document: :v1 do
        explanation "Returns data of new slot.\n\n" \
                    "Missing unrequiered fields will be filled" \
                    " with default values.\n\n" \
                    "returns 422 if parameters are invalid\n\n" \
                    "returns 422 if required parameters are missing"
        do_request

        std_slot.reload
        expect(std_slot.ios_location_id).not_to be nil
        expect(response_status).to eq(200)
        expect(json).to have_key("id")
        expect(json).to have_key("location")
        location = json['location']
        expect(location['name']).to eq 'Soho House'
        expect(location['thoroughfare']).to eq 'Torstrasse 1'
        expect(location['subThoroughfare']).to eq '1'
        expect(location['postalCode']).to eq '10119'
        expect(location['locality']).to eq 'Berlin'
        expect(location['subLocality']).to eq 'Mitte'
        expect(location['country']).to eq 'Germany'
        expect(location['isoCountryCode']).to eq 'GER'
        expect(location['privateLocation']).to be true
      end
    end

    describe "slot with IOS Custom label location" do
      include_context "ios location params"

      let(:name) { 'Soho House Custom' }
      let(:latitude) { '52.527335' }
      let(:longitude) { '13.414259' }

      example "Update Slot - Custom Location Label", document: :v1 do
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("id")
        expect(json).to have_key("location")
        expect(json['location']['name']).to eq 'Soho House Custom'
      end
    end
  end

  delete "/v1/stdslot/:id" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Standard Slot to delete", required: true

    let!(:std_slot) {
      create(:std_slot_private, :with_media, owner: current_user)
    }
    describe "Delete Standard Slot" do
      include_context "default slot response fields"

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
      include_context "group slot response fields"

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
                                "group" => {
                                  "id" => group_slot.group.id
                                },
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
      include_context "reslot response fields"

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
                                "slotter" => {
                                  "id" => re_slot.slotter.id
                                },
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

    response_field :array, "containing creation date of the Like and " \
                           "details of the user who made the Like"

    let(:slot) { create(:group_slot, :with_likes) }
    let!(:membership) {
      create(:membership, :active, group: slot.group, user: current_user) }
    let!(:like) { create(:like, user: create(:user, :with_image), slot: slot) }

    describe "Get Likes for Slot" do
      let(:id) { slot.id }

      example "Get Likes for Slot", document: :v1 do
        explanation "returns a list of all likes for the slot. " \
                    "Includes User data and timestamp.\n\n" \
                    "returns 401 if User not allowed to see Likes data\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to eq slot.likes.count
        expect(json.first).to have_key "liker"
        expect(json.first).to have_key "createdAt"
        expect(json.first["liker"]).to have_key "id"
        expect(json.first["liker"]).to have_key "image"
        expect(json.last["liker"]["id"]).to eq like.user.id
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

    response_field :array, "containing comment content and creation date and " \
                           "details of the user who made the comment"

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
        expect(json.first).to have_key "commenter"
        expect(json.first["commenter"]).to have_key "username"
        expect(json.first).to have_key "content"
      end
    end
  end

  get "/v1/slots/:id/history" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the chronic for", required: true

    response_field :predecessors,
                   "Array of Users who had (re-)slottet that slot before"
    # TODO: change parentUser to default user object, call it parentCreator
    response_field :parentUserId, "ID of the creator of the original slot"
    response_field :parentUsername,
                   "Username of the creator of the original slot"
    response_field :parentUserImage, "Image of the creator of the original slot"

    let!(:slot) { create(:std_slot) }
    let!(:reslot_1) { create(:re_slot, predecessor: slot,
                             meta_slot: slot.meta_slot, parent: slot) }
    let!(:reslot_2) { create(:re_slot, predecessor: reslot_1,
                             meta_slot: slot.meta_slot, parent: slot) }
    let!(:reslot_3) {
      create(:re_slot, predecessor: reslot_2, slotter: current_user,
             meta_slot: slot.meta_slot, parent: slot) }

    let(:id) { reslot_3.id }

    example "Get Reslot History aka Chronic for Slot", document: :v1 do
      explanation "returns list of all previous reslots for the slot." \
                  " Includes User data and timestamp.\n\n" \
                  "returns 401 if User not allowed to see reslot history\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json['predecessors'].size).to eq 2
      expect(json).to have_key("parentUser")
      expect(json["parentUser"]["id"]).to eq slot.owner.id
    end
  end

  post "/v1/slots/:id/copy" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :copyTo, "contains an array of the copy targets",
              required: true
    parameter :slotType, "Type of slot to copy to. Must be own of " \
                         "[private/friends/public]",
              scope: :copyTo
    parameter :groupId, "ID of the group to copy to, user must be allowed " \
                        "to post to this group",
              scope: :copyTo
    parameter :details, "Duplicate all media data and notes " \
                        "on the copied slots. Defaults to 'true'.\n\n" \
                        "Must be one of [true/false]",
              scope: :copyTo

    let(:slot) { create(:std_slot_public, :with_notes) }
    let(:group) { create(:group, :members_can_post) }
    let!(:membership) do
      create(:membership, :active, user: current_user, group: group)
    end

    describe "Copy Slot into several targets" do
      let(:id) { slot.id }
      let(:target_1) { { slotType: 'friends',
                         details: 'true' } }
      let(:target_2) { { groupId: group.id } }

      let(:copyTo) { [target_1, target_2] }

      example "Copy Slot to Friend Slots and into a group", document: :v1 do
        explanation "Several new slot instances can be created which share " \
                    "the same Metadata as the copy source. If details is " \
                    "set to 'true' all media items and notes will " \
                    "be duplicated."
        do_request

        expect(response_status).to eq(200)
        expect(BaseSlot.all.length).to eq 3
        new_stdslotfriends = StdSlotFriends.last
        expect(new_stdslotfriends.title).to eq slot.title
        expect(new_stdslotfriends.end_date).to eq slot.end_date
        expect(new_stdslotfriends.notes.length).to eq slot.notes.length
        new_groupslot = GroupSlot.unscoped.last
        expect(new_groupslot.title).to eq slot.title
        expect(new_groupslot.end_date).to eq slot.end_date
        expect(new_groupslot.notes.length).to eq slot.notes.length
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

    include_context "group slot response fields"

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
                    "and with it all comments and likes.\n\n" \
                    "Returns 200 and the data of the new slot."
        do_request

        expect(response_status).to eq(200)
        expect(BaseSlot.all.length).to eq 2
        expect(StdSlot.unscoped.last.StdSlotFriends?).to be true
        expect(StdSlot.unscoped.last.title).to eq slot.title
        expect(StdSlot.unscoped.last.end_date).to eq slot.end_date
      end
    end
  end

  get "/v1/slots/:id/share" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the slot to share", required: true

    describe "Share slot with valid ID" do
      include_context "default slot response fields"

      let(:slot) { create(:std_slot_public) }

      let(:id) { slot.id }

      example "Share slot", document: :v1 do
        explanation "if a user is authenticated the slot shareUrl" \
                    " will be included\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("id")
        expect(json).to have_key("title")
        expect(json).to have_key("startDate")
        expect(json).to have_key("endDate")
        expect(json).to have_key("createdAt")
        expect(json).to have_key("updatedAt")
        expect(json).to have_key("deletedAt")
        expect(json).to have_key("location")
        expect(json).to have_key("creator")
        expect(json['creator']).to have_key("username")
        expect(json).to have_key("notes")
        expect(json).to have_key("media")
        expect(json).to have_key("settings")
        expect(json).to have_key("visibility")
        expect(json).to have_key("likes")
        expect(json).to have_key("commentsCounter")
        expect(json).to have_key("shareUrl")
        expect(json["shareUrl"]).to include slot.share_id
        expect(json["shareUrl"]).not_to eq("")
      end
    end

    describe "Share slot with invalid ID" do
      let(:id) { 1 }

      example "Share slot with invalid ID returns not found", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end
end
