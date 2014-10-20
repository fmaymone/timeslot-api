require 'documentation_helper'

resource "Slots" do

  get "/v1/slots/:id" do
    header "Accept", "application/json"

    parameter :id, "ID of the slot to get", required: true

    response_field :id, "ID of the slot"
    response_field :title, "Title of the slot"
    response_field :startdate, "Startdate of the slot"
    response_field :enddate, "Enddate of the slot"
    response_field :note, "A note on the slot"
    response_field :visibility, "Visibiltiy of the slot"
    response_field :alerts, "Alerts for the slot"

    let(:slot) { create(:slot_with_media) }
    let(:id) { slot.id }

    example "Get a specific slot", document: :v1 do
      do_request

      json = JSON.parse(response_body)
      expect(json.except("id"))
        .to eq("title" => slot.title,
               "startdate" => slot.startdate.iso8601,
               "enddate" => slot.enddate.iso8601,
               "note" => slot.note,
               "visibility" => slot.visibility,
               "alerts" => slot.alerts,
               "images" => slot.images,
               "audio" => slot.audio,
               "video" => slot.video
              )
      expect(response_status).to eq(200)
    end
  end

  post "/v1/slots" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :title, "Title of slot", required: true
    parameter :startdate,
              "Startdate and Time of the Slot",
              required: true
    parameter :enddate,
              "Enddate and Time of the Slot (startdate + duration)",
              required: true
    parameter :note, "A note which belongs to the Slot"
    parameter :visibility, "Visibility of the Slot"
    parameter :alerts, "Alerts for the Slot"

    response_field :id, "ID of the new slot", "Type" => "String"

    let(:title) { "Time for a Slot" }
    let(:startdate) { "2014-09-08T13:31:02.000Z" }
    let(:enddate) { "2014-09-13T22:03:24.000Z" }
    let(:note) { "revolutionizing the calendar" }
    let(:visibility) { 10 }
    let(:alerts) { "0101001100" }

    example "Create a new slot", document: :v1 do
      explanation "Missing unrequiered fields will be filled with default values."
      do_request

      json = JSON.parse(response_body)
      expect(json).to have_key("id")
      expect(response_status).to eq(201)
    end
  end

  patch "/v1/slots/:id" do
    header "Content-Type", "application/json"

    parameter :id, "ID of the slot to update", required: true
    parameter :title, "Updated title of slot"
    parameter :startdate, "Updated Startdate and Time of the Slot"
    parameter :enddate,
              "Updated Enddate and Time of the Slot (startdate + duration)"
    parameter :note, "Updated note for to the Slot"
    parameter :visibility, "Updated visibility for the Slot"
    parameter :alerts, "Updated alerts for the Slot"

    let!(:slot) { create(:slot_with_media) }
    let(:id) { slot.id }
    let(:title) { "New title for a Slot" }

    example "Update/Edit an existing slot.", document: :v1 do
      explanation "Changing title of slot"
      do_request

      expect(response_status).to eq(204)
      expect(response_body).to eq("")
    end
  end

  patch "/v1/slots/:id" do
    header "Content-Type", "application/json"

    parameter :id, "ID of the slot to update",
              required: true
    parameter :media_type, "Type of media (image/video/audio)"
    parameter :signed_identifier, "Calculated from cloudinary upload response",
              required: true
    parameter :img_id, "Timeslot's internal ID for this media item",
              scope: :media,
              required: true
    parameter :public_id, "Calculated from cloudinary upload response",
              scope: :media
    parameter :ordering, "Order of the image (ignored for video/audio)",
              scope: :media

    let!(:slot) { create(:slot) }
    let(:id) { slot.id }
    let(:media_type) { "image" }
    let(:signed_identifier) { "image/upload/v1234567/dfhjghjkdisudgfds7iyf.jpg#298hg20j2eoalgh3ekl" }
    let(:img_id) { "A" }
    let(:public_id) { "v1234567/dfhjghjkdisudgfds7iyf.jpg" }
    let(:ordering) { "1" }

    example "Adding image to existing slot.", document: :v1 do
      explanation "First a cloudinary signature needs to be fetched by the" \
                  " client from the API. After uploading the image to cloudinary" \
                  " client updates the slot with the image information." \
                  " For validation purposes the signed_identifier is also send."
      do_request

      expect(response_status).to eq(204)
      expect(response_body).to eq("")
      expect(Slot.last.images.size).to eq(1)
    end
  end

  delete "/v1/slots/:id" do
    parameter :id, "ID of the slot to delete", required: true

    let!(:slot) { create(:slot_with_media) }
    let(:id) { slot.id }

    example "Delete a specific slot", document: :v1 do
      do_request

      expect(response_status).to eq(204)
      expect(response_body).to eq("")
    end
  end
end
