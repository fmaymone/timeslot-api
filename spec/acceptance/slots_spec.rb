require 'documentation_helper'

resource "Slots" do

  let(:slot) { create(:slot) }

  get "/v1/slots/:id" do
    let(:id) { slot.id }

    example "Getting a specific slot", document: :v1  do
      do_request
      expect(status).to eq(200)
    end
  end

  post "/v1/slots" do
    header "Content-Type", "application/json"

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

    response_field :title, "Title of slot", "Type" => "String"

    let(:title) { "Time for a Slot" }
    let(:startdate) { "2014-09-08T13:31:02.000Z" }
    let(:enddate) { "2014-09-13T22:03:24.000Z" }
    let(:note) { "revolutionizing the calendar" }
    let(:visibility) { 10 }
    let(:alerts) { "0101001100" }

    context "no parameters" do
      example "Creating a slot", document: :v1  do
        explanation "Create a new slot."
        do_request

        json = JSON.parse(response_body)
        expect(json.except("id", "created_at", "updated_at"))
          .to eq("title" => title,
                 "startdate" => startdate,
                 "enddate" => enddate,
                 "note" => note,
                 "visibility" => visibility,
                 "alerts" => alerts
                )
        expect(status).to eq(201)
      end
    end
  end
end
