require 'documentation_helper'

resource "Slots" do
  let(:json) { JSON.parse(response_body) }

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
      response_field :created_at, "Creation of slot"
      response_field :updated_at, "Latest update of slot in db"

      let(:slot) { create(:slot, :with_media) }
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
                 "note" => slot.note,
                 "visibility" => slot.visibility,
                 "created_at" => slot.created_at.iso8601,
                 "updated_at" => slot.updated_at.iso8601,
                 "deleted_at" => deleted_at
                )
        expect(json["media"].length).to eq(slot.media_items.length)
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

  post "/v1/slots" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :title, "Title of slot", required: true, scope: :new_slot
    parameter :startdate,
              "Startdate and Time of the Slot",
              required: true,
              scope: :new_slot
    parameter :enddate,
              "Enddate and Time of the Slot (startdate + duration)",
              required: true,
              scope: :new_slot
    parameter :note, "A note which belongs to the Slot", scope: :new_slot
    parameter :visibility, "Visibility of the Slot", scope: :new_slot

    describe "Create slot with valid params" do

      response_field :id, "ID of the new slot"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:enddate) { "2014-09-13T22:03:24.000Z" }
      let(:note) { "revolutionizing the calendar" }
      let(:visibility) { 10 }

      example "Create slot returns ID of new slot",
              document: :v1 do
        explanation "Missing unrequiered fields will be filled" \
                    " with default values.\n\n" \
                    "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameters are invalid\n\n" \
                    "returns 422 if required parameters are missing"
        do_request

        expect(json).to have_key("id")
        expect(response_status).to eq(201)
      end
    end

    describe "Create slot with invalid params" do

      response_field :pgerror, "Explanation which param couldn't be saved"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }
      let(:enddate) { "2014-09-13T22:03:24.000Z" }
      let(:alerts) { "oh no" }

      example "Create slot with invalid params returns 422 & failure details",
              document: false do
        skip "no alerts on slot model anymore"
        explanation "Parameters that can not be written to db will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("pgerror")
      end

    end

    describe "Create slot with missing requiered params" do

      response_field :enddate, "The missing parameter"

      let(:title) { "Time for a Slot" }
      let(:startdate) { "2014-09-08T13:31:02.000Z" }

      example "Create slot with missing requiered params returns 422" \
              " & failure details", document: false do
        explanation "Missing requiered fields will be returned."
        do_request

        expect(response_status).to eq 422
        expect(json).to have_key("enddate")
      end

    end
  end

  patch "/v1/slots/:id" do
    header "Content-Type", "application/json"

    parameter :id, "ID of the slot to update", required: true

    describe "Update an existing slot with valid non-media params" do

      parameter :title, "Updated title of slot", scope: :slot
      parameter :startdate, "Updated Startdate and Time of the Slot",
                scope: :slot
      parameter :enddate,
                "Updated Enddate and Time of the Slot (startdate + duration)",
                scope: :slot
      parameter :note, "Updated note for to the Slot", scope: :slot
      parameter :visibility, "Updated visibility for the Slot", scope: :slot

      let!(:slot) { create(:slot, :with_media) }
      let(:id) { slot.id }
      let(:title) { "New title for a Slot" }

      example "Update an existing slot with valid non-media params" \
              " returns No Content", document: :v1 do
        explanation "Changing title of slot\n\n" \
                    "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(204)
        expect(response_body).to eq("")
      end
    end

    describe "Adding media items to existing slot" do

      parameter :new_media, "Scope for attributes of new media item",
                required: true
      parameter :media_type, "Type of media (image/video/voice)",
                required: true,
                scope: :new_media
      parameter :public_id, "Cloudinary ID / URL",
                required: true,
                scope: :new_media
      parameter :ordering, "Order of the new media item." \
                           " If not submitted it will be added at the end",
                scope: :new_media

      response_field :media_item_id, "Timeslot internal ID for this media item"

      let!(:slot) { create(:slot) }
      let(:id) { slot.id }
      let(:media_type) { "image" }
      let(:public_id) { "v1234567/dfhjghjkdisudgfds7iyf.jpg" }
      let(:ordering) { "1" }

      example "Adding media items to existing slot returns ID & status created",
              document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary client updates the slot with the image" \
                    " information."
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key("media_item_id")
        expect(Slot.last.media_items.size).to eq(1)
      end
    end

    describe "Reordering media data of existing slot" do

      parameter :media_type, "Type of media (image/video/voice)",
                required: true
      parameter :ordering_media, "Array with media_item_ids and ordering",
                required: true
      parameter :media_item_id, "Timeslot's internal ID for this media item",
                required: true,
                scope: :ordering_media
      parameter :ordering, "Order of the image (ignored for video/voice)",
                required: true,
                scope: :ordering_media

      let!(:slot) { create(:slot) }
      let!(:media_item_1) { create(:slot_image, mediable: slot, ordering: 0) }
      let!(:media_item_2) { create(:slot_image, mediable: slot, ordering: 1) }
      let!(:media_item_3) { create(:slot_image, mediable: slot, ordering: 2) }

      let(:id) { slot.id }
      let(:media_reordering) do
        { media_type: "image",
          ordering_media: [
            { media_item_id: media_item_1.id,
              ordering: 2 },
            { media_item_id: media_item_2.id,
              ordering: 0 },
            { media_item_id: media_item_3.id,
              ordering: 1 }
          ] }
      end
      let(:raw_post) { media_reordering.to_json }

      example "Reordering media data of existing slot returns success",
              document: :v1 do
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

  delete "/v1/slots/:id" do
    parameter :id, "ID of the slot to delete", required: true

    describe "Delete slot with valid ID" do

      let!(:slot) { create(:slot, :with_media) }
      let(:id) { slot.id }

      example "Delete slot sets 'deleted_at' and returns slot data",
              document: :v1 do
        explanation "Doesn't delete anything.\n\n" \
                    "returns 404 if ID is invalid"
        do_request

        slot.reload
        expect(slot.deleted_at).not_to be nil
        expect(response_status).to eq(200)
        expect(json).to include(slot.attributes.as_json)
      end
    end

    describe "Delete slot with invalid ID" do
      let(:id) { 1 }

      example "Delete slot with invalid ID returns Not found",
              document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end
end
