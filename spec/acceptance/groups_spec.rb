require 'documentation_helper'
require 'acceptance/shared_contexts'

resource "Groups" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  shared_context "default group response fields" do
    response_field :id, "ID of the group"
    response_field :name, "name of the group"
    response_field :owner, "user info of group owner"
    response_field :membersCanPost, "Can subscribers add slots?"
    response_field :membersCanInvite, "Can subscribers invite friends?"
    response_field :image, "URL of the group image"
    response_field :description, "The description of the group"
    response_field :createdAt, "Creation of group"
    response_field :updatedAt, "Latest update of group in db"
    response_field :deletedAt, "Deletion of group"
    response_field :membershipState, "Membership state for current user"
  end

  # show
  get "/v1/groups/:group_uuid" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group to get", required: true

    include_context "default group response fields"

    let(:group) { create(:group, :with_3_members, :with_3_slots) }
    let(:group_uuid) { group.uuid }
    let!(:membership) do
      create(:membership, :active, user: current_user, group: group)
    end

    example "Get group data for specific group", document: :v1 do
      explanation "returns data of specified group\n\n" \
                  "returns 404 if UUID is invalid\n\n"
      do_request

      expect(response_status).to eq(200)
      group.reload
      expect(json).to have_key 'id'
      expect(json['id']).to eq group.uuid
      expect(json).to have_key 'name'
      expect(json['name']).to eq group.name
      expect(json).to have_key 'image'
      expect(json['image']).to eq group.image
      expect(json).to have_key "public"
      expect(json['public']).to eq group.public
      expect(json).to have_key "description"
      expect(json['description']).to eq group.description
      expect(json).to have_key "membersCanPost"
      expect(json['membersCanPost']).to eq group.members_can_post
      expect(json).to have_key "membersCanInvite"
      expect(json['membersCanInvite']).to eq group.members_can_invite
      expect(json).to have_key "owner"
      expect(json['owner']['id']).to eq group.owner.id
      expect(json).to have_key "memberIds"
      expect(json['memberIds']).to eq group.member_ids
      expect(json).to have_key "memberCount"
      expect(json['memberCount']).to eq group.members.count
      expect(json).to have_key "slotCount"
      expect(json['slotCount']).to eq group.slots.count
      expect(json).to have_key "createdAt"
      expect(json).to have_key "updatedAt"
      expect(json).to have_key "deletedAt"
    end
  end

  # create
  post "/v1/groups" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :name, "Name of group (max. 255 characters)", required: true
    parameter :image, "Image for the group"
    parameter :description, "Description of the group (max. 255 characters)"
    parameter :public,
              "Is the group public? (true/false), default: 'false'"
    parameter :membersCanPost,
              "Can members add slots? (true/false), default: 'false'"
    parameter :membersCanInvite,
              "Can members add other users? (true/false), default: 'false'"
    parameter :invitees, "Array of User IDs to be added to the group"

    include_context "default group response fields"

    let(:name) { "foo" }
    let(:image) { "salvador dali" }
    let(:description) { "This is a description." }
    let(:membersCanPost) { true }
    let(:membersCanInvite) { true }
    let(:public) { true }
    let(:invitees) { create_list(:user, 3).collect(&:id) }

    example "Create a new group", document: :v1 do
      explanation "Current User is the group owner and" \
                  "also initially an active group member.\n\n" \
                  "returns 201 and data of new group\n\n" \
                  "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key("id")
      expect(json).to have_key("name")
      expect(json).to have_key("public")
      expect(json).to have_key("membersCanPost")
      expect(json).to have_key("membersCanInvite")
      expect(json["name"]).to eq name
      expect(json["image"]).to eq image
      expect(json["public"]).to eq public
      expect(json["description"]).to eq description
      expect(json["membersCanPost"]).to eq membersCanPost
      expect(json["membersCanInvite"]).to eq membersCanInvite
      group = Group.last
      expect(group.owner).to eq current_user
      expect(group.members).to include current_user
      expect(Membership.count).to eq invitees.length + 1 # 1 is the owner
      expect(Membership.last.active?).to be true
    end
  end

  # update
  patch "/v1/groups/:group_uuid" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group to update", required: true

    include_context "default group response fields"

    let(:group) do
      create(:group, :with_description, name: "foo", owner: current_user,
             members_can_invite: false, members_can_post: false)
    end
    let(:group_uuid) { group.uuid }

    describe "Update existing group" do
      parameter :name, "Updated name of group (max. 255 characters)"
      parameter :description, "Updated description of group (max. 255 characters)"
      parameter :membersCanInvite, "Allows members to invite other users"
      parameter :membersCanPost, "Allows members to post new slots"

      let(:name) { "bar" }
      let(:description) { "This is a new description." }
      let(:membersCanInvite) { true }
      let(:membersCanPost) { true }

      example "Update data for existing group", document: :v1 do
        explanation "e.g. Change groupname\n\n" \
                    "returns 200 if the update was successful\n\n" \
                    "returns 404 if UUID is invalid\n\n" \
                    "returns 422 if parameters are missing\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        group.reload
        expect(group.name).to eq "bar"
        expect(group.members_can_invite).to eq true
        expect(group.members_can_post).to eq true
        expect(response_status).to eq(200)
        expect(json).to have_key 'id'
        expect(json['id']).to eq group.uuid
        expect(json).to have_key 'name'
        expect(json['name']).to eq name
        expect(json).to have_key 'description'
        expect(json['description']).to eq description
        expect(json).to have_key "membersCanPost"
        expect(json['membersCanPost']).to eq membersCanPost
        expect(json).to have_key "membersCanInvite"
        expect(json['membersCanInvite']).to eq membersCanInvite
      end
    end

    describe "Add image to group" do
      parameter :image, "Cloudinary ID / URL", required: true

      let(:image) { "v1234567/dfhjghjkdisudgfds7iyf.jpg" }

      example "Add image to existing group", document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary the client updates the group with the image" \
                    " information.\n\n" \
                    "returns 200 and the group data if the image was" \
                    " successfully added or updated"
        do_request

        group.reload
        expect(group.image).not_to be nil
        expect(group.image).to eq image
        expect(response_status).to eq(200)
        expect(json).to have_key("image")
        expect(json["image"]).to eq image
      end
    end
  end

  # destroy
  delete "/v1/groups/:group_uuid" do
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group to delete", required: true
    parameter :keep_slots_in_schedule,
              "Set to true to prevent the removal of the calendar slots" \
              " from the users schedule. Default: false", required: false

    include_context "default group response fields"

    let(:group) { create(:group, owner: current_user) }
    let(:group_uuid) { group.uuid }
    let!(:memberships) { create_list(:membership, 4, :active, group: group) }

    example "Delete group", document: :v1 do
      explanation "Sets 'deleted_at' on the group and its memberships." \
                  " Doesn't delete anything.\n\n" \
                  "Current User must be group owner" \
                  "returns 200 and the updated data for the group\n\n" \
                  "returns 403 if current user not group owner\n\n" \
                  "returns 404 if UUID is invalid"
      do_request

      group.reload
      expect(group.deleted_at).not_to be nil
      expect(group.memberships.first.deleted_at?).to be true
      expect(group.memberships.last.deleted_at?).to be true
      expect(response_status).to eq(200)
      expect(json).to have_key 'id'
      expect(json['id']).to eq group.uuid
    end

    describe "current user not group owner" do
      let(:group) { create(:group, owner: create(:user)) }

      example "returns Forbidden", document: false do
        do_request
        expect(response_status).to eq 403
      end
    end
  end

  # slots
  get "/v1/groups/:group_uuid/slots" do
    header "accept", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group to get slots for", required: true

    response_field :groupId, "deprecated: ID of the group"
    response_field :groupUuid, "UUID of the group"
    response_field :slotCount, "Number of all slot in this group"
    response_field :upcomingCount, "Number of upcoming group slots"
    response_field :slots, "Array of group slots"
    response_field :id, "ID of the slot"
    response_field :title, "Title of the slot"
    response_field :startDate, "Startdate of the slot"
    response_field :endDate, "Enddate of the slot"
    response_field :openEnd, "OpenEnd Boolean Flag of the slot"
    response_field :alerts, "Alerts for the slot for the current user"
    response_field :media, "Media items of the slot"
    response_field :url, "direct url to fetch the slot"
    response_field :createdAt, "Creation datetime of the slot"
    response_field :updatedAt, "Last update of the slot"
    response_field :deletedAt, "Deletion datetime of the slot"

    include_context "slot pagination"

    let(:group) { create(:group, owner: current_user) }
    let(:group_uuid) { group.uuid }
    let!(:containerships) do
      create_list(:containership, 4, group: group)
    end

    example "Get slots in a slotgroup by UUID", document: :v1 do
      explanation "endpoint supports slot pagination\n\n" \
                  "returns 200 and a list of slots\n\n" \
                  "returns 404 if UUID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json).to have_key("id")
      expect(json).not_to have_key("uuid")
      expect(json).to have_key("slots")
      expect(json).to have_key("slotCount")
      expect(json["id"]).to eq group.uuid
      expect(json["slotCount"]).to eq containerships.length
      expect(json["slots"].length).to eq containerships.length
      expect(json["slots"].first).to have_key("id")
      expect(json["slots"].first).to have_key("title")
      expect(json["slots"].first).to have_key("startDate")
      expect(json["slots"].first).to have_key("endDate")
      expect(json["slots"].first).to have_key("createdAt")
      expect(json["slots"].first).to have_key("updatedAt")
      expect(json["slots"].first).to have_key("deletedAt")
      expect(json["slots"].first).to have_key("settings")
      expect(json["slots"].first).to have_key("media")
      expect(response_body).to include(containerships.first.slot.title)
    end
  end

  # members
  get "/v1/groups/:group_uuid/members" do
    header "accept", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group to get members for", required: true

    response_field :groupId, "ID of the group"
    response_field :size, "Number of active group members"
    response_field :members, "Array of active members"
    response_field :userId, "ID of member"
    response_field :username, "name of member"
    response_field :userUrl, "URL for member"

    let(:group) { create(:group) }
    let(:group_uuid) { group.uuid }
    let!(:active_member) {
      user = create(:user, :with_picture)
      create(:membership, :active, user: user, group: group)
      user
    }
    let!(:active_members) { create_list(:membership, 4, :active, group: group) }
    let!(:inactive_member) { create(:membership, :inactive, group: group) }
    let!(:deactivated_user) { create(:membership, :active, group: group,
                                     deleted_at: Time.zone.now) }
    # group owner is automatically an active member too
    let!(:membership) do
      create(:membership, :active, user: current_user, group: group)
    end

    example "Get list of all active group members", document: :v1 do
      explanation "returns 200 and a list of all active group members\n\n" \
                  "returns 404 if UUID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json).to include("id" => group.uuid, "membersCounter" => 7)
      expect(response_body).to include(group.members.first.username)
      expect(response_body).to include(active_member.picture)
      expect(response_body).to include(active_member.created_at.as_json)
      expect(response_body).to include(active_member.updated_at.as_json)
      expect(response_body).not_to include(deactivated_user.user.username)
      # expect(response_body)
        # .to include(v1_user_url(group.members.first, format: :json))
    end
  end

  # related
  get "/v1/groups/:group_uuid/related" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group to get related users for",
              required: true

    response_field :groupId, "ID of the group"
    response_field :size, "Number of group members (excluding owner)"
    response_field :related, "Array of related users"
    response_field :userId, "ID of user", scope: :related
    response_field :state, "state of membership", scope: :related
    response_field :deletedAt, "Deletion date of membership", scope: :related

    let(:group) { create(:group, owner: current_user) }
    let(:group_uuid) { group.uuid }
    let!(:members) { create_list(:membership, 1, :active, group: group) }
    let!(:invitees) { create_list(:membership, 2, :invited, group: group) }
    let!(:exmembers) { create_list(:membership, 3, :inactive, group: group) }
    # group owner is automatically an active member too
    let!(:deactivated_user) { create(:membership, :active, group: group,
                                     deleted_at: Time.zone.now) }

    example "Get list of all users related to a group", document: :v1 do
      explanation "Also includes user with pending or refused invitations and" \
                  " inactive or kicked members.\n\n" \
                  "returns 200 & list of all users related to this group\n\n" \
                  "returns 404 if UUID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json).to include({ "id" => group.uuid,
                                "size" => group.related_users.count })
      expect(json["related"])
        .to include("id" => group.related_users.first.id,
                    "state" => group.memberships.first.humanize,
                    "deletedAt" => group.memberships.first.deleted_at
                   )
      expect(response_body).to include(deactivated_user.user_id.to_s)
    end

    describe "no group with given UUID exists" do
      let(:group_uuid) { "32fe81cb-c11c-427c-b1b2-7888b114c345" }

      example "returns Not Found", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end

    describe "group UUID invalid" do
      let(:group_uuid) { "04f7504b-3e96-4dbb-ac94-4998f1574bXYZ" }

      example "returns Not Found", document: false do
        expect {
          do_request
        }.to raise_error ActionController::RoutingError
      end
    end
  end

  # accept invite
  post "/v1/groups/:group_uuid/accept" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group", required: true

    let(:invited_user) { current_user }
    let(:group) { create(:group) }
    let(:group_uuid) { group.uuid }
    let!(:membership) do
      create(:membership, :invited, user: invited_user, group: group)
    end

    example "Accept Invitation and add invited user to group", document: :v1 do
      explanation "returns 200 if invite successfully accepted\n\n" \
                  "returns 403 if invitation is missing\n\n" \
                  "returns 404 if group UUID is invalid\n\n" \
                  "returns 422 if parameters are missing"
      do_request

      expect(response_status).to eq(200)
      membership.reload
      expect(membership.active?).to be true
      expect(group.members).to include invited_user
    end
  end

  # refuse invite
  post "/v1/groups/:group_uuid/refuse" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group", required: true

    let(:invited_user) { current_user }
    let(:group) { create(:group) }
    let(:group_uuid) { group.uuid }
    let!(:membership) do
      create(:membership, :invited, user: invited_user, group: group)
    end

    example "Refuse group invitation", document: :v1 do
      explanation "The invitation is invalidated.\n\n" \
                  "returns 200 if invite successfully refused.\n\n" \
                  "returns 403 if invitation is missing\n\n" \
                  "returns 404 if group UUID is invalid\n\n" \
                  "returns 422 if parameters are missing"
      do_request

      expect(response_status).to eq(200)
      membership.reload
      expect(membership.active?).to be false
      expect(membership.refused?).to be true
      expect(group.members).not_to include invited_user
    end
  end

  # subscribe
  post "/v1/calendars/:slotgroup_uuid/subscribe" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :slotgroup_uuid, "ID of the group", required: true

    let!(:group) { create(:group, public: true) }
    let(:slotgroup_uuid) { group.uuid }

    example "Subscribe to a public calendar", document: :v1 do
      explanation "Adds the current user to the slotgroup/calendar." \
                  " Calendar must be public.\n\n" \
                  "returns 201 if invite successfully created\n\n" \
                  "returns 404 if group UUID is invalid"
      expect {
        do_request
      }.to change(Membership, :count).by 1
      expect(response_status).to eq(201)
      membership = Membership.last
      expect(membership.active?).to be true
      expect(group.members).to include current_user
      expect(current_user.active_groups).to include group
    end
  end

  # invite
  post "/v1/groups/:group_uuid/members" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group", required: true
    parameter :invitees, "User IDs to be invited to group", required: true

    let!(:group) { create(:group, owner: current_user) }
    let(:added_users) { create_list(:user, 3) }

    let(:group_uuid) { group.uuid }
    let(:invitees) { added_users.collect(&:id) }

    example "Add multiple users to group", document: :v1 do
      explanation "Adds the given Users to the group. Inviting user must" \
                  " be group member.\n\n" \
                  "returns 201 if invite successfully created\n\n" \
                  "returns 403 if user is not allowed to invite\n\n" \
                  "returns 404 if group UUID is invalid\n\n" \
                  "returns 422 if parameters are missing"
      expect {
        do_request
      }.to change(Membership, :count).by added_users.length
      expect(response_status).to eq(201)
      membership = Membership.last
      expect(membership.active?).to be true
      expect(group.members).to include added_users.first
      expect(group.related_users).to include added_users.first
    end
  end

  # leave
  delete "/v1/groups/:group_uuid/members" do
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group", required: true
    parameter :keep_slots_in_schedule,
              "Set to true to prevent the removal of the calendar slots" \
              " from the users schedule. Default: false", required: false

    let(:member) { current_user }
    let(:group) { create(:group) }
    let(:group_uuid) { group.uuid }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group)
      end

      example "Leave group", document: :v1 do
        explanation "returns 200 if membership successfully invalidated\n\n" \
                    "returns 403 if current user not active group member\n\n" \
                    "returns 403 if current user has no membership for this" \
                    " group at all\n\n" \
                    "returns 404 if group UUID is invalid\n\n" \
                    "returns 422 if parameters are missing"
        do_request

        expect(response_status).to eq(200)
        membership.reload
        expect(membership.left?).to be true
        expect(group.members).not_to include member
      end

      context "calendar slots" do
        let(:group) { create(:calendar, :with_3_slots) }
        let!(:slot_in_schedule) do
          create(:passengership, slot: group.slots.first, user: current_user,
                 show_in_my_schedule: true)
        end
        let!(:slot_in_schedule_and_other_calendar) do
          shown_calendar = create(:calendar)
          create(:membership, :show_in_schedule, user: current_user,
                 group: shown_calendar)
          create(:containership, slot: group.slots.last, group: shown_calendar)
          create(:passengership, slot: group.slots.last, user: current_user,
                 show_in_my_schedule: true)
        end

        example "hides them from schedule", document: false do
          do_request
          expect(response_status).to eq 200

          slot_in_schedule.reload
          expect(slot_in_schedule.show_in_my_schedule).to be false

          slot_in_schedule_and_other_calendar.reload
          expect(
            slot_in_schedule_and_other_calendar.show_in_my_schedule
          ).to be true
        end
      end
    end

    describe "membership not active" do
      let!(:membership) do
        create(:membership, :inactive, user: member, group: group)
      end

      example "returns Forbidden", document: false do
        do_request
        expect(response_status).to eq 403
      end
    end

    describe "no membership" do
      example "returns Forbidden", document: false do
        do_request
        expect(response_status).to eq 403
      end
    end
  end

  # kick
  delete "/v1/groups/:group_uuid/members/:user_id" do
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group", required: true
    parameter :user_id, "ID of the user to kick", required: true

    let(:member) { create(:user) }
    let(:group) { create(:group, owner: current_user) }

    let(:group_uuid) { group.uuid }
    let(:user_id) { member.id }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group)
      end

      example "Remove/Kick other user from own group", document: :v1 do
        explanation "returns 200 if user successfully removed from group\n\n" \
                    "returns 200 if invite for user successfully invalidated\n\n" \
                    "returns 422 if user to be kicked has no membership" \
                    " for this group at all\n\n" \
                    "returns 403 if current user not group owner aka" \
                    " not allowed to kick members\n\n" \
                    "returns 404 if group UUID is invalid\n\n" \
                    "returns 422 if parameters are missing"
        do_request

        expect(response_status).to eq(200)
        membership.reload
        expect(membership.kicked?).to be true
        expect(group.members).not_to include member
      end
    end

    describe "membership not active" do
      let!(:membership) do
        create(:membership, :inactive, user: member, group: group)
      end

      example "returns OK", document: false do
        do_request
        expect(response_status).to eq(200)
      end
    end

    describe "no membership" do
      # now returns ok per request from ios
      example "returns OK", document: false do
        do_request
        expect(response_status).to eq 200
      end
    end
  end

  # settings
  patch "/v1/groups/:group_uuid/members" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :group_uuid, "ID of the group to delete", required: true
    parameter :notifications, "receive notifications?", scope: :settings
    parameter :defaultAlerts, "set default alerts for slots in this group",
              scope: :settings

    let(:member) { current_user }
    let(:group) { create(:group) }

    let(:group_uuid) { group.uuid }
    let(:notifications) { "false" }
    let(:defaultAlerts) { "1111100000" }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group,
               notifications: true)
      end

      example "Update settings of joined group", document: :v1 do
        explanation "Change notifications and default alerts for group\n\n" \
                    "returns 200 if setting was successfully updated\n\n" \
                    "returns 403 if user not active group member\n\n" \
                    "returns 404 if group UUID is invalid\n\n" \
                    "returns 422 if parameters are missing"
        do_request

        expect(response_status).to eq(200)
        membership.reload
        expect(membership.notifications).to eq false
        expect(membership.default_alerts).to eq defaultAlerts
      end

      describe "invalid parameter" do
        let(:notifications) { "foo" }

        # see: http://stackoverflow.com/questions/5170008/rails-validating-inclusion-of-a-boolean-fails-tests
        example "invalid boolean parameters evaluate to 'false'",
                document: false do
          skip 'documentation purpose'
          # The following will change with Rails 5
          explanation "Every non-true value will be evaluated to false so" \
                      " there is no 'invalid' parameter.\n\n" \
                      "I leave this test here for documentation purposes."
          do_request
          expect(response_status).to eq(200)
          membership.reload
          expect(membership.notifications).to be false
        end
      end

      describe "missing parameter" do
        let(:notifications) {}

        example "returns Unprocessable Entity", document: false do
          do_request
          expect(response_status).to eq(422)
        end
      end
    end

    describe "membership not active" do
      let!(:membership) do
        create(:membership, :inactive, user: member, group: group,
               notifications: true)
      end

      example "returns Forbidden", document: false do
        do_request
        expect(response_status).to eq 403
      end
    end

    describe "no membership" do
      let(:membership) {}

      example "returns Forbidden", document: false do
        do_request
        expect(response_status).to eq 403
      end
    end
  end

  # global slot groups
  post "/v1/groups/global_group", :seed do
    let(:current_user) { User.find_by email: 'global-importer@timeslot.com' }

    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :categoryUuid, "UUID for the global slot category to which " \
                             "the group/calendar belongs", required: true
    parameter :group, "hash witch contains the payload", required: true
    parameter :stringId, "String Identifier for the group", scope: :group,
              required: true
    parameter :muid, "UUID of the group to add slots to", scope: :group
    parameter :name, "Name of the group to add slots to", scope: :group
    parameter :description, "The description of the group", scope: :group
    parameter :image, "Image URL for the group image", scope: :group
    parameter :slots, "Array with muid's of GlobalSlots", scope: :group

    describe "create new global group and add GlobalSlots", :vcr do
      let(:categoryUuid) { create(:user, :gs_category)[:user_uuid] }
      let(:muid) { attributes_for(:group)[:uuid] }
      let(:name) { "Autokino an der alten Eiche" }
      let(:image) { "http://faster.pussycat" }
      let(:description) { "Bitte Autoradio nicht vergessen." }

      let(:stringId) { "soccer_leagues:dfb.de:champions_league" }
      let(:slots) { [attributes_for(:global_slot)[:slot_uuid]] }

      example "Add GlobalSlots to new or existing public group",
              document: :v1 do
        explanation "If no global group with the given UUID exists, " \
                    "one is created and the name and image is set and the " \
                    "given GlobalSlots are added to the new group.\n\n" \
                    "If a public group with the UUID exists, this one " \
                    "is used to add the given GlobalSlots to it and " \
                    "the group will be updated with new submitted values.\n\n" \
                    "The GlobalSlots which aren't yet in the backend db " \
                    "are loaded via the candy shop.\n\n" \
                    "The data must be submitted by the special **Global" \
                    " Importer** User. The owner if the list must be " \
                    "available via candy api via it's uuid.\n\n" \
                    "returns 200 if slots were successfully added.\n\n" \
                    "returns 422 if group with given UUID exists but " \
                    "name doesn't match.\n\n" \
                    "returns 422 if requiered parameters are missing or invalid."

        group_counter = Group.count
        do_request

        expect(Group.count).to eq group_counter + 1
        autokino = Group.last
        expect(autokino.uuid).to eq muid
        expect(autokino.name).to eq name
        expect(autokino.public?).to be true
        expect(autokino.image).to eq image
        expect(autokino.description).to eq description
        expect(autokino.string_id).to eq stringId

        expect(autokino.slots).not_to be_empty
        gs = GlobalSlot.find_by slot_uuid: slots.first
        expect(autokino.slots).to include gs

        expect(response_status).to eq(200)
      end
    end

    describe "update existing global group", :vcr do
      let!(:global_group) do
        create(:group, public: true,
               owner: create(:user, role: 'global_slot_category'),
               uuid: "d448ce44-cd5b-efac-ef95-b84a70001777",
               name: "Brechreiz und Komplexe",
               description: "Studenten erzaehlen aus ihrem Leben.",
               string_id:
                 "tu_berlin_classes:lsf.tu-berlin.de:0401 L 145:180786:373591",
               image: "http://www.retrainer.eu/start/img/tuberlin.png")
      end

      let(:categoryUuid) { "74234fc9-5543-6b0f-bdb5-66ed52e2d787" }
      let(:muid) { "d448ce44-cd5b-efac-ef95-b84a70001906" }
      let(:name) { "Berechenbarkeit und Komplexitaet" }
      let(:description) { "Vl. Mi 14:00 - 16:00, 0401 L 145, Raum: ER 270" }
      let(:stringId) {
        "tu_berlin_classes:lsf.tu-berlin.de:0401 L 145:180786:373591" }
      let(:slots) { ["5b012024-e614-83cb-63a6-165d4716c892"] }
      let(:domain) { "lsf.tu-berlin.de" } # this is ignored

      example "Update existing global group", document: :v1 do
        explanation "Check for existing global group via **string_id**, " \
                    "If the global group is already known in the backend " \
                    "it will be updated with the submitted group params.\n\n" \
                    "returns 200 if slots were successfully added.\n\n" \
                    "returns 422 if group with given UUID exists but " \
                    "name doesn't match.\n\n" \
                    "returns 422 if requiered parameters are missing or invalid."

        skip 'no TU slots anymore???'
        group_counter = Group.count
        do_request

        expect(Group.count).to eq group_counter # no group created
        autokino = Group.last
        expect(autokino.uuid).to eq muid
        expect(autokino.name).to eq name
        expect(autokino.public?).to be true
        expect(autokino.description).to eq description
        expect(autokino.string_id).to eq stringId

        expect(autokino.slots).not_to be_empty
        gs = GlobalSlot.find_by slot_uuid: slots.first
        expect(autokino.slots).to include gs

        expect(response_status).to eq(200)
      end
    end
  end
end
