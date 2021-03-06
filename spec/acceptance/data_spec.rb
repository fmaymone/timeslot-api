require 'documentation_helper'

export_ical = nil
export_google = nil
export_outlook = nil
export_timeslot = nil

## -- TEST EXPORT SLOTS -- ##

resource "Data" do
  let!(:current_user) { create(:user, :with_email, :with_password) }
  let!(:slots) { create_list(:std_slot_public, 5, :with_media, :with_notes,
                             creator: current_user, owner: current_user) }
  let!(:groups) { create_list(:group, 4, owner: current_user) }
  let!(:containerships) { [create(:containership, slot: slots[1], group: groups[0]),
                           create(:containership, slot: slots[2], group: groups[1]),
                           create(:containership, slot: slots[3], group: groups[2])] }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  # Export Slots to the iCalendar Format
  post "/v1/export/ical" do
    header "Content-Type", "application/json"
    header "Accept", "text/plain"
    header "Authorization", :auth_header

    parameter :group, "Holds the uuid of the slot group which should be exported.\n\n" \
                      "If the parameter group is missing, all Slot will be exported.\n\n" \
                      "If the group uuid was not found, no Slot will be exported.", required: false

    context "Export all Slots without a given Group (All Slots)" do
      example "Export all created Slots of the current user to a file (iCalendar)", document: :v1 do
        explanation "returns 404 if the group uuid was not found\n\n" \
                    "returns 422 if parameters are invalid or missing\n\n" \
                    "returns 500 if an error occurs during the export"
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('BEGIN:VCALENDAR')
        expect(response_body).to include('END:VCALENDAR')
        expect(response_body).to include(slots[0].title)
        expect(response_body).to include(slots[1].title)
        expect(response_body).to include(slots[2].title)
        expect(response_body).to include(slots[3].title)
        expect(response_body).to include(slots[4].title)

        # Store export for further testings
        export_ical ||= response_body
      end
    end

    context "Export Slots related to a given Group" do
      let(:group) { groups[1].uuid }

      example "Export created Slots from the current user " \
              "related to a given Group to the iCalendar format", document: :false do
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('BEGIN:VCALENDAR')
        expect(response_body).to include('END:VCALENDAR')
        expect(response_body).not_to include(slots[0].title)
        expect(response_body).not_to include(slots[1].title)
        expect(response_body).to include(slots[2].title)
        expect(response_body).not_to include(slots[3].title)
        expect(response_body).not_to include(slots[4].title)
      end
    end

    context "Doesn't export Slots related to another Group" do
      let(:group) { groups[3].uuid }

      example "Export Slots to the iCalendar Format", document: :false do
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('BEGIN:VCALENDAR')
        expect(response_body).to include('END:VCALENDAR')
        expect(response_body).not_to include(slots[0].title)
        expect(response_body).not_to include(slots[1].title)
        expect(response_body).not_to include(slots[2].title)
        expect(response_body).not_to include(slots[3].title)
        expect(response_body).not_to include(slots[4].title)
      end
    end
  end

  # Export Slots to the Google Format
  post "/v1/export/google" do
    header "Content-Type", "application/json"
    header "Accept", "text/plain"
    header "Authorization", :auth_header

    parameter :group, "Holds the uuid of the slot group which should be exported.\n\n" \
                      "If the parameter group is missing, all Slot will be exported.\n\n" \
                      "If the group uuid was not found, no Slot will be exported.", required: false

    context "Export Slots without a given Group (All Slots)" do
      example "Export all created Slots of the current user to a file (Google)", document: :v1 do
        explanation "returns 404 if the group uuid was not found\n\n" \
                    "returns 422 if parameters are invalid or missing\n\n" \
                    "returns 500 if an error occurs during the export"
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('BEGIN:VCALENDAR')
        expect(response_body).to include('END:VCALENDAR')
        expect(response_body).to include(slots[0].title)
        expect(response_body).to include(slots[1].title)
        expect(response_body).to include(slots[2].title)
        expect(response_body).to include(slots[3].title)
        expect(response_body).to include(slots[4].title)

        # Store export for further testings
        export_google ||= response_body
      end
    end

    context "Export Slots related to a given Group" do
      let(:group) { groups[1].uuid }

      example "Export created Slots from the current user " \
              "related to a given Group to the Google format", document: :false do
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('BEGIN:VCALENDAR')
        expect(response_body).to include('END:VCALENDAR')
        expect(response_body).not_to include(slots[0].title)
        expect(response_body).not_to include(slots[1].title)
        expect(response_body).to include(slots[2].title)
        expect(response_body).not_to include(slots[3].title)
        expect(response_body).not_to include(slots[4].title)
      end
    end

    context "Doesn't export Slots related to another Group" do
      let(:group) { groups[3].uuid }

      example "Export Slots to the Google Format", document: :false do
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('BEGIN:VCALENDAR')
        expect(response_body).to include('END:VCALENDAR')
        expect(response_body).not_to include(slots[0].title)
        expect(response_body).not_to include(slots[1].title)
        expect(response_body).not_to include(slots[2].title)
        expect(response_body).not_to include(slots[3].title)
        expect(response_body).not_to include(slots[4].title)
      end
    end
  end

  # Export Slots to the Outlook Format
  post "/v1/export/outlook" do
    header "Content-Type", "application/json"
    header "Accept", "text/plain"
    header "Authorization", :auth_header

    parameter :group, "Holds the uuid of the slot group which should be exported.\n\n" \
                      "If the parameter group is missing, all Slot will be exported.\n\n" \
                      "If the group uuid was not found, no Slot will be exported.", required: false

    context "Export Slots without a given Group (All Slots)" do
      #let(:json) { JSON.parse(response_body) }

      example "Export all created Slots of the current user to a file (Outlook)", document: :v1 do
        explanation "returns 404 if the group uuid was not found\n\n" \
                    "returns 422 if parameters are invalid or missing\n\n" \
                    "returns 500 if an error occurs during the export"
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('Subject,Start_Date,Start_Time,End_Date,End_Time')
        expect(response_body).to include(slots[0].title)
        expect(response_body).to include(slots[1].title)
        expect(response_body).to include(slots[2].title)
        expect(response_body).to include(slots[3].title)
        expect(response_body).to include(slots[4].title)

        # Store export for further testings
        export_outlook ||= response_body
      end
    end

    context "Export Slots related to a given Group" do
      let(:group) { groups[1].uuid }

      example "Export created Slots from the current user " \
              "related to a given Group to the Outlook format", document: :false do
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('Subject,Start_Date,Start_Time,End_Date,End_Time')
        expect(response_body).not_to include(slots[0].title)
        expect(response_body).not_to include(slots[1].title)
        expect(response_body).to include(slots[2].title)
        expect(response_body).not_to include(slots[3].title)
        expect(response_body).not_to include(slots[4].title)
      end
    end

    context "Doesn't export Slots related to another Group" do
      let(:group) { groups[3].uuid }

      example "Export Slots to the Outlook Format", document: :false do
        do_request
        expect(response_status).to eq(200)

        expect(response_body).to start_with('Subject,Start_Date,Start_Time,End_Date,End_Time')
        expect(response_body).not_to include(slots[0].title)
        expect(response_body).not_to include(slots[1].title)
        expect(response_body).not_to include(slots[2].title)
        expect(response_body).not_to include(slots[3].title)
        expect(response_body).not_to include(slots[4].title)
      end
    end
  end

  # Export Slots to the Timeslot Format
  post "/v1/export/timeslot" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :group, "Holds the uuid of the slot group which should be exported.\n\n" \
                      "If the parameter group is missing, all Slot will be exported.\n\n" \
                      "If the group uuid was not found, no Slot will be exported.", required: false

    context "Export Slots without a given Group (All Slots)" do
      let(:location) { create(:ios_location) }
      let(:json) { JSON.parse(response_body) }
      let(:slot_titles) { slots.collect(&:title) }
      let(:slot_uuids) { slots.collect(&:slot_uuid) }

      example "Export all created Slots of the current user to a file (Timeslot)", document: :v1 do
        explanation "returns 404 if the group uuid was not found\n\n" \
                    "returns 422 if parameters are invalid or missing\n\n" \
                    "returns 500 if an error occurs during the export"

        slots.first.update(ios_location: location)
        current_user.update_alerts(slots.first, '1010101010')
        current_user.update_alerts(slots.second, '1010101010')

        do_request
        expect(response_status).to eq(200)

        expect(json.length).to be(5)
        expect(slot_titles).to include(json[0]['title'])
        expect(slot_titles).to include(json[1]['title'])
        expect(slot_titles).to include(json[2]['title'])
        expect(slot_titles).to include(json[3]['title'])
        expect(slot_titles).to include(json[4]['title'])

        expect(slot_uuids).to include(json[0]['uid'])
        expect(slot_uuids).to include(json[1]['uid'])
        expect(slot_uuids).to include(json[2]['uid'])
        expect(slot_uuids).to include(json[3]['uid'])
        expect(slot_uuids).to include(json[4]['uid'])

        # Store export for further testings
        export_timeslot ||= response_body
      end
    end

    context "Export Slots related to a given Group" do
      let(:json) { JSON.parse(response_body) }
      let(:group) { groups[1].uuid }

      example "Export created Slots from the current user " \
              "related to a given Group to the Timeslot format", document: :false do
        do_request
        expect(response_status).to eq(200)

        expect(json.length).to be(1)
        expect(json[0]['title']).not_to eq(slots[0].title)
        expect(json[0]['title']).not_to eq(slots[1].title)
        expect(json[0]['title']).to     eq(slots[2].title)
        expect(json[0]['title']).not_to eq(slots[3].title)
        expect(json[0]['title']).not_to eq(slots[4].title)
      end
    end

    context "Doesn't export Slots related to another Group" do
      let(:json) { JSON.parse(response_body) }
      let(:group) { groups[3].uuid }

      example "Export Slots to the Timeslot Format", document: :false do
        do_request
        expect(response_status).to eq(200)
        expect(json.length).to be(0)
      end
    end
  end
