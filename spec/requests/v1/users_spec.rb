require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
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
        expect(response.body).to include "auth_token invalid or missing"
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
      let!(:friendships) do
        create_list(:friendship, 4, :established, user: current_user)
        create(:friendship, :established, user: current_user,
               deleted_at: '2015-08-08T12:00')
        create(:friendship, :rejected, user: current_user)
        create(:friendship, friend: current_user)
      end

      it "return number of established friends for current user" do
        get "/v1/users/#{current_user.id}", {}, auth_header
        expect(json).to have_key('friendsCount')
        expect(json['friendsCount']).to eq 4
        expect(json['friendsCount']).to eq(current_user.friends.length)
      end
    end

    context "json std_slots counter" do
      let!(:not_my_slot) { create(:std_slot_public) }

      context "current_user" do
        let!(:my_slots) do
          create(:std_slot_private, creator: current_user)
          create(:std_slot_public, creator: current_user)
          create(:std_slot_friends, creator: current_user,
                 deleted_at: '2015-08-08T12:00')
        end

        it "return number of all undeleted std_slots for current user" do
          get "/v1/users/#{current_user.id}", {}, auth_header
          expect(json).to have_key('slotCount')
          expect(json['slotCount']).to eq 2
        end
      end

      context "stranger" do
        let(:stranger) do
          stranger = create(:user, :with_public_slot)
          create(:std_slot_public, creator: stranger,
                 deleted_at: '2015-08-08T12:00')
          stranger
        end

        it "return number of undeleted public std_slots for stranger" do
          get "/v1/users/#{stranger.id}", {}, auth_header
          expect(json).to have_key('slotCount')
          expect(json['slotCount']).to eq 1
        end
      end
    end

    context "json calendar counter" do
      let!(:user_with_calendars) do
        requestee = create(:user)
        create_list(:group, 3, public: false, owner: requestee)
        create_list(:group, 2, public: true, owner: requestee)
        public_group = create(:group, public: true)
        create(:membership, :active, group: public_group, user: requestee)
        requestee
      end
      let!(:shared_nonpublic_calendar) do
        shared_group = create(:group, public: false)
        create(:membership, :active, user: current_user,
               group: shared_group)
        create(:membership, :active, user: user_with_calendars,
               group: shared_group)
        shared_group
      end

      it "return number of public and shared calendars" do
        get "/v1/users/#{user_with_calendars.id}", {}, auth_header
        expect(json).to have_key('calendarCount')
        expect(json['calendarCount']).to eq 4
      end
    end

    context "json preview slots" do
      let!(:user) { create(:user) }
      let!(:past_1) { create(:std_slot_public, title: 'past 1', creator: user,
                             start_date: Time.zone.now.last_year.last_month) }
      let!(:future_1) { create(:std_slot_public, title: 'future 1', creator: user,
                               start_date: Time.zone.tomorrow) }
      let!(:future_2) { create(:std_slot_public, title: 'future 2', creator: user,
                               start_date: Time.zone.tomorrow.next_week) }
      let!(:future_3) { create(:std_slot_public, title: 'future 3', creator: user,
                               start_date: Time.zone.tomorrow.next_month) }
      let!(:future_4) { create(:std_slot_public, title: 'future 4', creator: user,
                               start_date: Time.zone.tomorrow.next_year) }
      let!(:future_5) { create(:std_slot_public, title: 'future 5', creator: user,
                               start_date: Time.zone.now.next_year.next_month) }

      it "returns up to 4 upcoming slots for the user" do
        get "/v1/users/#{user.id}", {}, auth_header

        expect(json).to have_key('previewSlots')
        expect(json['previewSlots'].length).to eq 4
        expect(response.body).to include future_1.title
        expect(response.body).to include future_2.title
        expect(response.body).to include future_3.title
        expect(response.body).to include future_4.title
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

      context "default calendars" do
        let(:valid_attributes) {
          attributes_for(:user, :with_email, :with_password, username: "Enio")
        }
        it "creates a private calendar for the user" do
          post "/v1/users", valid_attributes
          new_user = User.last
          expect(new_user.username).to eq "Enio"
          expect(new_user.own_groups.non_public.count).to eq 1
        end

        it "creates a public calendar for the user" do
          post "/v1/users", valid_attributes
          new_user = User.last
          expect(new_user.username).to eq "Enio"
          expect(new_user.own_groups.public.count).to eq 1
        end

        it "shows the default calendars in the users schedule" do
          post "/v1/users", valid_attributes
          new_user = User.last
          expect(new_user.username).to eq "Enio"
          expect(new_user.own_groups.count).to eq 2
          expect(new_user.active_memberships.count).to eq 2
          expect(new_user.active_memberships.first.show_slots_in_schedule)
            .to eq true
          expect(new_user.active_memberships.second.show_slots_in_schedule)
            .to eq true
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
          skip 'new auth_token on signin temporary disabled'
          expect {
            post "/v1/users/signin", valid_attributes
            user.reload
          }.to change(user, :auth_token)
        end

        it "returns auth_token for user" do
          post "/v1/users/signin", valid_attributes
          expect(json).to have_key('authToken')
        end

        it "works when email has different case (upcase/lowercase)" do
          post "/v1/users/signin",
               { email: user.email.upcase, password: 'timeslot' }
          expect(response).to have_http_status(:ok)
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
          skip 'new auth_token on signin temporary disabled'
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

  describe "POST /v1/users/reset", :aws do

    let(:current_user) do
      create(:user,
             email: 'success@simulator.amazonses.com',
             password: "nottimeslot")
    end

    context "valid params", :vcr do
      it "returns ok" do
        post "/v1/users/reset", { email: current_user.email }
        expect(response).to have_http_status :ok
      end

      it "resets the password for the user" do
        expect {
          post "/v1/users/reset", { email: current_user.email }
          current_user.reload
        }.to change(current_user, :password_digest)
      end

      it "creates a new auth_token for user" do
        expect {
          post "/v1/users/reset", { email: current_user.email }
          current_user.reload
        }.to change(current_user, :auth_token)
      end

      it "works when email has different case (upcase/lowercase)" do
        post "/v1/users/reset", { email: current_user.email.upcase }
        expect(response).to have_http_status(:ok)
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

  describe "GET /v1/users/:id/slots" do
    context "no pagination" do
      # let(:group_member) { create(:membership, user: current_user) }
      # let!(:group_slot) { create(:group_slot, group: group_member.group) }
      let!(:slots) do
        slots = []
        slots.push create(:std_slot_private, creator: current_user)
        slots.push create(:std_slot_friends, creator: current_user)
        slots.push create(:std_slot_public, creator: current_user)
        # slots.push(*create_list(:re_slot, 2, slotter: current_user))
      end

      it "returns success" do
        get "/v1/users/#{current_user.id}/slots", {}, auth_header
        expect(response.status).to be(200)
      end

      it "returns all stdslots & reslots for the current_user" do
        get "/v1/users/#{current_user.id}/slots", {}, auth_header
        expect(json.length).to eq slots.size
      end
    end

    context "with pagination", :keep_data do
      before(:all) do
        @current_user = create(:user, :with_email, :with_password)
        @auth_header = {
          'Authorization' => "Token token=#{@current_user.auth_token}" }

        # upcoming slots
        create(:std_slot_private,
               start_date: Time.zone.tomorrow,
               title: 'not my upcoming private slot')
        create(:std_slot_private,
               start_date: Time.zone.tomorrow,
               title: 'upcoming private slot',
               creator: @current_user)
        create(:std_slot_private,
               start_date: Time.zone.today.next_week.end_of_day,
               end_date: Time.zone.today.next_week.next_month,
               title: 'upcoming private slot A',
               creator: @current_user)
        create(:std_slot_private,
               start_date: Time.zone.today.next_week.end_of_day,
               end_date: Time.zone.today.next_week.next_month,
               title: 'upcoming private slot B',
               creator: @current_user)
        create_list(:std_slot_private, 3,
                    start_date: Time.zone.tomorrow,
                    creator: @current_user)
        # ongoing slots
        create(:std_slot_friends,
               start_date: Time.zone.yesterday,
               end_date: Time.zone.tomorrow,
               title: 'ongoing friendslot',
               creator: @current_user)
        create_list(:std_slot_friends, 12,
                    start_date: Time.zone.yesterday,
                    end_date: Time.zone.tomorrow,
                    title: 'ongoing friendslots',
                    creator: @current_user)
        # past slots
        create(:std_slot_public,
               start_date: Time.zone.yesterday.last_year,
               end_date: Time.zone.today.last_year,
               title: 'long ago public slot',
               creator: @current_user)
        create(:std_slot_foaf,
               start_date: Time.zone.yesterday.last_year,
               end_date: Time.zone.today.last_year,
               title: 'foaf past slot',
               creator: @current_user)
        create(:std_slot_public,
               start_date: Time.zone.yesterday.at_midday,
               end_date: Time.zone.yesterday.end_of_day,
               title: 'past public slot',
               creator: @current_user)
        create_list(:std_slot_public, 13,
                    start_date: Time.zone.yesterday.at_midday,
                    end_date: Time.zone.yesterday.end_of_day,
                    title: 'past public slots',
                    creator: @current_user)
      end

      describe "GET slots for befriended user" do
        let(:friend) do
          friend = create(:user)
          create(:friendship, :established,
                 user: @current_user, friend: friend)
          friend
        end

        it "returns ok" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'now' },
              'Authorization' => "Token token=#{friend.auth_token}"
          expect(response).to have_http_status :ok
        end

        it "doesn't return private slots of user" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'all' },
              'Authorization' => "Token token=#{friend.auth_token}"

          expect(response.body).not_to include 'not my upcoming private slot'
          expect(response.body).not_to include 'upcoming private slot'
          expect(response.body).not_to include 'upcoming private slot A'
          expect(response.body).not_to include 'upcoming private slot B'
        end

        it "returns friend-visible slots of user" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'now' },
              'Authorization' => "Token token=#{friend.auth_token}"

          expect(response.body).to include 'ongoing friendslot'
          expect(response.body).to include 'ongoing friendslots'
        end

        it "returns friend-of-friend visible slots of user" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'past' },
              'Authorization' => "Token token=#{friend.auth_token}"

          expect(response.body).to include 'foaf past slot'
        end

        it "returns public slots of user" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'all' },
              'Authorization' => "Token token=#{friend.auth_token}"

          # expect(response.body).to include 'ongoing reslot'
          # expect(response.body).to include 'upcoming reslot'
          expect(response.body).to include 'past public slot'
          expect(response.body).to include 'long ago public slot'
        end

        # context "group slots" do
        #   let(:unshared_group) { create(:group, creator: friend) }
        #   let!(:unshared_groupslot) {
        #     create(:group_slot, group: unshared_group) }

        #   let(:shared_group) do
        #     group = create(:group, :members_can_post)
        #     create(:membership, :active, group: group, user: @current_user)
        #     create(:membership, :active, group: group, user: friend)
        #     group
        #   end
        #   let!(:shared_groupslot) {
        #     create(:group_slot, group: shared_group) }

        #   it "returns shared group slots" do
        #     get "/v1/users/#{@current_user.id}/slots", { mode: 'now' },
        #         'Authorization' => "Token token=#{friend.auth_token}"

        #     expect(response.body).not_to include unshared_groupslot.title
        #     expect(response.body).to include shared_groupslot.title
        #   end
        # end
      end

      describe "GET slots for friend of a befriended user" do
        let(:friend) do
          friend = create(:user)
          create(:friendship, :established, user: @current_user, friend: friend)
          friend
        end
        let(:offa) do
          offa = create(:user)
          create(:friendship, :established, user: offa, friend: friend)
          offa
        end

        it "returns ok" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'now' },
              'Authorization' => "Token token=#{offa.auth_token}"
          expect(response).to have_http_status :ok
        end

        it "doesn't return private slots of user" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'all' },
              'Authorization' => "Token token=#{offa.auth_token}"

          expect(response.body).not_to include 'not my upcoming private slot'
          expect(response.body).not_to include 'upcoming private slot'
          expect(response.body).not_to include 'upcoming private slot A'
          expect(response.body).not_to include 'upcoming private slot B'
        end

        it "returns friend-of-friend visible slots of user" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'past' },
              'Authorization' => "Token token=#{offa.auth_token}"

          expect(response.body).to include 'foaf past slot'
        end

        it "returns public slots of user" do
          get "/v1/users/#{@current_user.id}/slots", { mode: 'all' },
              'Authorization' => "Token token=#{offa.auth_token}"

          # expect(response.body).to include 'ongoing reslot'
          # expect(response.body).to include 'upcoming reslot'
          expect(response.body).to include 'long ago public slot'
        end

        # context "group slots" do
        #   let(:unshared_group) { create(:group, creator: offa) }
        #   let!(:unshared_groupslot) {
        #     create(:group_slot, group: unshared_group) }

        #   let(:shared_group) do
        #     group = create(:group, :members_can_post)
        #     create(:membership, :active, group: group, user: @current_user)
        #     create(:membership, :active, group: group, user: offa)
        #     group
        #   end
        #   let!(:shared_groupslot) {
        #     create(:group_slot, group: shared_group) }

        #   it "returns shared group slots" do
        #     get "/v1/users/#{@current_user.id}/slots", { mode: 'now' },
        #         'Authorization' => "Token token=#{offa.auth_token}"

        #     expect(response.body).not_to include unshared_groupslot.title
        #     expect(response.body).to include shared_groupslot.title
        #   end
        # end
      end

      describe "GET slots for unrelated user" do
        let(:stranger) { create(:user) }

        it "returns ok" do
          get "/v1/users/#{@current_user.id}/slots", mode: 'now',
              'Authorization' => "Token token=#{stranger.auth_token}"
          expect(response).to have_http_status :ok
        end

        it "only returns public slots" do
          get "/v1/users/#{@current_user.id}/slots", mode: 'all',
              'Authorization' => "Token token=#{stranger.auth_token}"

          expect(response.body).not_to include 'not my upcoming private slot'
          expect(response.body).not_to include 'upcoming private slot'
          expect(response.body).not_to include 'ongoing friendslot'
          # expect(response.body).to include 'ongoing reslot'
          expect(response.body).to include 'past public slot'
        end

        # context "group slots" do
        #   let(:unshared_group) { create(:group, creator: stranger) }
        #   let!(:unshared_groupslot) {
        #     create(:group_slot, group: unshared_group) }

        #   let(:shared_group) do
        #     group = create(:group, :members_can_post)
        #     create(:membership, :active, group: group, user: @current_user)
        #     create(:membership, :active, group: group, user: stranger)
        #     group
        #   end
        #   let!(:shared_groupslot) { create(:group_slot, group: shared_group) }

        #   it "returns shared group slots" do
        #     get "/v1/users/#{stranger.id}/slots", { mode: 'all' },
        #         'Authorization' => "Token token=#{@current_user.auth_token}"

        #     expect(response.body).to include shared_groupslot.title
        #     expect(response.body).not_to include unshared_groupslot.title
        #   end
        # end
      end

      describe "GET slots for user if visitor (not logged-in)" do
        # this looks counter-intuitiv. There is no auth_token submitted and so
        # there is no current_user, I just use the existing user object for the
        # request
        it "returns ok" do
          get "/v1/users/#{@current_user.id}/slots", mode: 'now'
          expect(response).to have_http_status :ok
        end

        it "only returns public slots" do
          get "/v1/users/#{@current_user.id}/slots", mode: 'all'
          expect(response.body).not_to include 'not my upcoming private slot'
          expect(response.body).not_to include 'upcoming private slot'
          expect(response.body).not_to include 'ongoing friendslot'
          # expect(response.body).to include 'ongoing reslot'
          expect(response.body).to include 'past public slot'
        end
      end
    end
  end

  describe "GET /v1/users/:id/media" do
    let!(:target_user) { create(:user) }
    let!(:slot_public) {
      create(:std_slot_public, :with_media, creator: target_user) }
    let!(:slot_private) {
      create(:std_slot_private, :with_media, creator: target_user) }

    context "for current_user" do
      it "returns array which includes all media items of user" do
        get "/v1/users/#{target_user.id}/media", {},
            'Authorization' => "Token token=#{target_user.auth_token}"

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(12)
        res = response.body
        expect(res).to include slot_public.media_items.first.public_id
        expect(res).to include slot_private.media_items.first.public_id
      end
    end

    context "for stranger" do
      it "returns array which includes all public media items of user" do
        get "/v1/users/#{target_user.id}/media", {}, auth_header

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(6)
        res = response.body
        expect(res).to include slot_public.media_items.first.public_id
        expect(res).not_to include slot_private.media_items.first.public_id
      end
    end

    context "for visitor" do
      it "returns array which includes all public media items of user" do
        get "/v1/users/#{target_user.id}/media", {}

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(6)
        res = response.body
        expect(res).to include slot_public.media_items.first.public_id
        expect(res).not_to include slot_private.media_items.first.public_id
      end
    end

    context "for friend" do
      let!(:friend) { target_user }
      let!(:slot_friend) {
        create(:std_slot_friends, :with_media, creator: friend) }
      let!(:friendship) {
        create(:friendship, :established, user: current_user, friend: friend) }

      it "returns array which includes all media items of this user " \
         "which are public or friend-visible" do
        get "/v1/users/#{friend.id}/media", {}, auth_header

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(12)
        res = response.body
        expect(res).to include slot_public.media_items.first.public_id
        expect(res).to include slot_friend.media_items.first.public_id
        expect(res).not_to include slot_private.media_items.first.public_id
      end
    end

    # context "shared group" do
    #   let!(:member) { target_user }
    #   let!(:slot_group) { create(:group_slot, :with_media, creator: member) }
    #   let!(:memberships) {
    #     create(:membership, :active, group: slot_group.group, user: current_user)
    #     create(:membership, :active, group: slot_group.group, user: member)
    #   }

    #   it "returns array which includes all media " \
    #      "items which a specific user has shared in a common group" do
    #     get "/v1/users/#{member.id}/media", {}, auth_header

    #     expect(response).to have_http_status(:ok)
    #     expect(json.length).to eq(12)
    #     res = response.body
    #     expect(res).to include slot_public.media_items.first.public_id
    #     expect(res).to include slot_group.media_items.first.public_id
    #     expect(res).not_to include slot_private.media_items.first.public_id
    #   end
    # end

    context "invalid params" do
      it "returns 404 for unknown user ID" do
        get "/v1/users/#{User.count}/media", {}, auth_header
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe "GET /v1/users/:id/calendars" do
    let(:user_with_calendar) { create(:user) }
    let!(:public_group) do
      public_group = create(:group, public: true)
      create(:membership, :active, group: public_group, user: user_with_calendar)
      public_group
    end

    let(:past_1) { create(:std_slot_public, start_date: Time.zone.yesterday,
                          title: 'past 1') }
    let(:past_2) { create(:std_slot_public, title: 'past 2',
                          start_date: Time.zone.yesterday.last_week) }
    let(:past_3) { create(:std_slot_public, title: 'past 3',
                          start_date: Time.zone.yesterday.last_month) }
    let(:past_4) { create(:std_slot_public, title: 'past 4',
                          start_date: Time.zone.yesterday.last_year) }
    let(:past_5) { create(:std_slot_public, title: 'past 5',
                          start_date: Time.zone.now.last_year.last_month) }
    let(:future_1) { create(:std_slot_public, title: 'future 1 slot',
                            start_date: Time.zone.tomorrow) }
    let(:future_2) { create(:std_slot_public, title: 'future 2 slot',
                            start_date: Time.zone.tomorrow.next_week) }
    let(:future_3) { create(:std_slot_public, title: 'future 3 slot',
                            start_date: Time.zone.tomorrow.next_month) }
    let(:future_4) { create(:std_slot_public, title: 'future 4 slot',
                            start_date: Time.zone.tomorrow.next_year) }
    let(:future_5) { create(:std_slot_public, title: 'future 5 slot',
                            start_date: Time.zone.now.next_year.next_month) }
    let!(:basic_containerships) do
      create(:containership, group: public_group, slot: past_1)
      create(:containership, group: public_group, slot: past_2)
      create(:containership, group: public_group, slot: past_3)
      create(:containership, group: public_group, slot: past_4)
      create(:containership, group: public_group, slot: past_5)
    end

    let(:id) { user_with_calendars.id }

    context "more than 3 upcoming slots" do
      let!(:containerships) do
        create(:containership, group: public_group, slot: future_1)
        create(:containership, group: public_group, slot: future_2)
        create(:containership, group: public_group, slot: future_3)
        create(:containership, group: public_group, slot: future_4)
        create(:containership, group: public_group, slot: future_5)
      end

      it "returns 4 preview slots for every group" do
        get "/v1/users/#{user_with_calendar.id}/calendars", {},
            'Authorization' => "Token token=#{current_user.auth_token}"

        expect(response).to have_http_status(:ok)
        res = response.body
        expect(res).to include future_1.title
        expect(res).to include future_2.title
        expect(res).to include future_3.title
        expect(res).to include future_4.title
        expect(res).not_to include future_5.title
        expect(res).not_to include past_1.title
      end
    end

    context "less than 4 upcoming slots" do
      let!(:containerships) do
        create(:containership, group: public_group, slot: future_3)
        create(:containership, group: public_group, slot: future_5)
      end

      it "returns 4 preview slots" do
        get "/v1/users/#{user_with_calendar.id}/calendars", {},
            'Authorization' => "Token token=#{current_user.auth_token}"

        expect(response).to have_http_status(:ok)
        res = response.body
        expect(res).to include future_3.title
        expect(res).to include future_5.title
        expect(res).to include past_1.title
        expect(res).to include past_2.title
        expect(res).not_to include past_3.title
      end
    end

    context "no upcoming slots" do
      it "returns 4 preview slots" do
        get "/v1/users/#{user_with_calendar.id}/calendars", {},
            'Authorization' => "Token token=#{current_user.auth_token}"

        expect(response).to have_http_status(:ok)
        res = response.body
        expect(res).to include past_1.title
        expect(res).to include past_2.title
        expect(res).to include past_3.title
        expect(res).to include past_4.title
        expect(res).not_to include past_5.title
      end
    end
  end
end
