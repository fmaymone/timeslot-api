require 'rails_helper'

RSpec.describe "V1::Me", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/me" do
    context "with valid ID" do
      it "returns the current user" do
        get "/v1/me", {}, auth_header
        expect(json['username']).to eq(current_user.username)
      end
    end

    context "without valid Auth Header" do
      it "returns unauthorized" do
        get "/v1/me"
        expect(response).to have_http_status :unauthorized
        expect(response.body).to include "missing auth_token"
      end
    end

    context "return friendships via json" do
      let!(:friendship) { create_list(:friendship, 7, user: current_user) }

      it "return all friendships for current user" do
        get "/v1/me", {}, auth_header
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
        get "/v1/me", {}, auth_header
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
        get "/v1/me", {}, auth_header
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
        get "/v1/me", {}, auth_header
        expect(json).to have_key 'reslotCount'
        expect(json['reslotCount']).to eq 1
      end
    end

    context "return group membership via json" do
      let!(:membership) { create(:membership, :active, user: current_user) }
      let!(:other_membership) { create(:membership, :active) }

      it "return group memberships for current user" do
        get "/v1/me", {}, auth_header
        expect(json).to have_key 'memberships'
        expect(json['memberships'].size).to eq 1
        expect(json['memberships'].first['groupId']).to eq membership.group_id
      end
    end
  end

  describe "PATCH /v1/me" do
    context "with valid params" do
      context "username" do
        it "responds with http OK" do
          patch "/v1/me", { username: "foo" }, auth_header
          expect(response).to have_http_status(:ok)
        end

        it "updates the username of the current user" do
          patch "/v1/me", { username: "New username" }, auth_header
          current_user.reload
          expect(current_user.username).to eq("New username")
        end

        it "doesn't update the auth_token if new username" do
          old_token = current_user.auth_token
          patch "/v1/me", { username: "newname" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new username" do
          old_digest = current_user.password_digest
          patch "/v1/me", { username: "newname" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "user image / picture" do
        it "updates the picture of the current user" do
          patch "/v1/me", { image: "v1234567/xcvjghjkdisudgfds7iyf.jpg" },
                auth_header
          current_user.reload
          expect(current_user.picture).to eq("v1234567/xcvjghjkdisudgfds7iyf.jpg")
        end

        it "returns the user image url in the json" do
          patch "/v1/me", { image: "v1234567/xcvjghjkdisudgfds7iyf.jpg" },
                auth_header
          current_user.reload
          expect(response).to have_http_status(:ok)
          expect(json).to have_key('image')
          expect(json['image']).to eq("v1234567/xcvjghjkdisudgfds7iyf.jpg")
        end
      end

      context "email" do
        it "updates the email address of the current user" do
          patch "/v1/me", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.email).to eq("newmail@timeslot.com")
        end

        it "doesn't update the auth_token if new email" do
          old_token = current_user.auth_token
          patch "/v1/me", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new email" do
          old_digest = current_user.password_digest
          patch "/v1/me", { email: "newmail@timeslot.com" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "phone" do
        it "updates the phone of the current user" do
          patch "/v1/me", { phone: "1423423134" }, auth_header
          current_user.reload
          expect(current_user.phone).to eq("1423423134")
        end

        it "doesn't update the auth_token if new phone" do
          old_token = current_user.auth_token
          patch "/v1/me", { phone: "1423423134" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        it "doesn't update the password_digest if new phone" do
          old_digest = current_user.password_digest
          patch "/v1/me", { phone: "123123213" }, auth_header
          current_user.reload
          expect(current_user.password_digest).to eq old_digest
        end
      end

      context "password" do
        let(:current_user) { create(:user, :with_email, password: 'timeslot') }

        it "updates the password_digest if new password" do
          old_digest = current_user.password_digest
          patch "/v1/me", { old_password: "timeslot",
                            password: "newsecret" }, auth_header
          current_user.reload
          expect(old_digest.eql? current_user.password_digest).to be false
        end

        it "allows signin with the new password" do
          patch "/v1/me", { old_password: "timeslot",
                            password: "newsecret" }, auth_header
          current_user.reload
          expect(current_user.try(:authenticate, "newsecret")).to eq current_user
        end

        it "doesn't update the auth_token if new password" do
          old_token = current_user.auth_token
          patch "/v1/me", { old_password: "timeslot",
                            password: "newsecret" }, auth_header
          current_user.reload
          expect(current_user.auth_token).to eq old_token
        end

        context "invalid data" do
          it "missing old password returns error" do
            patch "/v1/me", { password: "newsecret" }, auth_header
            expect(response).to have_http_status :unprocessable_entity
            expect(json).to have_key 'error'
          end

          it "missing old password doesn't change password_digest" do
            old_digest = current_user.password_digest
            patch "/v1/me", { password: "newsecret" }, auth_header
            current_user.reload
            expect(old_digest.eql? current_user.password_digest).to be true
          end

          it "incorrect old password" do
            patch "/v1/me", { old_password: "slimetot",
                              password: "newsecret" }, auth_header
            expect(response).to have_http_status :unauthorized
          end

          it "incorrect old password doesn't change password_digest" do
            old_digest = current_user.password_digest
            patch "/v1/me", { old_password: "slimetot",
                              password: "newsecret" }, auth_header
            current_user.reload
            expect(old_digest.eql? current_user.password_digest).to be true
          end
        end
      end

      context "other attributes" do
        it "updates the public URL of the current user" do
          patch "/v1/me", { publicUrl: 'uffie' }, auth_header
          current_user.reload
          expect(current_user.public_url).to eq 'uffie'
        end

        it "updates the push notification state of the current user" do
          patch "/v1/me", { push: true }, auth_header
          current_user.reload
          expect(current_user.push).to be true
        end

        it "updates the location of the current user" do
          patch "/v1/me", { location: { name: 'Bonn' } }, auth_header
          current_user.reload
          expect(current_user.location.name).to eq('Bonn')
        end

        it "updates the slot default location id of the current user" do
          patch "/v1/me", { slotDefaultLocationId: '323323232' }, auth_header
          current_user.reload
          expect(current_user.slot_default_location_id).to eq(323323232)
        end

        it "updates the slot default duration of the current user" do
          patch "/v1/me", { slotDefaultDuration: 1000000 }, auth_header
          current_user.reload
          expect(current_user.slot_default_duration).to eq(1000000)
        end

        it "updates the default slot type of the current user" do
          skip 'needs slottype table'
          patch "/v1/me", { slotDefaultType: 'StdSlotPrivate' }, auth_header
          current_user.reload
          expect(current_user.slot_default_type).to eq(StdSlotPrivate)
        end
      end
    end

    context "with invalid params" do
      it "responds with http status Unprocessable Entity (422)" do
        patch "/v1/me", { username: "" }, auth_header
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /v1/me" do
    it "returns success" do
      delete "/v1/me", {}, auth_header
      expect(response).to be_success
    end

    it "sets deleted_at for current_user" do
      delete "/v1/me", {}, auth_header
      current_user.reload
      expect(current_user.deleted_at?).to be true
    end

    it "doesn't delete the current user" do
      expect(current_user).not_to be nil # make sure he exists
      expect {
        delete "/v1/me", {}, auth_header
      }.not_to change(User, :count)
    end
  end

  describe "GET /v1/me/signout" do
    it "invalidates the auth token" do
      get "/v1/me/signout", {}, auth_header
      current_user.reload
      expect(current_user.auth_token).to be nil
    end
  end

  describe "GET /v1/me/slots" do
    context "no pagination" do
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
        get "/v1/me/slots", {}, auth_header
        expect(response.status).to be(200)
      end

      it "returns all stdslots & reslots for the current_user" do
        get "/v1/me/slots", {}, auth_header
        expect(json.length).to eq slots.size
      end

      it "excludes groupslots of the current_user" do
        get "/v1/me/slots", {}, auth_header
        expect(response.body).not_to include group_slot.title
      end
    end

    context "with pagination", :keep_data do
      let(:limit) { 4 }
      let(:query_string) {
        { filter: filter, moment: Time.zone.now.as_json, limit: limit } }

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
        create(:std_slot_foaf,
               start_date: Time.zone.yesterday.last_year,
               end_date: Time.zone.today.last_year,
               title: 'foaf past slot',
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

      describe "paginate" do
        context "via 'after' cursor" do
          let(:limit) { 3 }
          let(:filter) { 'upcoming' }

          it "returns all slots after 'moment'" do
            # first request without a cursor
            get "/v1/me/slots", query_string,
                @auth_header

            expect(response.status).to be(200)
            resp = JSON.parse(response.body)
            result_count = resp['data'].size
            expect(resp['paging']['filter']).to eq filter

            # receive a cursor for further requests
            cursor = resp['paging']['after']
            expect(cursor).not_to be nil
            previous_result = resp['data']

            while cursor
              # paginate through the result
              get "/v1/me/slots",
                  { filter: filter, after: cursor, limit: limit },
                  @auth_header

              expect(response.status).to be(200)

              json = JSON.parse(response.body)
              cursor = json['paging']['after']
              result = json['data']
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
            get "/v1/me/slots", query_string,
                @auth_header

            expect(response.status).to be(200)
            resp = JSON.parse(response.body)
            result_count = resp['data'].size
            expect(resp['paging']['filter']).to eq filter

            # receive a cursor for further requests
            cursor = resp['paging']['before']
            expect(cursor).not_to be nil
            result = []
            previous_result = resp['data']

            while cursor
              # paginate through the result
              get "/v1/me/slots",
                  { filter: filter, before: cursor, limit: limit },
                  @auth_header

              expect(response.status).to be(200)

              json = JSON.parse(response.body)
              cursor = json['paging']['before']
              result = json['data']
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

          get "/v1/me/slots",
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
        let(:over_limit) { BaseSlot.all.count * 2 }

        context "default filter" do
          let(:filter) { 'past' }

          it "doesn't use default filter if explicitly send" do

            get "/v1/me/slots", { filter: filter }, @auth_header

            expect(response.status).to be(200)
            expect(json['paging']['filter']).to eq filter
          end
        end

        context "all" do
          it "returns all slots" do

            get "/v1/me/slots",
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

            get "/v1/me/slots",
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
            get "/v1/me/slots",
                { filter: filter, limit: over_limit },
                @auth_header
            expect(response.status).to be(200)
            expect(json['paging']['after']).to be nil
          end
        end

        context "past" do
          let(:filter) { 'past' }

          it "returns slots where start_date is before moment" do

            get "/v1/me/slots",
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
            get "/v1/me/slots",
                { filter: filter, limit: over_limit },
                @auth_header
            expect(response.status).to be(200)
            expect(json['paging']['before']).to be nil
          end
        end

        context "finished" do
          it "returns slots where start & end is before moment" do

            get "/v1/me/slots",
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

            get "/v1/me/slots",
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

            get "/v1/me/slots",
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

        context "around" do
          let(:filter) { 'around' }
          let(:limit) { 10 }
          let(:moment) { Time.zone.now }

          it "half of the slots before and half after moment" do

            get "/v1/me/slots",
                { filter: filter, limit: limit, moment: moment },
                @auth_header

            expect(response.status).to be(200)
            expect(json['data'].length).to eq limit

            forward = backward = 0
            json['data'].each do |slot|
              forward += 1 if slot['startDate'] >= moment
              backward += 1 if slot['startDate'] < moment
            end
            expect(forward).to eq limit / 2
            expect(backward).to eq limit / 2
          end

          it "doesn't return cursors if not enough slots" do
            get "/v1/me/slots",
                { filter: filter, limit: over_limit },
                @auth_header
            expect(response.status).to be(200)
            expect(json['paging']['after']).to be nil
            expect(json['paging']['before']).to be nil
          end
        end
      end
    end
  end

  describe "GET /v1/me/friendslots" do
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
      get "/v1/me/friendslots", {}, auth_header
      expect(response.status).to be(200)
    end

    it "includes all the right slots" do
      get "/v1/me/friendslots", {}, auth_header
      expect(response.body).to include 'bobslot'
      expect(json.size).to be 4
    end

    it "orders the slots by startdate" do
      get "/v1/me/friendslots", {}, auth_header
      expect(json.first['startDate']).to be <= json.second['startDate']
      expect(json.second['startDate']).to be <= json.third['startDate']
      expect(json.third['startDate']).to be <= json.last['startDate']
    end

    it "only includes upcoming slots" do
      get "/v1/me/friendslots", {}, auth_header
      expect(json.first['startDate']).to be >= Time.zone.now
      expect(response.body).not_to include 'bobslot-past'
    end

    context "pagination" do
      let(:limit) { 4 }
      let(:query_string) {
        { status: status, moment: Time.zone.now.as_json, limit: limit } }

      it "returns success" do
        get "/v1/me/friendslots", query_string, auth_header
        expect(response.status).to be(200)
      end

      it "returns pagination metadata" do
        skip 'TODO: paginate slots of users friends'
        get "/v1/me/friendslots", query_string, auth_header
        expect(json).to have_key 'paging'
        expect(json['paging']).to have_key 'moment'
        expect(json['paging']).to have_key 'limit'
        expect(json['paging']).to have_key 'before'
      end
    end
  end

  describe "GET /v1/me/media" do
    let!(:slots) do
      create(:std_slot_public, :with_media, creator: current_user)
      create(:std_slot_private, :with_media, creator: current_user)
    end

    it "Returns array which includes all media items of the current_user" do
      get "/v1/me/media", {}, auth_header

      expect(response).to have_http_status :ok
      expect(json.length).to eq(current_user.media_items.count)
      expect(json.length).to eq(12)
    end
  end

  describe "PATCH /v1/me/device" do
    it "returns success" do
      patch "/v1/me/device", { deviceId: 'id-34273647263' }, auth_header
      expect(response.status).to be(200)
    end

    context "invalid parameters" do
      it "doesn't update the device if parameters are empty" do
        patch "/v1/me/device", {}, auth_header
        expect(response.status).to be(422)
      end

      it "doesn't update the device if deviceId is invalid" do
        patch "/v1/me/device", { deviceId: nil }, auth_header
        expect(response.status).to be(422)
      end

      it "doesn't update the device if token is invalid" do
        patch "/v1/me/device", { deviceId: 'id-34273647263' },
              'Authorization' => "Token token=kh34gshg5345hg3g54"
        expect(response.status).to be(401)
      end
    end
  end

  describe "POST /v1/me/add_friends" do
    let(:john) { create(:user, username: "John") }

    context "no offer" do
      it "creates a friend request" do
        post "/v1/me/add_friends", { ids: [john.id] }, auth_header
        expect(john.friendship(current_user.id)).not_to be nil
      end
    end

    context "existing open offer from friend" do
      let!(:friendship) {
        create(:friendship, user: john, friend: current_user)
      }
      it "accepts a friend request" do
        expect(friendship.established?).to be false
        post "/v1/me/add_friends", { ids: [john.id] }, auth_header
        friendship.reload
        expect(friendship.established?).to be true
      end
    end

    context "previously rejected friendship" do
      let!(:friendship) {
        create(:friendship, :rejected, user: john, friend: current_user)
      }
      it "re-offers a friend request" do
        expect(friendship.established?).to be false
        post "/v1/me/add_friends", { ids: [john.id] }, auth_header
        friendship.reload
        expect(friendship.offered?).to be true
      end
    end
  end
end