end

## -- TEST IMPORT SLOTS -- ##

resource "Data" do
  let!(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/import/" do
    header "Content-Type", "application/json"
    header "Accept", "text/plain"
    header "Authorization", :auth_header

    parameter :file, "The file which has to be imported.\n\n" \
                     "Supported File Formats:.\n\n" \
                     "1. iCalendar (*.ics).\n\n" \
                     "2. Google Calendar (*.ics).\n\n" \
                     "3. Microsoft Outlook (*.csv).\n\n" \
                     "4. Timeslot (*.json)", required: true

    parameter :group, "Holds the uuid of the slot group to where the " \
                      "Slots should be imported.\n\n" \
                      "If the parameter group is missing, a default slot group " \
                      "with the name 'Imports' will used instead.\n\n" \
                      "If the group uuid was not found, no Slot will be imported.", required: false

    # Import Slot from iCalendar

    context "Import Slots from a iCalendar file" do
      let(:file_contents) { export_ical }
      let(:file) do
        file = Tempfile.new('ical')
        file.write(file_contents)
        file.rewind
        file
      end

      after(:each) do
        # deletes the temp file when test was finished
        file.close
        file.unlink
      end

      context "Import Slots without a given Group" do
        example "Import Slots from a file", document: :v1 do
          explanation "returns 403 if the file includes invalid encoded chars\n\n" \
                      "returns 404 if the group uuid was not found\n\n" \
                      "returns 422 if parameters are invalid or missing\n\n" \
                      "returns 500 if an error occurs during the file import"
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = current_user.std_slots
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end

      context "Import Slots related to a given Group" do
        let!(:slot_group) { create(:group, owner: current_user) }
        let(:group) { slot_group.uuid }

        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = slot_group.slots_with_associations
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end
    end

    # Import Slot from Google

    context "Import Slots from a Google Calendar file" do
      let(:file_contents) { export_google }
      let(:file) do
        file = Tempfile.new('google')
        file.write(file_contents)
        file.rewind
        file
      end

      after(:each) do
        # deletes the temp file when test was finished
        file.close
        file.unlink
      end

      context "Import Slots without a given Group" do
        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = current_user.std_slots
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end

      context "Import Slots related to a given Group" do
        let!(:slot_group) { create(:group, owner: current_user) }
        let(:group) { slot_group.uuid }

        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = slot_group.slots_with_associations
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end
    end

    # Import Slot from Outlook

    context "Import Slots from a Outlook Calendar file" do
      let(:file_contents) { export_outlook }
      let(:file) do
        file = Tempfile.new('outlook')
        file.write(file_contents)
        file.rewind
        file
      end

      after(:each) do
        # deletes the temp file when test was finished
        file.close
        file.unlink
      end

      context "Import Slots without a given Group" do
        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = current_user.std_slots
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end

      context "Import Slots related to a given Group" do
        let!(:slot_group) { create(:group, owner: current_user) }
        let(:group) { slot_group.uuid }

        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = slot_group.slots_with_associations
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end
    end

    # Import Slot from Timeslot

    context "Import Slots from a Timeslot Calendar file" do
      let(:file_contents) { export_timeslot }
      let(:file) do
        file = Tempfile.new('timeslot')
        file.write(file_contents)
        file.rewind
        file
      end

      after(:each) do
        # deletes the temp file when test was finished
        file.close
        file.unlink
      end

      context "Import Slots without a given Group" do
        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = current_user.std_slots
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end

      context "Import Slots related to a given Group" do
        let!(:slot_group) { create(:group, owner: current_user) }
        let(:group) { slot_group.uuid }

        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)

          # After
          slots = slot_group.slots_with_associations
          expect(slots.count).to be(5)
          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)
        end
      end

      context "Import Slots and re-create groups from backup" do
        example "Import Slots from a file", document: :false do
          # Before
          expect(current_user.std_slots.count).to be(0)

          do_request
          expect(response_status).to eq(200)
          current_user.reload

          # After (Slots)
          slots = current_user.std_slots.sort_by(&:title)
          expect(slots.count).to be(5)

          expect(file_contents).to include(slots[0].title)
          expect(file_contents).to include(slots[1].title)
          expect(file_contents).to include(slots[2].title)
          expect(file_contents).to include(slots[3].title)
          expect(file_contents).to include(slots[4].title)

          expect(file_contents).to include(slots[0].ios_location.name)
          expect(file_contents).to include(slots[1].ios_location.name)
          expect(file_contents).to include(slots[2].ios_location.name)
          expect(file_contents).to include(slots[3].ios_location.name)
          expect(file_contents).to include(slots[4].ios_location.name)

          expect(slots[0].media_items.count).to eq(6)
          expect(slots[1].media_items.count).to eq(6)
          expect(slots[2].media_items.count).to eq(6)
          expect(slots[3].media_items.count).to eq(6)
          expect(slots[4].media_items.count).to eq(6)

          expect(slots[0].notes.count).to eq(3)
          expect(slots[1].notes.count).to eq(3)
          expect(slots[2].notes.count).to eq(3)
          expect(slots[3].notes.count).to eq(3)
          expect(slots[4].notes.count).to eq(3)

          expect(slots[0].slot_settings[0][:alerts]).to eq('1010101010')
          expect(slots[1].slot_settings[0][:alerts]).to eq('1010101010')
          expect(slots[2].slot_settings[0]).to eq(nil)
          expect(slots[3].slot_settings[0]).to eq(nil)
          expect(slots[4].slot_settings[0]).to eq(nil)

          # After (Groups)
          groups = current_user.own_groups.sort_by(&:name)
          expect(groups.count).to be(4) # 3 + 1 default group 'Imports'
          expect(groups[0].name).to eq('Imports')

          group_slot_titles = groups[0].slots.collect(&:title) # default group 'Imports'
          expect(group_slot_titles).to include(slots[0].title)
          expect(group_slot_titles).not_to include(slots[1].title)
          expect(group_slot_titles).not_to include(slots[2].title)
          expect(group_slot_titles).not_to include(slots[3].title)
          expect(group_slot_titles).to include(slots[4].title)

          group_slot_titles = groups[1].slots.collect(&:title)
          expect(group_slot_titles).not_to include(slots[0].title)
          expect(group_slot_titles).to include(slots[1].title)
          expect(group_slot_titles).not_to include(slots[2].title)
          expect(group_slot_titles).not_to include(slots[3].title)
          expect(group_slot_titles).not_to include(slots[4].title)

          group_slot_titles = groups[2].slots.collect(&:title)
          expect(group_slot_titles).not_to include(slots[0].title)
          expect(group_slot_titles).not_to include(slots[1].title)
          expect(group_slot_titles).to include(slots[2].title)
          expect(group_slot_titles).not_to include(slots[3].title)
          expect(group_slot_titles).not_to include(slots[4].title)

          group_slot_titles = groups[3].slots.collect(&:title)
          expect(group_slot_titles).not_to include(slots[0].title)
          expect(group_slot_titles).not_to include(slots[1].title)
          expect(group_slot_titles).not_to include(slots[2].title)
          expect(group_slot_titles).to include(slots[3].title)
          expect(group_slot_titles).not_to include(slots[4].title)

          expect(file_contents).not_to include(groups[0].name)
          expect(file_contents).to include(groups[1].name)
          expect(file_contents).to include(groups[2].name)
          expect(file_contents).to include(groups[3].name)
        end
      end
    end
  end
end
