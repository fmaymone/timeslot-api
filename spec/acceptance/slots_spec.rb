require 'documentation_helper'
require 'acceptance/shared_contexts'

resource "Slots" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/slots" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    include_context "default slot parameter"
    parameter :visibility,
              "Deprecated: Visibility of the Slot (private/friends/foaf/public)"
    parameter :slotGroups,
              "Array with UUIDs of the SlotGroups slot should be added to"

    describe "Create new slot" do
      include_context "stdslot response fields"

      response_field :unauthorizedSlotgroups,
                     "Array of Slotgroup UUIDs where the current_user has no " \
                     "write access or Slotgroup was deleted. Will be empty if " \
                     "all worked fine."

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

      # additional slotgroups
      let(:group_1) { create(:group, owner: current_user) }
      let(:group_2) do
        group = create(:group)
        create(:membership, :active, group: group, user: current_user)
        group
      end
      let(:unauthorized_group) { create(:group) }
      let(:deleted_group) {
        create(:group, owner: current_user, deleted_at: Time.zone.now) }

      let(:slotGroups) { [current_user.my_cal_uuid,
                          group_1.uuid,
                          group_2.uuid,
                          unauthorized_group.uuid,
                          deleted_group.uuid] }

      example "Create new slot", document: :v1 do
        explanation "Creates a new slot for the user.\n\n" \
                    "If the 'MyCalendar'-UUID is given the new slot will be " \
                    "added to the users schedule. Also it will be added to all" \
                    " given slotGroups where the user has write permission.\n\n" \
                    "Default slot visibility is *private*. If the " \
                    "'shareWithFriends'-UUID is submitted, the slot will be" \
                    " *friend-visible*.\n\n" \
                    "If at least **one public calendar** is submitted where " \
                    "the slot should be included, then the slot will be " \
                    "*public*.\n\n" \
                    "For backward compatibility the 'visibility' can still " \
                    "be submitted. If **visibility** is set to *private* or " \
                    "*friends*, but no private calendar is submitted, " \
                    "the slot is put in the users " \
                    "'MyPrivateSlots' calendar. Also if visibility is " \
                    "set to *friends*, the **show_to_friend** flag will be set." \
                    " If *public* is submitted, but no accompanying public" \
                    " calendar, the slot will be put into the" \
                    " users 'MyPublicSlots' calendar.\n\n" \
                    "If the submitted visiblity contradicts the visibility " \
                    "resulting from the submitted calendars, the highest " \
                    "visibility will win.\n\n" \
                    "Returns data of new slot and array with unauthorized " \
                    "slotGroup UUIDs (User has no write access or slotgroup" \
                    " deleted).\n\n" \
                    "Returns 422 if parameters are invalid or missing."
        do_request

        new_slot = BaseSlot.last

        expect(current_user.created_slots).to include new_slot.meta_slot
        expect(current_user.my_calendar_slots).to include new_slot
        expect(group_1.slots).to include new_slot
        expect(group_2.slots).to include new_slot
        expect(unauthorized_group.slots).not_to include new_slot
        expect(deleted_group.slots).not_to include new_slot

        expect(response_status).to eq(201)
        expect(json).to have_key("id")
        expect(json["id"]).to eq new_slot.id
        expect(json).to have_key("title")
        expect(json).to have_key("startDate")
        expect(json).to have_key("createdAt")
        expect(json).to have_key("updatedAt")
        expect(json).to have_key("deletedAt")
        expect(json).to have_key("endDate")
        expect(json).to have_key("location")
        # expect(json.last['location']).to have_key("name")
        expect(json).to have_key("creator")
        expect(json['creator']).to have_key("username")
        expect(json['creator']['username']).to eq current_user.username
        expect(json).to have_key("notes")
        expect(json).to have_key("media")
        expect(json).to have_key("settings")
        expect(json['settings']).to have_key("alerts")
        expect(json).to have_key("visibility")
        expect(json["visibility"]).to eq visibility
        # expect(json).to have_key("reslotsCounter")
        expect(json).to have_key("likes")
        expect(json).to have_key("commentsCounter")
        expect(json).to have_key("unauthorizedSlotgroups")
        expect(json['unauthorizedSlotgroups']).to include unauthorized_group.uuid
        expect(json['unauthorizedSlotgroups']).to include deleted_group.uuid
      end
    end
  end

  get "/v1/slots/:id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the slot to get", required: true

    describe "Get slot with valid ID" do
      include_context "stdslot response fields"

      let(:meta_slot) { create(:meta_slot, :with_ioslocation) }
      let(:slot) { create(:std_slot_public, :with_media, :with_likes,
                          meta_slot: meta_slot) }

      let!(:slot_setting) { create(:slot_setting,
                                   user: current_user,
                                   meta_slot: slot.meta_slot,
                                   alerts: '1110001100') }
      let!(:medias) {
        build_stubbed_list :slot_image, 3, mediable: slot
        build_stubbed_list :audio, 2, mediable: slot
        build_stubbed_list :video, 2, mediable: slot
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
        expect(json).to have_key("visibleCount")
        expect(json).to have_key("visibility")
        expect(json).to have_key("media")
        expect(json).to have_key("firstGroup")
        slot.reload
        expect(json.except('media', 'location', 'likerIds'))
          .to eq("id" => slot.id,
                 "title" => slot.title,
                 "startDate" => slot.start_date.as_json,
                 "endDate" => slot.end_date.as_json,
                 "firstGroup" => nil,
                 "createdAt" => slot.created_at.as_json,
                 "updatedAt" => slot.updated_at.as_json,
                 "deletedAt" => deleted_at.as_json,
                 "creator" => { "id" => slot.creator.id,
                                "username" => slot.creator.username,
                                "createdAt" => slot.creator.created_at.as_json,
                                "updatedAt" => slot.creator.updated_at.as_json,
                                "deletedAt" => nil,
                                "image" => ""
                              },
                 # "settings" => { 'alerts' => '1110001100' },
                 "settings" => { 'alerts' => 'omitted' },
                 "visibility" => slot.visibility,
                 "notes" => slot.notes,
                 "likes" => slot.likes.count,
                 "commentsCounter" => slot.comments.count,
                 "visibleCount" => slot.visible_count
                )
        expect(json["media"].length).to eq(slot.media_items.length)
        expect(response_body).to include slot.images.first.public_id
        expect(json["location"]).to include("id" => meta_slot.ios_location.uuid,
                                            "name" => 'Acapulco')
      end
    end

    describe "Get private slot of other user" do
      let(:id) { create(:std_slot_private).id }

      example "Get private slot of other user returns not found",
              document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end

    describe "Get foaf slot with invalid auth_token" do
      let(:id) { create(:std_slot_foaf).id }
      let(:auth_header) { "Token token=foobar" }

      example "Get foaf slot with invalid auth_token returns Unauthorized",
              document: false do
        do_request
        expect(response_status).to eq(401)
      end
    end

    describe "Get public slot with invalid auth_token" do
      let(:id) { create(:std_slot_public).id }
      let(:auth_header) { "Token token=foobar" }

      example "Get public slot of other user with invalid auth_token returns OK",
              document: false do
        do_request
        expect(response_status).to eq 200
      end
    end

    describe "Get public slot without auth_token" do
      let(:id) { create(:std_slot_public).id }
      let(:auth_header) { nil }

      example "Get public slot of other user without auth_token returns OK",
              document: false do
        do_request
        expect(response_status).to eq 200
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

    parameter :visibility,
              "Visibility of the Slot (private/friends/foaf/public)",
              required: true
    parameter :slotSets,
              "Array with UUIDs of the SlotGroups and SlotSets the slot " \
              "should be added to",
              required: false
    # TODO: response needs array with invalid slotset uuids

    include_context "default slot parameter"

    describe "Create new standard slot" do
      include_context "stdslot response fields"

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
                      "At the moment the slot is added to MySchedule by " \
                      "default. I think we'll change this so it's only added " \
                      "if the MySchedule UUID is provided in the slotGroups " \
                      "array. Additional slotGroups can be submitted and the " \
                      "slot will be added there too.\n\n" \
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
            .to eq new_slot.start_date.to_datetime.at_end_of_day
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
    parameter :visibility, "Visibility of the Slot to update " \
                           "(private/friends/foaf/public)"
    include_context "default slot parameter"
    include_context "default slot response fields"

    let!(:std_slot) { create(:std_slot_private, owner: current_user,
                             creator: current_user) }
    let(:id) { std_slot.id }

    describe "Update an existing StdSlot by creator" do
      let(:title) { "New title for a Slot" }

      example "Update StdSlot - change title", document: :v1 do
        explanation "Update content of StdSlot.\n\n" \
                    "User must be creator of StdSlot.\n\n" \
                    "returns 200 and slot data if update succeded \n\n" \
                    "returns 404 if User not owner or ID is invalid\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(200)
        std_slot.reload
        expect(std_slot.title).to eq title
      end
    end

    describe "Change visibility of an existing StdSlot" do
      let(:visibility) { 'friends' }

      example "Update StdSlot - change visibility", document: :v1 do
        explanation "Update visibility of StdSlot.\n\n" \
                    "User must be owner of StdSlot.\n\n" \
                    "returns 200 and slot data if update succeded \n\n" \
                    "returns 404 if User not owner or ID is invalid\n\n" \
                    "returns 422 if parameters are invalid"

        expect(std_slot.visibility).to eq 'private'
        expect(std_slot.type).to eq 'StdSlotPrivate'

        do_request

        expect(response_status).to eq(200)
        slot = BaseSlot.last
        expect(slot.id).to eq std_slot.id
        expect(slot.visibility).to eq 'friends'
        expect(slot.type).to eq 'StdSlotFriends'
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
        # expect(location['privateLocation']).to be true
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

  delete "/v1/slots/:id" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Standard Slot to delete", required: true

    let!(:std_slot) {
      create(:std_slot_private, owner: current_user, creator: current_user)
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
        skip 'needs fix'
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  delete "/v1/slots/:id/media", :vcr do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Standard Slot where the media belongs to", required: true
    parameter :media, "Array of the Media Items to delete", required: true

    let!(:slot) {
      create(:std_slot_public, :with_media, owner: current_user, creator: current_user)
    }
    let(:id) { slot.id }

    describe "Delete Slot Media Item" do
      let(:media) { slot.media_items.map{|media| media.slice(:id)} }

      example "Delete MediaItem", document: :v1 do
        explanation "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameter was missing or is invalid"

        expect(slot.media_items.count).to be(media.count)

        do_request
        slot.reload

        expect(response_status).to eq(200)
        expect(slot.media_items.count).to be(0)
      end
    end

    describe "Delete Slot Image + Reorder Position" do
      let(:media) { [slot.images.first.slice(:id)] }

      example "Delete MediaItem", document: false do
        explanation "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameter was missing or is invalid"

        expect(slot.images.first.position).to be(0)
        expect(slot.images.last.position).to be(slot.images.count - 1)

        last_id = slot.images.last[:id]

        do_request
        slot.images.last.reload

        expect(response_status).to eq(200)
        expect(slot.images.first.position).to be(0)
        expect(slot.images.first[:id]).to be(last_id)
      end
    end
  end

  delete "/v1/slots/:id/notes", :vcr do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Standard Slot where the notes belongs to", required: true
    parameter :notes, "Array of the Notes to delete", required: true

    let!(:slot) {
      create(:std_slot_public, :with_notes, owner: current_user, creator: current_user)
    }

    describe "Delete Slot Notes" do
      let(:notes) { slot.notes.map{|note| note.slice(:id)} }
      let(:id) { slot.id }

      example "Delete Notes", document: :v1 do
        explanation "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameter was missing or is invalid"

        expect(slot.notes.count).to be(notes.count)

        do_request
        slot.reload

        expect(response_status).to eq(200)
        expect(slot.notes.count).to be(0)
      end
    end
  end

  get "/v1/slots/:id/slotsets" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to be added to SlotGroups", required: true

    response_field :slotSets,
                   "Array of Slotgroup and eventually myCalendar uuid of " \
                   "the current_user."

    let(:slot) { create(:std_slot_public) }
    let(:group_1) { create(:group, owner: current_user) }
    let(:group_2) do
      group = create(:group)
      create(:membership, :active, group: group, user: current_user)
      group
    end
    let(:unauthorized_group) { create(:group, name: 'unauthorized') }
    let(:deleted_group) {
      create(:group, owner: current_user, deleted_at: Time.zone.now) }
    let!(:containerships) {
      create(:containership, slot: slot, group: group_1)
      create(:containership, slot: slot, group: group_2)
      create(:containership, slot: slot, group: unauthorized_group)
      create(:containership, slot: slot, group: deleted_group,
             deleted_at: Time.zone.now)
    }
    let!(:passengership) {
      create(:passengership, user: current_user, slot: slot) }

    let(:id) { slot.id }

    example "Add Slot to multiple SlotGroups", document: :v1 do
      explanation "Send an array of slotGroup UUIDs that contain the " \
                  "slot and where the user has write access.\n\n" \
                  "returns a list of all slotgroups where user has no " \
                  "access rights\n\n" \
                  "returns 404 if ID is invalid\n\n" \
                  "returns ???"
      do_request

      expect(response_status).to eq(200)
      expect(json).to have_key 'slotSets'
      expect(response_body).to include group_1.uuid
      expect(response_body).to include group_2.uuid
      expect(response_body).to include current_user.slot_sets['my_cal_uuid']
      expect(response_body).not_to include deleted_group.uuid
      expect(response_body).not_to include unauthorized_group.uuid
    end
  end

  post "/v1/slots/:id/slotgroups" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to be added to SlotGroups", required: true
    parameter :slotGroups,
              "Array with UUIDs of the SlotGroups the slot should be added to",
              required: true

    response_field :unauthorizedSlotgroups,
                   "Array of Slotgroup UUIDs where the current_user has no " \
                   "write access or Slotgroup was deleted. Will be empty if " \
                   "all worked fine."

    let(:slot) { create(:std_slot_public) }
    let(:group_1) { create(:group, owner: current_user) }
    let(:group_2) do
      group = create(:group)
      create(:membership, :active, group: group, user: current_user)
      group
    end
    let(:unauthorized_group) { create(:group) }
    let(:deleted_group) {
      create(:group, owner: current_user, deleted_at: Time.zone.now) }

    let(:id) { slot.id }

    describe "Add Slot to multiple SlotGroups" do
      let(:slotGroups) { [group_1.uuid,
                          group_2.uuid,
                          unauthorized_group.uuid,
                          deleted_group.uuid] }

      example "Add Slot to multiple SlotGroups", document: :v1 do
        explanation "Send an array of slotGroup UUIDs and the slot will be " \
                    "added to those slotGroups.\n\n" \
                    "returns a list of all slotgroups where user has no " \
                    "access rights\n\n" \
                    "returns 404 if ID is invalid\n\n" \
                    "returns ???"
        do_request

        expect(response_status).to eq(200)
        expect(group_1.slots).to include slot
        expect(group_2.slots).to include slot
        expect(unauthorized_group.slots).not_to include slot
        expect(deleted_group.slots).not_to include slot
        expect(slot.slot_groups).to include group_1
        expect(slot.slot_groups).to include group_2
        expect(slot.slot_groups).not_to include unauthorized_group
        expect(slot.slot_groups).not_to include deleted_group
        expect(json).to have_key('unauthorizedSlotgroups')
        expect(json['unauthorizedSlotgroups']).to include unauthorized_group.uuid
        expect(json['unauthorizedSlotgroups']).to include deleted_group.uuid
      end
    end

    describe "Re-Add Slot to SlotSets" do
      let!(:containership) {
        create(:containership, slot: slot, group: group_1,
               deleted_at: Time.zone.now) }
      let!(:passengership) {
        create(:passengership, user: current_user, slot: slot,
               deleted_at: Time.zone.now) }
      let(:slotGroups) { [group_1.uuid,
                          current_user.slot_sets['my_cal_uuid']] }

      example "re-add to group", document: false do
        expect(group_1.slots).not_to include slot
        expect(current_user.my_calendar_slots).not_to include slot

        do_request

        expect(response_status).to eq 200
        group_1.reload
        current_user.reload
        expect(group_1.slots).to include slot
        expect(current_user.my_calendar_slots).to include slot
      end
    end

    describe "Add Slot to Users Public Slot Calendar" do
      let(:current_user) { create(:user, :with_default_calendars) }
      let(:slotGroups) { [group_1.uuid,
                          current_user.slot_sets['my_public_slots_uuid']] }

      it "adds the slot to the public calendar" do
        uuid = current_user.slot_sets['my_public_slots_uuid']
        my_public_calendar = Group.find_by(uuid: uuid)

        expect(my_public_calendar.slots).not_to include slot

        do_request

        expect(response_status).to eq 200
        my_public_calendar.reload
        expect(my_public_calendar.slots).to include slot
        group_1.reload
        expect(group_1.slots).to include slot
      end
    end
  end

  delete "/v1/slots/:id/slotgroups" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to be removed from SlotGroups",
              required: true
    parameter :slotGroups,
              "Array with UUIDs of the SlotGroups slot should be removed from",
              required: true

    response_field :unauthorizedSlotgroups,
                   "Array of Slotgroup UUIDs where the current_user has no " \
                   "write access or Slotgroup was deleted. Will be empty if " \
                   "all worked fine."

    let(:slot) { create(:std_slot_public) }
    let(:my_calendar_uuid) { current_user.slot_sets['my_cal_uuid'] }
    let(:group_1) { create(:group, owner: current_user) }
    let(:group_2) do
      group = create(:group)
      create(:membership, :active, group: group, user: current_user)
      group
    end
    let(:unauthorized_group) { create(:group) }
    let(:deleted_group) {
      create(:group, owner: current_user, deleted_at: Time.zone.now) }
    let!(:passengership) {
      create(:passengership, slot: slot, user: current_user)
    }
    let!(:containerships) {
      create(:containership, slot: slot, group: group_1)
      create(:containership, slot: slot, group: group_2)
      create(:containership, slot: slot, group: unauthorized_group)
      create(:containership, slot: slot, group: deleted_group,
             deleted_at: Time.zone.now)
    }
    let(:slotGroups) { [group_1.uuid,
                        group_2.uuid,
                        my_calendar_uuid,
                        unauthorized_group.uuid,
                        deleted_group.uuid] }

    describe "Remove Slot from multiple SlotGroups" do
      let(:id) { slot.id }

      example "Remove Slot from multiple SlotGroups", document: :v1 do
        explanation "Send an array of slotGroup UUIDs and the slot will be " \
                    "added to those slotGroups.\n\n" \
                    "returns 404 if ID is invalid\n\n" \
                    "returns ???"
        expect(group_1.slots).to include slot
        expect(group_2.slots).to include slot
        expect(slot.slot_groups).to include group_1
        expect(slot.slot_groups).to include group_2
        expect(current_user.my_calendar_slots).to include slot

        do_request
        expect(response_status).to eq(200)
        expect(group_1.slots).not_to include slot
        expect(group_2.slots).not_to include slot
        expect(unauthorized_group.slots).to include slot
        expect(deleted_group.slots).not_to include slot
        expect(current_user.my_calendar_slots).not_to include slot
        expect(slot.slot_groups).not_to include group_1
        expect(slot.slot_groups).not_to include group_2
        expect(slot.slot_groups).to include unauthorized_group
        expect(slot.slot_groups).not_to include deleted_group
        expect(json).to have_key('unauthorizedSlotgroups')
        expect(json['unauthorizedSlotgroups']).to include unauthorized_group.uuid
        expect(json['unauthorizedSlotgroups']).to include deleted_group.uuid
      end
    end
  end

  post "/v1/slots/:id/like" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to like", required: true

    let(:slot) { create(:std_slot_friends) }
    let!(:friendship) {
      create(:friendship, :established, friend: slot.creator, user: current_user)
    }
    describe "Like a Slot" do
      let(:id) { slot.id }

      example "Like a Slot", document: :v1 do
        explanation "Current user likes a slot."
        expect(slot.likes.count).to eq 0

        do_request

        expect(response_status).to eq(200)
        slot.reload
        expect(slot.likes.count).to eq 1
        expect(slot.likes.count).to eq slot.likes_count
      end
    end
  end

  delete "/v1/slots/:id/like" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to unlike", required: true

    let(:slot) { create(:std_slot_friends) }
    let!(:like) { create(:like, slot: slot, user: current_user) }
    let!(:friendship) {
      create(:friendship, :established, friend: slot.creator, user: current_user)
    }
    describe "Unlike a Slot" do
      let(:id) { slot.id }

      example "Unlike a Slot", document: :v1 do
        explanation "Current user unlikes a slot."
        expect(slot.likes).to include like
        expect(like.deleted_at?).to be false

        do_request

        expect(response_status).to eq(200)
        like.reload
        expect(like.deleted_at?).to be true
        slot.reload
        expect(slot.likes.count).to eq slot.likes_count
      end
    end
  end

  get "/v1/slots/:id/likes" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the likes for", required: true

    response_field :array, "containing creation date of the Like and " \
                           "details of the user who made the Like"

    let(:slot) { create(:std_slot_public, :with_likes) }
    let!(:like) { create(:like, user: create(:user), slot: slot) }

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
        expect(response_body).to include like.user.username
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
      create(:friendship, :established, friend: slot.creator, user: current_user)
    }
    describe "Make comment on Slot" do
      let(:id) { slot.id }
      let(:content) { "Liebe ist ein Kind der Freiheit" }

      example "Make Comment on Slot", document: :v1 do
        explanation "Current user makes a comment on a slot."
        do_request

        expect(response_status).to eq(200)
        slot.reload
        expect(slot.comments.count).to eq slot.comments_count
      end
    end
  end

  get "/v1/slots/:id/comments" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the comments for", required: true

    response_field :array, "containing comment content and creation date and " \
                           "details of the user who made the comment"

    let(:slot) { create(:std_slot_public, :with_comments) }

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

  get "/v1/slots/:id/slotters" do
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the slotters for", required: true

    response_field :array,
                   "list of all users who added the slot to their 'MyCalendar'"

    let(:parent) { create(:std_slot_public, show_in_calendar: false) }
    let!(:reslots) { create_list(:passengership, 2, slot: parent) }

    describe "Get Slotters for Slot" do
      let(:id) { parent.id }

      example "Get Slotters for Slot", document: :v1 do
        explanation "returns a list of all users who have the slot in their " \
                    "calendar. For now there is no distinction between " \
                    "visibilities as backend has no support for this yet.\n\n" \
                    "returns 401 if User not allowed to see Slotter data\n\n" \
                    "returns 404 if ID is invalid"
        do_request
        expect(response_status).to eq(200)
        expect(json.length).to eq 2
        expect(json.first).to have_key "slotter"
        expect(json.first["slotter"]).to have_key "id"
        expect(json.first["slotter"]).to have_key "image"
        expect(response_body).to include reslots.first.user.username
        expect(response_body).to include reslots.last.user.username
      end
    end
  end

  post "/v1/slots/:id/user_tags" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot where the user should be tagged",
              required: true
    parameter :user_tags,
              "Array of users ids which should be tagged for this slot",
              required: true

    let!(:slot) { create(:std_slot_public, creator: current_user) }
    let(:user_tags) do
      [create(:user).id,
       create(:user).id,
       create(:user).id]
    end
    let(:id) { slot.id }

    example "Tagging users to a slot", document: :v1 do
      explanation "Tagged Users are allowed to add media to the slot.\n\n" \
                  "For now the slot is put into the MySchedule for the users " \
                  "given until we gave them a choice if or where to save it." \
                  "Returns a list of all user IDs tagged to this slot.\n\n" \
                  "returns 404 if ID is invalid.\n\n" \
                  "returns 422 if parameters are invalid\n\n" \
                  "returns 422 if required parameters are missing"

      tagged_users = slot.passengerships.find_by add_media_permission: true
      expect(tagged_users).to be_nil

      do_request
      expect(response_status).to eq(200)

      tagged_users = slot.passengerships.where(add_media_permission: true)
                     .pluck(:user_id)
      expect(tagged_users).to eq(user_tags)
      expect(slot.tagged_users.pluck(:id)).to eq(user_tags)
    end
  end

  get "/v1/slots/:id/user_tags" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the Slot to get the user tags for", required: true
    response_field :array, "containing a list of users"

    let!(:slot) { create(:std_slot_public) }
    let!(:tags) {
      create_list(:passengership, 3, :add_media_permitted, slot: slot) }
    let(:id) { slot.id }

    example "Get all tagged users of a slot", document: :v1 do
      explanation "returns a list of user ids which are tagged to" \
                  " this slot.\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json.size).to eq(3)
    end
  end
end
