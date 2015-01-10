require 'documentation_helper'

resource "Groups" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user) }
  before(:each) { ApplicationController.new.current_user = current_user }

  # index
  get "/v1/groups" do
    header "Accept", "application/json"

    response_field :id, "ID of the group"
    response_field :name, "name of the group"
    response_field :url, "ressource url for the group"

    let!(:user) { create(:user, :with_3_groups, :with_3_own_groups) }

    example "Get all groups where current user is member or owner",
            document: :v1 do
      # ApplicationController.new.set_current_user(user)
      do_request

      expect(response_status).to eq(200)
      expect(json.size).to eq user.groups.count + user.own_groups.count
    end
  end

  # show
  get "/v1/groups/:group_id" do
    header "Accept", "application/json"

    parameter :group_id, "ID of the group to get", required: true

    response_field :id, "ID of the group"
    response_field :name, "name of the group"
    response_field :ownerId, "user id of group owner"
    response_field :members_can_post, "Can subscribers post?"
    response_field :members_can_invite, "Can subscribers invite friends?"
    response_field :createdAt, "Creation of group"
    response_field :updatedAt, "Latest update of group in db"
    response_field :deletedAt, "Deletion of group"

    let(:group) { create(:group) }
    let(:group_id) { group.id }

    example "Get group data for specific group", document: :v1 do
      explanation "returns data of specified group\n\n" \
                  "returns 404 if ID is invalid\n\n"
      do_request

      expect(response_status).to eq(200)
      expect(json).to eq(group.attributes.as_json
                          .transform_keys{ |key| key.camelize(:lower) })
    end
  end

  # create
  post "/v1/groups" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :name, "Name of group (max. 255 characters)",
              scope: :group, required: true
    parameter :members_can_post, "Can subscribers post?", scope: :group
    parameter :members_can_invite, "Can subscribers invite friends?", scope: :group

    response_field :id, "ID of the new group"

    let(:name) { "foo" }

    example "Create a new group", document: :v1 do
      explanation "Group owner is current user.\n\n" \
                  "returns 201 and data of new group\n\n" \
                  "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key("id")
      group = Group.last
      expect(group.owner).to eq current_user
    end
  end

  # update
  patch "/v1/groups/:group_id" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group to update", required: true

    let(:group) { create(:group, name: "foo", owner: current_user) }
    let(:group_id) { group.id }

    describe "Update existing group returns No Content" do
      parameter :name, "Updated name of group (max. 255 characters)",
                scope: :group

      let(:name) { "bar" }

      example "Update data for existing group", document: :v1 do
        explanation "e.g. Change groupname\n\n" \
                    "returns 204 if the update was successful\n\n" \
                    "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameters are missing\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        group.reload
        expect(group.name).to eq "bar"
        expect(response_status).to eq(204)
        expect(response_body).to eq("")
      end
    end

    describe "Add image to group" do
      parameter :newMedia, "Scope for attributes of new image",
                required: true,
                scope: :group
      parameter :publicId, "Cloudinary ID / URL",
                required: true,
                scope: :newMedia

      response_field :mediaItemId, "Timeslot internal ID for this media item"

      let(:publicId) { "v1234567/dfhjghjkdisudgfds7iyf.jpg" }
      let(:raw_post) {{ group: { newMedia: { public_id: publicId }}}.to_json }

      example "Add image to existing group", document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary the client updates the group with the image" \
                    " information.\n\n" \
                    "returns 201 and the media_item ID if the image was" \
                    " successfully added or updated"
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key("mediaItemId")
        group.reload
        expect(group.image.first).not_to be nil
        expect(group.image.first.public_id).to eq publicId
      end
    end
  end

  # destroy
  delete "/v1/groups/:group_id" do
    parameter :group_id, "ID of the group to delete", required: true

    let(:group) { create(:group, owner: current_user) }
    let(:group_id) { group.id }
    let!(:memberships) { create_list(:membership, 4, :active, group: group) }

    example "Delete group", document: :v1 do
      explanation "Sets 'deleted_at' on the group and its memberships." \
                  " Doesn't delete anything.\n\n" \
                  "Current User must be group owner" \
                  "returns 200 and the updated data for the group\n\n" \
                  "returns 403 if current user not group owner\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      group.reload
      expect(group.deleted_at).not_to be nil
      expect(group.memberships.first.deleted_at?).to be true
      expect(group.memberships.last.deleted_at?).to be true
      expect(response_status).to eq(200)
      expect(json).to eq(group.attributes.as_json
                          .transform_keys{ |key| key.camelize(:lower) })
    end

    describe "current user not group owner" do
      let(:group) { create(:group, owner: create(:user)) }

      example "returns forbidden", document: false do
        do_request
        expect(response_status).to eq(403)
      end
    end
  end

  # members
  get "/v1/groups/:group_id/members" do
    header "accept", "application/json"

    parameter :group_id, "ID of the group to get", required: true

    response_field :group_id, "ID of the group"
    response_field :size, "Number of group members (excluding owner)"
    response_field :members, "Array of active members"
    response_field :userId, "ID of member"
    response_field :username, "name of member"
    response_field :user_url, "URL for member"

    let(:group) { create(:group) }
    let(:group_id) { group.id }
    let!(:members) { create_list(:membership, 4, :active, group: group) }
    let!(:exmembers) { create_list(:membership, 3, :inactive, group: group) }

    example "Get list of all active group members", document: :v1 do
      explanation "returns 200 and a list of all active group members\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json).to include({
                                "groupId" => group.id,
                                "size" => 4
                              })
      expect(json["members"].first)
        .to eq({
                 "userId" => group.members.first.id,
                 "username" => group.members.first.username,
                 "userUrl" => v1_user_url(group.members.first, format: :json)
               })
    end

    describe "group ID invalid" do
      let(:group_id) { group.id + 1 }

      example "returns Not Found", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  # related
  get "/v1/groups/:group_id/related" do
    header "Accept", "application/json"

    parameter :group_id, "ID of the group to get", required: true

    response_field :groupId, "ID of the group"
    response_field :size, "Number of group members (excluding owner)"
    response_field :related, "Array of related users"
    response_field :userId, "ID of user", scope: :related
    response_field :state, "state of membership", scope: :related

    let(:group) { create(:group) }
    let(:group_id) { group.id }
    let!(:members) { create_list(:membership, 1, :active, group: group) }
    let!(:invitees) { create_list(:membership, 2, :invited, group: group) }
    let!(:exmembers) { create_list(:membership, 3, :inactive, group: group) }

    example "Get list of all users related to a group", document: :v1 do
      explanation "Also includes user with pending or refused invitations and" \
                  " inactive or kicked members.\n\n" \
                  "returns 200 & list of all users related to this group\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      expect(response_status).to eq(200)
      expect(json).to include({
                                "groupId" => group.id,
                                "size" => 6
                              })
      expect(json["related"].first)
        .to eq({
                 "userId" => group.related_users.first.id,
                 "state" => group.memberships.first.state
               })
    end

    describe "group ID invalid" do
      let(:group_id) { group.id + 1 }

      example "returns Not Found", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  # accept invite
  post "/v1/groups/:group_id/accept" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group", required: true

    let(:invited_user) { current_user }
    let(:group) { create(:group) }
    let(:group_id) { group.id }
    let!(:membership) do
      create(:membership, :invited, user: invited_user, group: group)
    end

    example "Accept Invitation and add invited user to group", document: :v1 do
      explanation "returns 200 if invite successfully accepted\n\n" \
                  "returns 403 if invitation is missing\n\n" \
                  "returns 404 if group ID is invalid\n\n" \
                  "returns 422 if parameters are missing"
      do_request

      expect(response_status).to eq(200)
      membership.reload
      expect(membership.active?).to be true
      expect(group.members).to include invited_user
    end
  end

  # refuse invite
  post "/v1/groups/:group_id/refuse" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group", required: true

    let(:invited_user) { current_user }
    let(:group) { create(:group) }
    let(:group_id) { group.id }
    let!(:membership) do
      create(:membership, :invited, user: invited_user, group: group)
    end

    example "Refuse group invitation", document: :v1 do
      explanation "The invitation is invalidated.\n\n" \
                  "returns 200 if invite successfully refused.\n\n" \
                  "returns 403 if invitation is missing\n\n" \
                  "returns 404 if group ID is invalid\n\n" \
                  "returns 422 if parameters are missing"
      do_request

      expect(response_status).to eq(200)
      membership.reload
      expect(membership.active?).to be false
      expect(membership.refused?).to be true
      expect(group.members).not_to include invited_user
    end
  end

  # invite_single
  post "/v1/groups/:group_id/members/:user_id" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group", required: true
    parameter :user_id, "User ID to invite to the group", required: true

    let(:group) { create(:group, owner: current_user) }
    let(:invited_user) { create(:user) }

    let(:group_id) { group.id }
    let(:user_id) { invited_user.id }

    example "Invite user to group", document: :v1 do
      explanation "Inviting user must be group owner or group must allow" \
                  " invites by group members.\n\n" \
                  "returns 201 if invite successfully created\n\n" \
                  "returns 200 if user is already invited\n\n" \
                  "returns 200 if user is already group member\n\n" \
                  "returns 403 if user is not allowed to invite\n\n" \
                  "returns 404 if group ID is invalid\n\n" \
                  "returns 422 if parameters are missing"
      expect {
        do_request
      }.to change(Membership, :count).by 1
      expect(response_status).to eq(201)
      membership = Membership.last
      expect(membership.invited?).to be true
      expect(group.members).not_to include invited_user
      expect(group.related_users).to include invited_user
    end
  end

  # invite
  # TODO: needs improvement
  post "/v1/groups/:group_id/members" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group", required: true
    parameter :ids, "User IDs to be invited to group", required: true

    let(:group) { create(:group, owner: current_user) }
    let(:invited_users) { create_list(:user, 3) }

    let(:group_id) { group.id }
    let(:ids) { invited_users.collect(&:id) }

    example "Invite multiple users to group", document: :v1 do
      explanation "Inviting user must be group owner or group must allow" \
                  " invites by group members.\n\n" \
                  "returns 201 if invite successfully created\n\n" \
                  "returns 403 if user is not allowed to invite\n\n" \
                  "returns 404 if group ID is invalid\n\n" \
                  "returns 422 if parameters are missing"
      expect {
        do_request
      }.to change(Membership, :count).by invited_users.length
      expect(response_status).to eq(201)
      membership = Membership.last
      expect(membership.invited?).to be true
      expect(group.members).not_to include invited_users.first
      expect(group.related_users).to include invited_users.first
    end
  end

  # leave
  delete "/v1/groups/:group_id/members" do

    parameter :group_id, "ID of the group", required: true

    let(:member) { current_user }
    let(:group) { create(:group) }
    let(:group_id) { group.id }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group)
      end

      example "Leave group", document: :v1 do
        explanation "returns 200 if membership successfully invalidated\n\n" \
                    "returns 200 if current user not active group member\n\n" \
                    "returns 403 if current user has no membership for this" \
                    " group at all\n\n" \
                    "returns 404 if group ID is invalid\n\n" \
                    "returns 422 if parameters are missing"
        do_request

        expect(response_status).to eq(200)
        membership.reload
        expect(membership.left?).to be true
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
      example "returns Forbidden", document: false do
        do_request
        expect(response_status).to eq(403)
      end
    end
  end

  # kick
  delete "/v1/groups/:group_id/members/:user_id" do

    parameter :group_id, "ID of the group", required: true
    parameter :user_id, "ID of the user to kick", required: true

    let(:member) { create(:user) }
    let(:group) { create(:group, owner: current_user) }

    let(:group_id) { group.id }
    let(:user_id) { member.id }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group)
      end

      example "Remove/Kick other user from own group", document: :v1 do
        explanation "returns 200 if user successfully removed from group\n\n" \
                    "returns 200 if invite for user successfully disabled\n\n" \
                    "returns 403 if user to be kicked has no membership" \
                    " for this group at all\n\n" \
                    "returns 403 if current user not group owner aka" \
                    " not allowed to kick members\n\n" \
                    "returns 404 if group ID is invalid\n\n" \
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
      example "returns Forbidden", document: false do
        do_request
        expect(response_status).to eq(403)
      end
    end
  end

  # settings
  patch "/v1/groups/:group_id/members" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group to delete", required: true
    parameter :notifications, "receive notifications?", scope: :group

    let(:member) { current_user }
    let(:group) { create(:group) }

    let(:group_id) { group.id }
    let(:notifications) { "false" }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group,
               notifications: true)
      end

      example "Update settings of joined group", document: :v1 do
        explanation "E.g. change notifications for group\n\n" \
                    "returns 200 if setting was successfully updated\n\n" \
                    "returns 403 if user not active group member\n\n" \
                    "returns 404 if group ID is invalid\n\n" \
                    "returns 422 if parameters are missing"
        do_request

        expect(response_status).to eq(200)
        membership.reload
        expect(membership.notifications).to eq false
      end

      describe "invalid parameter" do
        let(:notifications) { "foo" }

        # see: http://stackoverflow.com/questions/5170008/rails-validating-inclusion-of-a-boolean-fails-tests
        example "invalid boolean parameters evaluate to 'false'",
                document: false do
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

      example "returns forbidden", document: false do
        do_request
        expect(response_status).to eq(403)
      end
    end

    describe "no membership" do
      let(:membership) {}

      example "returns forbidden", document: false do
        do_request
        expect(response_status).to eq(403)
      end
    end

    describe "group ID invalid" do
      let(:group_id) { group.id + 1 }

      example "returns Not Found", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end
end
