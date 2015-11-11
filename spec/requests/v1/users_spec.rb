require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/users" do
    it "returns success" do
      get "/v1/users", {}, auth_header
      expect(response.status).to be(200)
    end
  end

  describe "GET /v1/user/:id" do
    context "with valid ID" do
      it "returns the requested user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json['username']).to eq(current_user.username)
      end
    end

    context "without valid Auth Header" do
      it "returns unauthorized" do
        get "/v1/users/#{current_user.id}"
        expect(response).to have_http_status :unauthorized
        expect(response.body).to include "Bad credentials"
      end
    end

    context "return friendships via json" do
      let!(:friendship) { create_list(:friendship, 7, user: current_user) }

      it "return all friendships for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('friendships')
        expect(
          json['friendships'][0]['friend_id']
        ).to eq(current_user.initiated_friendships.active[0].friend_id)
        expect(json['friendships'].length).to eq(current_user.friendships.length)
      end
    end

    context "json active friends counter" do
      let!(:friendship) { create(:friendship, :established, user: current_user) }

      it "return number of established friends for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('friendsCount')
        expect(json['friendsCount']).to be(1)
        expect(json['friendsCount']).to eq(current_user.friends.length)
      end
    end

    context "json std_slots counter" do
      let(:stranger) { create(:user, :with_public_slot) }
      let!(:my_slots) do
        create(:std_slot_private, owner: current_user)
        create(:std_slot_public, owner: current_user)
      end
      let!(:not_my_slot) { create(:std_slot_public) }

      it "return number of all std_slots for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('slotCount')
        expect(json['slotCount']).to eq 2
      end

      it "return number of public std_slots for stranger" do
        get "/v1/users/#{stranger.id}", {}, auth_header
        expect(json).to have_key('slotCount')
        expect(json['slotCount']).to eq 1
      end
    end

    context "json reslots counter" do
      let!(:re_slot) { create(:re_slot, slotter: current_user) }
      let!(:not_my_reslot) { create(:re_slot) }

      it "return number of re_slots for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key 'reslotCount'
        expect(json['reslotCount']).to eq 1
      end
    end

    context "return group membership via json" do
      let!(:membership) { create(:membership, :active, user: current_user) }
      let!(:other_membership) { create(:membership, :active) }

      it "return group memberships for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key 'memberships'
        expect(json['memberships'].size).to eq 1
        expect(json['memberships'].first['groupId']).to eq membership.group_id
      end
    end
  end

  describe "POST /v1/users" do
    describe "with valid params" do
      context "email" do
        let(:valid_attributes) {
          attributes_for(:user, :with_email, :with_password)
        }
        it "returns ID of created user" do
          post "/v1/users", valid_attributes
          expect(json).to have_key('id')
        end
      end

      context "phone" do
        let(:valid_attributes) {
          attributes_for(:user, :with_phone, :with_password)
        }
        it "returns ID of created user" do
          post "/v1/users", valid_attributes
          expect(json).to have_key('id')
        end
      end
    end

    describe "with invalid params" do
      let(:missing_email_and_phone) { { username: 'foo', password: 'foo' } }
      let(:missing_password) { { username: 'foo', email: 'test@timeslot.com' } }

      it "returns an error if email or phone is missing" do
        post "/v1/users", missing_email_and_phone
        expect(json).to have_key "error"
        expect(response.body).to include 'email'
      end

      it "returns an error if no password supplied" do
        post "/v1/users", missing_password
        expect(json).to have_key "error"
        expect(response.body).to include 'password'
      end
    end
  end

  describe "POST /v1/users/signin" do
    describe "with valid params" do
      context "email" do
        let!(:user) { create(:user, :with_email, password: 'timeslot') }
        let(:valid_attributes) {
          { email: user.email, password: 'timeslot' }
        }
        it "returns OK" do
          post "/v1/users/signin", valid_attributes
          expect(response).to have_http_status(:ok)
        end

        it "creates a new auth_token for user" do
          expect {
            post "/v1/users/signin", valid_attributes
            user.reload
          }.to change(user, :auth_token)
        end

        it "returns auth_token for user" do
          post "/v1/users/signin", valid_attributes
          expect(json).to have_key('authToken')
        end
      end

      context "phone" do
        let!(:user) { create(:user, :with_phone, password: 'timeslot') }
        let(:valid_attributes) {
          { phone: user.phone, password: 'timeslot' }
        }
        it "returns OK" do
          post "/v1/users/signin", valid_attributes
          expect(response).to have_http_status(:ok)
        end

        it "creates a new auth_token for user" do
          expect {
            post "/v1/users/signin", valid_attributes
            user.reload
          }.to change(user, :auth_token)
        end

        it "returns auth_token for user" do
          post "/v1/users/signin", valid_attributes
          expect(json).to have_key('authToken')
        end
      end
    end

    describe "with invalid params" do
      let!(:user) { create(:user, :with_email, :with_phone, password: 'short') }
      let(:invalid_attributes) {
        { email: user.email, password: 'not timeslot' }
      }
      it "returns unauthorized" do
        post "/v1/users/signin", invalid_attributes
        expect(response).to have_http_status :unauthorized
      end

      it "returns an error" do
        post "/v1/users/signin", invalid_attributes
        expect(json).to have_key "error"
      end

      it "returns unauthorized" do
        post "/v1/users/signin", { phone: user.phone, password: 'longer' }
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe "GET /v1/users/signout" do
    it "invalidates the auth token" do
      get "/v1/users/signout", {}, auth_header
      current_user.reload
      expect(current_user.auth_token).to be nil
    end
  end

  describe "POST /v1/users/reset" do
    context "valid params", :vcr do
      it "returns ok" do
        post "/v1/users/reset", { email: current_user.email }, auth_header
        expect(response).to have_http_status :ok
      end

      it "resets the password for the user" do
        expect {
          post "/v1/users/reset", { email: current_user.email }, auth_header
          current_user.reload
        }.to change(current_user, :password_digest)
      end
    end

    context "invalid params" do
      it "doesn't fail for unknown email address" do
        expect {
          post "/v1/users/reset", { email: 'blabla@gmail.com' }, auth_header
        }.not_to raise_error
      end

      it "returns :not_found for unknown email" do
        post "/v1/users/reset", { email: 'blabla@gmail.com' }, auth_header
        expect(response).to have_http_status :not_found
      end

      it "returns :unprocessable_entity if email missing" do
        post "/v1/users/reset", {}, auth_header
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe "PATCH /v1/users" do
    context "with valid params" do
      context "username" do
        it "responds with http OK" do
          patch "/v1/users", { username: "foo" }, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "updates the username of a given user" do
          patch "/v1/users", { username: "New username" }, auth_header
          current_user.reload
          expect(current_user.username).to eq("New username")
        end

        it "doesn't update the auth_token if new username" do
          old_token = current_user.auth_token
          patch "/v1/users", { username: "newname" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new username" do
          old_digest = current_user.password_digest
          patch "/v1/users", { username: "newname" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "email" do
        it "updates the email of a given user" do
          patch "/v1/users", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.email).to eq("newmail@timeslot.com")
        end

        it "doesn't update the auth_token if new email" do
          old_token = current_user.auth_token
          patch "/v1/users", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new email" do
          old_digest = current_user.password_digest
          patch "/v1/users", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "phone" do
        it "updates the phone of a given user" do
          patch "/v1/users", { phone: "1423423134" }, auth_header
          current_user.reload
          expect(current_user.phone).to eq("1423423134")
        end

        it "doesn't update the auth_token if new phone" do
          old_token = current_user.auth_token
          patch "/v1/users", { phone: "1423423134" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new phone" do
          old_digest = current_user.password_digest
          patch "/v1/users", { phone: "123123213" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "password" do
        let(:current_user) { create(:user, :with_email, password: 'timeslot') }

        it "updates the password_digest if new password" do
          old_digest = current_user.password_digest
          patch "/v1/users", { old_password: "timeslot",
                               password: "newsecret" }, auth_header
          current_user.reload
          expect(old_digest.eql? current_user.password_digest).to be false
        end

        it "allows signin with the new password" do
          patch "/v1/users", { old_password: "timeslot",
                               password: "newsecret" }, auth_header
          current_user.reload
          expect(current_user.try(:authenticate, "newsecret")).to eq current_user
        end

        it "doesn't update the auth_token if new password" do
          old_token = current_user.auth_token
          patch "/v1/users", { old_password: "timeslot",
                               password: "newsecret" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        context "invalid data" do
          it "missing old password returns error" do
            patch "/v1/users", { password: "newsecret" }, auth_header
            expect(response).to have_http_status :unprocessable_entity
            expect(json).to have_key 'error'
          end

          it "missing old password doesn't change password_digest" do
            old_digest = current_user.password_digest
            patch "/v1/users", { password: "newsecret" }, auth_header
            current_user.reload
            expect(old_digest.eql? current_user.password_digest).to be true
          end

          it "incorrect old password" do
            patch "/v1/users", { old_password: "slimetot",
                                 password: "newsecret" }, auth_header
            expect(response).to have_http_status :unauthorized
          end

          it "incorrect old password doesn't change password_digest" do
            old_digest = current_user.password_digest
            patch "/v1/users", { old_password: "slimetot",
                                 password: "newsecret" }, auth_header
            current_user.reload
            expect(old_digest.eql? current_user.password_digest).to be true
          end
        end
      end

      context "other attributes" do
        it "updates the public URL of a given user" do
          patch "/v1/users", { publicUrl: 'uffie' }, auth_header
          current_user.reload
          expect(current_user.public_url).to eq 'uffie'
        end

        it "updates the push notification state of a given user" do
          patch "/v1/users", { push: true }, auth_header
          current_user.reload
          expect(current_user.push).to be true
        end

        it "updates the location of a given user" do
          patch "/v1/users", { location: { name: 'Bonn' } }, auth_header
          current_user.reload
          expect(current_user.location.name).to eq('Bonn')
        end

        it "updates the slot default location id of a given user" do
          patch "/v1/users", { slotDefaultLocationId: '323323232' }, auth_header
          current_user.reload
          expect(current_user.slot_default_location_id).to eq(323323232)
        end

        it "updates the slot_default_duration of a given user" do
          patch "/v1/users", { slotDefaultDuration: 1000000 }, auth_header
          current_user.reload
          expect(current_user.slot_default_duration).to eq(1000000)
        end

        it "updates the default slot type of a given user" do
          skip 'needs slottype table'
          patch "/v1/users", { slotDefaultType: 'StdSlotPrivate' }, auth_header
          current_user.reload
          expect(current_user.slot_default_type).to eq(StdSlotPrivate)
        end
      end
    end

    context "with invalid params" do
      it "responds with http status Unprocessable Entity (422)" do
        patch "/v1/users", { username: "" }, auth_header
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /v1/users" do
    it "returns success" do
      delete "/v1/users", {}, auth_header
      expect(response).to be_success
    end

    it "sets deleted_at for current_user" do
      delete "/v1/users", {}, auth_header
      current_user.reload
      expect(current_user.deleted_at?).to be true
    end

    it "doesn't delete the current user" do
      expect(current_user).not_to be nil # make sure he exists
      expect {
        delete "/v1/users", {}, auth_header
      }.not_to change(User, :count)
    end
  end

  describe "PATCH /v1/users/device" do
    it "returns success" do
      patch "/v1/users/device", { deviceId: 'id-34273647263' }, auth_header
      expect(response.status).to be(200)
    end

    context "invalid parameters" do
      it "doesn't update the device if parameters are empty" do
        patch "/v1/users/device", {}, auth_header
        expect(response.status).to be(422)
      end

      it "doesn't update the device if deviceId is invalid" do
        patch "/v1/users/device", { deviceId: nil }, auth_header
        expect(response.status).to be(422)
      end

      it "doesn't update the device if token is invalid" do
        auth_header = { 'Authorization' => "Token token=kh34gshg5345hg3g54" }
        patch "/v1/users/device", {}, auth_header
        expect(response.status).to be(401)
      end
    end
  end

  describe "GET /v1/users/:id/slots" do
    context "current_user requesting own slots" do
      describe "get slots for user, no pagination" do
        let(:group_member) { create(:membership, user: current_user) }
        let!(:group_slot) { create(:group_slot, group: group_member.group) }
        let!(:slots) do
          slots = []
          slots.push create(:std_slot_private, owner: current_user)
          slots.push create(:std_slot_friends, owner: current_user)
          slots.push create(:std_slot_public, owner: current_user)
          slots.push(*create_list(:re_slot, 2, slotter: current_user))
        end

        it "returns success" do
          get "/v1/users/#{current_user.id}/slots", {}, auth_header
          expect(response.status).to be(200)
        end

        it "returns all stdslots & reslots for the current_user" do
          get "/v1/users/#{current_user.id}/slots", {}, auth_header
          expect(json.length).to eq slots.size
        end

        it "excludes groupslots of the current_user" do
          get "/v1/users/#{current_user.id}/slots", {}, auth_header
          expect(response.body).not_to include group_slot.title
        end
      end

      describe "my Slots, with pagination", :keep_slots do
        before(:all) do
          @current_user = create(:user, :with_email, :with_password)
          @auth_header = {
            'Authorization' => "Token token=#{@current_user.auth_token}" }

          # upcoming slots
          create(:std_slot_private,
                 start_date: Time.zone.tomorrow,
                 title: 'not my upcoming slot')
          create(:std_slot_private,
                 start_date: Time.zone.tomorrow,
                 title: 'upcoming slot',
                 owner: @current_user)
          create(:std_slot_private,
                 start_date: Time.zone.today.next_week.end_of_day,
                 end_date: Time.zone.today.next_week.next_month,
                 title: 'upcoming slot A',
                 owner: @current_user)
          create(:std_slot_private,
                 start_date: Time.zone.today.next_week.end_of_day,
                 end_date: Time.zone.today.next_week.next_month,
                 title: 'upcoming slot B',
                 owner: @current_user)
          create_list(:std_slot_private, 3,
                      start_date: Time.zone.tomorrow,
                      owner: @current_user)
          create(:re_slot,
                 start_date: Time.zone.tomorrow.midday,
                 end_date: Time.zone.tomorrow.next_week.end_of_day,
                 title: 'upcoming reslot',
                 slotter: @current_user)
          # ongoing slots
          create(:std_slot_friends,
                 start_date: Time.zone.yesterday,
                 end_date: Time.zone.tomorrow,
                 title: 'ongoing slot',
                 owner: @current_user)
          create_list(:std_slot_friends, 12,
                      start_date: Time.zone.yesterday,
                      end_date: Time.zone.tomorrow,
                      title: 'ongoing slots',
                      owner: @current_user)
          create(:re_slot,
                 start_date: Time.zone.yesterday,
                 end_date: Time.zone.tomorrow,
                 title: 'ongoing reslot',
                 slotter: @current_user)
          # past slots
          create(:std_slot_public,
                 start_date: Time.zone.yesterday.last_year,
                 end_date: Time.zone.today.last_year,
                 title: 'long ago slot',
                 owner: @current_user)
          create(:std_slot_public,
                 start_date: Time.zone.yesterday.at_midday,
                 end_date: Time.zone.yesterday.end_of_day,
                 title: 'past slot',
                 owner: @current_user)
          create_list(:std_slot_public, 13,
                      start_date: Time.zone.yesterday.at_midday,
                      end_date: Time.zone.yesterday.end_of_day,
                      title: 'past slots',
                      owner: @current_user)
          create(:re_slot,
                 start_date: Time.zone.yesterday.last_month,
                 end_date: Time.zone.today.last_month,
                 title: 'past reslot',
                 slotter: @current_user)
        end

        describe "GET slots for current user" do
          let(:limit) { 4 }
          let(:query_string) {
            { status: status, moment: Time.zone.now.as_json, limit: limit } }

          describe "paginate" do
            context "via 'after' cursor" do
              let(:limit) { 3 }
              let(:filter) { 'upcoming' }

              it "returns all slots after 'moment'" do
                # first request without a cursor
                get "/v1/users/#{@current_user.id}/slots", query_string,
                    @auth_header

                expect(response.status).to be(200)
                resp = JSON.parse(response.body)
                result_count = resp['data'].size

                # receive a cursor for further requests
                cursor = resp['paging']['after']
                expect(cursor).not_to be nil
                previous_result = resp['data']

                while cursor
                  # paginate through the result
                  get "/v1/users/#{@current_user.id}/slots",
                      { filter: filter, after: cursor, limit: limit },
                      @auth_header

                  expect(response.status).to be(200)

                  json = JSON.parse(response.body)
                  cursor = json['paging']['after']
                  result = json['data']

                  if result.empty?
                    expect(previous_result.first['title'])
                      .to eq upcoming_slot.title
                  else
                    result_count += result.size
                    # make sure the follow up responses return slots
                    # which are later than the slots from the previous response
                    expect(result.first['startDate'])
                      .to be >= previous_result.last['startDate']
                    if result.first['startDate'] == previous_result.last['startDate']
                      expect(result.first['endDate'])
                        .to be >= previous_result.last['endDate']
                    end
                    if result.first['endDate'] == previous_result.last['endDate']
                      expect(result.first['id'])
                        .to be >= previous_result.last['id']
                    end
                    # those should never be in the result
                    expect(response.body).not_to include 'past slot'
                    expect(response.body).not_to include 'past reslot'
                    expect(response.body).not_to include 'ongoing slot'
                    expect(response.body).not_to include 'ongoing reslot'
                    expect(response.body).not_to include 'not my upcoming slot'
                    previous_result = result
                  end
                end
                expect(result.last['title']).to eq 'upcoming slot B'

                stdslot_count = @current_user.std_slots.upcoming.count
                reslot_count = @current_user.re_slots.upcoming.count
                slot_count = stdslot_count + reslot_count
                expect(result_count).to eq slot_count
              end
            end

            context "via 'before' cursor" do
              let(:limit) { 7 }
              let(:filter) { 'upcoming' }

              it "returns all slots before 'moment'" do
                # first request without a cursor
                get "/v1/users/#{@current_user.id}/slots", query_string,
                    @auth_header

                expect(response.status).to be(200)
                resp = JSON.parse(response.body)
                result_count = resp['data'].size

                # receive a cursor for further requests
                cursor = resp['paging']['before']
                expect(cursor).not_to be nil
                result = []
                previous_result = resp['data']

                while cursor
                  # paginate through the result
                  get "/v1/users/#{@current_user.id}/slots",
                      { filter: filter, before: cursor, limit: limit },
                      @auth_header

                  expect(response.status).to be(200)

                  json = JSON.parse(response.body)
                  cursor = json['paging']['before']
                  result = json['data']

                  if result.empty?
                    expect(previous_result.first['title'])
                      .to eq long_ago_slot.title
                  else
                    result_count += result.size

                    # check the order once again
                    result.each_with_index do |slot, index|
                      break if index == result.size - 1
                      next_slot = result[index + 1]
                      expect(slot['startDate']).to be <= next_slot['startDate']
                      if slot['startDate'] == next_slot['startDate']
                        expect(slot['endDate']).to be <= next_slot['endDate']
                      end
                      if slot['endDate'] == next_slot['endDate']
                        expect(slot['id']).to be < next_slot['id']
                      end
                    end

                    # make sure the follow up responses return slots
                    # which are earlier than the slots from the previous response
                    expect(result.last['startDate'])
                      .to be <= previous_result.first['startDate']
                    if result.last['startDate'] == previous_result.first['startDate']
                      expect(result.last['endDate'])
                        .to be <= previous_result.first['endDate']
                    end
                    if result.last['endDate'] == previous_result.first['endDate']
                      expect(result.last['id'])
                        .to be <= previous_result.first['id']
                    end
                    previous_result = result
                  end
                  expect(response.body).not_to include 'not my upcoming slot'
                end

                stdslot_count = @current_user.std_slots.past.count
                reslot_count = @current_user.re_slots.past.count
                # add limit to count because first request is for upcoming
                slot_count = stdslot_count + reslot_count + limit
                expect(result_count).to eq slot_count
              end
            end
          end

          describe "ordering" do
            let(:filter) { 'now' }

            it "by startdate, enddate, slotid" do

              get "/v1/users/#{@current_user.id}/slots",
                  query_string, @auth_header

              expect(response.status).to be(200)
              result = json['data']

              result.each_with_index do |slot, index|
                break if index == result.size - 1
                next_slot = result[index + 1]
                expect(slot['startDate']).to be <= next_slot['startDate']
                if slot['startDate'] == next_slot['startDate']
                  expect(slot['endDate']).to be <= next_slot['endDate']
                end
                if slot['endDate'] == next_slot['endDate']
                  expect(slot['id']).to be < next_slot['id']
                end
              end
            end
          end

          describe "filter by slot status:" do
            let(:over_limit) { BaseSlot.all.count + 1 }

            context "all" do
              it "returns all slots" do

                get "/v1/users/#{@current_user.id}/slots",
                    { filter: 'all' }, @auth_header

                expect(response.status).to be(200)

                user_stdslot_count = @current_user.std_slots.count
                user_reslot_count = @current_user.re_slots.count
                user_slot_count = user_stdslot_count + user_reslot_count
                expect(json['data'].length) .to eq user_slot_count

                expect(response.body).to include 'ongoing slot'
                expect(response.body).to include 'upcoming slot'
                expect(response.body).to include 'past slot'
              end
            end

            context "upcoming" do
              let(:filter) { 'upcoming' }

              it "returns slots where start_date is equal or after moment" do

                get "/v1/users/#{@current_user.id}/slots",
                    { filter: filter},
                    @auth_header

                expect(response.status).to be(200)
                now = Time.zone.now
                json['data'].each do |slot|
                  expect(slot['startDate']).to be >= now
                end
                expect(response.body).to include 'upcoming slot'
                expect(response.body).not_to include 'ongoing slot'
                expect(response.body).not_to include 'past slot'
              end

              it "doesn't return 'after' cursor if no more results" do
                get "/v1/users/#{@current_user.id}/slots",
                    { filter: filter, limit: over_limit },
                    @auth_header
                expect(response.status).to be(200)
                expect(json['paging']['after']).to be nil
              end
            end

            context "past" do
              let(:filter) { 'past' }

              it "returns slots where start_date is before moment" do

                get "/v1/users/#{@current_user.id}/slots",
                    { filter: filter },
                    @auth_header

                expect(response.status).to be(200)
                now = Time.zone.now
                json['data'].each do |slot|
                  expect(slot['startDate']).to be < now
                end
                expect(response.body).to include 'past slot'
                expect(response.body).to include 'ongoing slot'
                expect(response.body).not_to include 'upcoming slot'
              end

              it "doesn't return 'before' cursor if no more results" do
                get "/v1/users/#{@current_user.id}/slots",
                    { filter: filter, limit: over_limit },
                    @auth_header
                expect(response.status).to be(200)
                expect(json['paging']['before']).to be nil
              end
            end

            context "finished" do
              it "returns slots where start & end is before moment" do

                get "/v1/users/#{@current_user.id}/slots",
                    { filter: 'finished' },
                    @auth_header

                expect(response.status).to be(200)
                now = Time.zone.now
                json['data'].each do |slot|
                  expect(slot['endDate']).to be < now
                end
                expect(response.body).to include 'past slot'
                expect(response.body).not_to include 'ongoing slot'
                expect(response.body).not_to include 'upcoming slot'
              end
            end

            context "ongoing" do
              it "returns slots where start is before & end is after moment" do

                get "/v1/users/#{@current_user.id}/slots",
                    { filter: 'ongoing' },
                    @auth_header

                expect(response.status).to be(200)
                now = Time.zone.now
                json['data'].each do |slot|
                  expect(slot['startDate']).to be < now
                  expect(slot['endDate']).to be > now
                end
                expect(response.body).to include 'ongoing slot'
                expect(response.body).not_to include 'upcoming slot'
                expect(response.body).not_to include 'past slot'
              end
            end

            context "now" do
              it "returns ongoing and upcoming slots" do

                get "/v1/users/#{@current_user.id}/slots",
                    { filter: 'now', moment: Time.zone.now.as_json },
                    @auth_header

                expect(response.status).to be(200)
                expect(response.body).to include 'upcoming slot'
                expect(response.body).to include 'ongoing slot'
                expect(response.body).to include 'ongoing reslot'
                expect(response.body).not_to include 'past slot'
                expect(response.body).not_to include 'not my upcoming slot'
                expect(json).to have_key 'paging'
                expect(json['paging']).to have_key 'moment'
                expect(json['paging']).to have_key 'limit'
                expect(json['paging']).to have_key 'before'
              end
            end
          end

          describe "GET slots for befriended user" do
            let(:friend) do
              friend = create(:user)
              create(:friendship, :established,
                     user: @current_user, friend: friend)
              friend
            end

            it "returns ok" do
              get "/v1/users/#{@current_user.id}/slots", { filter: 'now' },
                  'Authorization' => "Token token=#{friend.auth_token}"
              expect(response).to have_http_status :ok
            end

            it "doesn't return private slots of user" do
              get "/v1/users/#{@current_user.id}/slots", { filter: 'all' },
                  'Authorization' => "Token token=#{friend.auth_token}"

              expect(response.body).not_to include 'not my upcoming slot'
              expect(response.body).not_to include 'upcoming slot'
              expect(response.body).not_to include 'upcoming slot A'
              expect(response.body).not_to include 'upcoming slot B'
            end

            it "returns friend-visible slots of user" do
              get "/v1/users/#{@current_user.id}/slots", { filter: 'now' },
                  'Authorization' => "Token token=#{friend.auth_token}"

              expect(response.body).to include 'ongoing slot'
              expect(response.body).to include 'ongoing slots'
            end

            it "returns public slots of user" do
              get "/v1/users/#{@current_user.id}/slots", { filter: 'all' },
                  'Authorization' => "Token token=#{friend.auth_token}"

              expect(response.body).to include 'ongoing reslot'
              expect(response.body).to include 'upcoming reslot'
              expect(response.body).to include 'past slot'
              expect(response.body).to include 'long ago slot'
            end

            context "group slots" do
              let(:unshared_group) { create(:group, owner: friend) }
              let!(:unshared_groupslot) {
                create(:group_slot, group: unshared_group) }

              let(:shared_group) do
                group = create(:group, :members_can_post)
                create(:membership, :active, group: group, user: @current_user)
                create(:membership, :active, group: group, user: friend)
                group
              end
              let!(:shared_groupslot) {
                create(:group_slot, group: shared_group) }

              it "returns shared group slots" do
                get "/v1/users/#{@current_user.id}/slots", { filter: 'now' },
                    'Authorization' => "Token token=#{friend.auth_token}"

                expect(response.body).not_to include unshared_groupslot.title
                expect(response.body).to include shared_groupslot.title
              end
            end
          end

          describe "GET slots for unrelated user" do
            context "when logged in" do
              skip 'TODO: spec paginate slots of unrelated user'
            end

            context "when visitor" do
              # missing spec -> here comes the bug: BKD-293
              it "returns ok" do
                get "/v1/users/#{@current_user.id}/slots", filter: 'now'
                expect(response).to have_http_status :ok
              end

              it "only returns public slots" do
                get "/v1/users/#{@current_user.id}/slots", filter: 'all'
                expect(response.body).not_to include 'not my upcoming slot'
                expect(response.body).not_to include 'upcoming slot'
                expect(response.body).not_to include 'ongoing slot'
                expect(response.body).to include 'ongoing reslot'
                expect(response.body).to include 'past slot'
              end
            end
          end
        end
      end
    end
  end

  describe "GET /v1/users/:id/media" do
    let!(:target_user) { create(:user) }
    let!(:slot_public) { create(:std_slot_public, :with_media,
                                owner: target_user, creator: target_user) }
    let!(:slot_private) { create(:std_slot_private, :with_media,
                                 owner: target_user, creator: target_user) }

    context "Get all media items for the current_user" do
      let(:auth_header) do
        { 'Authorization' => "Token token=#{target_user.auth_token}" }
      end

      it "Returns an array which includes all media items of the current_user." do
        get "/v1/users/#{target_user.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(target_user.media_for(target_user).size)
        expect(json.length).to eq(12)
      end
    end

    context "Get all public media items of a specific user" do
      it "Returns an array which includes all public media items of a specific user." do
        get "/v1/users/#{target_user.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(target_user.media_for(current_user).count)
        expect(json.length).to eq(6)
      end
    end

    context "Get all friend-visible media items of a user" do
      let!(:friend) { create(:user) }
      let!(:slot_friend) { create(:std_slot_friends, :with_media,
                                  owner: friend, creator: friend) }
      let!(:friendship) { create(:friendship, :established,
                                 user: current_user, friend: friend) }

      it "Returns an array which includes all media items of this user " \
         "which are public or friend-visible." do
        get "/v1/users/#{friend.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(friend.media_for(current_user).count)
        expect(json.length).to eq(6)
      end
    end

    context "Get group-related media items of a user with a common group" do
      let!(:member) { create(:user) }
      let!(:slot_group) { create(:group_slot, :with_media, creator: member) }
      let!(:memberships) {
        create(:membership, :active, group: slot_group.group, user: current_user)
        create(:membership, :active, group: slot_group.group, user: member)
      }

      it "Returns an array which includes all media " \
         "items of a specific user with a common group." do
        get "/v1/users/#{member.id}/media", {}, auth_header
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(member.media_for(current_user).count)
        expect(json.length).to eq(6)
      end
    end
  end

  describe "POST /v1/users/add_friends" do
    let(:john) { create(:user, username: "John") }

    context "no offer" do
      it "creates a friend request" do
        post "/v1/users/add_friends", { ids: [john.id] }, auth_header
        expect(john.offered_friendship(current_user.id)).not_to be nil
      end
    end

    context "existing offer" do
      let!(:friendship) {
        create(:friendship, user: john, friend: current_user)
      }
      it "accepts a friend request" do
        expect(friendship.established?).to be false
        post "/v1/users/add_friends", { ids: [john.id] }, auth_header
        friendship.reload
        expect(friendship.established?).to be true
      end
    end
  end

  describe "GET /v1/users/friendslots" do
    let(:bob) { create(:user, :with_private_slot) }
    let!(:bob_slots) do
      create(:re_slot, slotter: bob)
      create(:std_slot_friends, owner: bob, title: 'bobslot')
      create(:std_slot_friends, owner: bob, title: 'bobslot-past',
             start_date: Time.zone.yesterday)
    end

    let!(:friendships) {
      create(:friendship, :established,
             user: create(:user, :with_friend_slot),
             friend: current_user)
      create(:friendship, :established,
             user: current_user,
             friend: create(:user, :with_public_slot))
      create(:friendship, :established, user: bob, friend: current_user)
    }

    it "returns success" do
      get "/v1/users/friendslots", {}, auth_header
      expect(response.status).to be(200)
    end

    it "includes all the right slots" do
      get "/v1/users/friendslots", {}, auth_header
      expect(response.body).to include 'bobslot'
      expect(json.size).to be 4
    end

    it "orders the slots by startdate" do
      get "/v1/users/friendslots", {}, auth_header
      expect(json.first['startDate']).to be <= json.second['startDate']
      expect(json.second['startDate']).to be <= json.third['startDate']
      expect(json.third['startDate']).to be <= json.last['startDate']
    end

    it "only includes upcoming slots" do
      get "/v1/users/friendslots", {}, auth_header
      expect(json.first['startDate']).to be >= Time.zone.now
      expect(response.body).not_to include 'bobslot-past'
    end

    context "pagination" do
      let(:limit) { 4 }
      let(:query_string) {
        { status: status, moment: Time.zone.now.as_json, limit: limit } }

      it "returns success" do
        get "/v1/users/friendslots", query_string, auth_header
        expect(response.status).to be(200)
      end

      it "returns pagination metadata" do
        skip 'TODO: paginate slots of users friends'
        get "/v1/users/friendslots", query_string, auth_header
        expect(json).to have_key 'paging'
        expect(json['paging']).to have_key 'moment'
        expect(json['paging']).to have_key 'limit'
        expect(json['paging']).to have_key 'before'
      end
    end
  end
end
