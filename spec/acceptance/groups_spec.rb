require 'documentation_helper'

resource "Groups" do
  let(:json) { JSON.parse(response_body) }

  get "/v1/groups/:group_id" do
    header "Accept", "application/json"

    parameter :group_id, "ID of the group to get", required: true

    response_field :id, "ID of the group"
    response_field :name, "name of the group"
    response_field :owner_id, "user id of group owner"
    response_field :subs_can_post, "Can subscribers post?"
    response_field :subs_can_invite, "Can subscribers invite friends?"
    response_field :created_at, "Creation of group"
    response_field :updated_at, "Latest update of group in db"
    response_field :deleted_at, "Deletion of group"

    let(:group) { create(:group) }
    let(:group_id) { group.id }

    example "Get group returns group data", document: :v1 do
      explanation "returns 404 if ID is invalid\n\n"
      do_request

      expect(response_status).to eq(200)
      expect(json).to eq(group.attributes.as_json)
    end
  end

  post "/v1/groups" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :name, "Name of group", scope: :group, required: true
    parameter :subs_can_post, "Can subscribers post?", scope: :group
    parameter :subs_can_invite, "Can subscribers invite friends?", scope: :group

    response_field :id, "ID of the new group"

    let(:name) { "foo" }
    let!(:owner) { create(:user) }

    example "Create group returns data of new group", document: :v1 do
      explanation "group owner is current user\n\n" \
                  "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key("id")
      group = Group.last
      expect(group.owner).to eq owner
    end
  end

  patch "/v1/groups/:group_id" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group to update", required: true
    parameter :name, "Updated name of group", scope: :group

    let(:group) { create(:group, name: "foo") }
    let(:group_id) { group.id }

    describe "Update existing group" do
      let(:name) { "bar" }

      example "Update existing group returns No Content", document: :v1 do
        explanation "Change groupname\n\n" \
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
      parameter :new_media, "Scope for attributes of new image",
                required: true,
                scope: :group
      parameter :public_id, "Cloudinary ID / URL",
                required: true,
                scope: :new_media

      response_field :media_item_id, "Timeslot internal ID for this media item"

      let(:public_id) { "v1234567/dfhjghjkdisudgfds7iyf.jpg" }
      let(:raw_post) {{ group: { new_media: { public_id: public_id }}}.to_json }

      example "Add image to existing group returns ID & status created",
              document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary client updates the group with the image" \
                    " information."
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key("media_item_id")
        group.reload
        expect(group.image).not_to be nil
        expect(group.image.public_id).to eq public_id
      end
    end
  end

  delete "/v1/groups/:group_id" do
    parameter :group_id, "ID of the group to delete", required: true

    let(:group) { create(:group) }
    let(:group_id) { group.id }

    example "Delete group returns the group", document: :v1 do
      explanation "Sets 'deleted_at' on the group.\n\n" \
                  "Doesn't delete anything.\n\n" \
                  "returns 404 if ID is invalid\n\n"
      do_request

      group.reload
      expect(group.deleted_at).not_to be nil
      expect(response_status).to eq(200)
      expect(json).to eq(group.attributes.as_json)
    end
  end

  get "/v1/groups/:group_id/members" do
    header "Accept", "application/json"

    parameter :group_id, "ID of the group to get", required: true

    response_field :group_id, "ID of the group"
    response_field :size, "Number of group members (excluding owner)"
    response_field :members, "Array of users"
    response_field :user_id, "ID of member"
    response_field :username, "name of member"
    response_field :user_url, "URL for member"

    let(:group) { create(:group) }
    let(:group_id) { group.id }

    example "Get list of all group members", document: :v1 do
      explanation "returns 404 if ID is invalid\n\n"
      create_list(:membership, 3, group: group)

      do_request

      expect(response_status).to eq(200)
      expect(json).to include({
                                "group_id" => group.id,
                                "size" => group.members.size
                              })
      # TODO: need to get the correct user_url here
      expect(json["members"].first.except("user_url"))
        .to eq({
                 "user_id" => group.members.first.id,
                 "username" => group.members.first.username
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

  patch "/v1/groups/:group_id/members" do
    header "Content-Type", "application/json"

    parameter :group_id, "ID of the group to delete", required: true
    parameter :notifications, "receive notifications?", scope: :group

    let(:member) { create(:user) }
    let(:group) { create(:group) }

    let(:group_id) { group.id }
    let(:notifications) { "true" }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group,
               notifications: false)
      end

      example "Update settings of joined group returns OK", document: :v1 do
        explanation "Change notifications for group\n\n" \
                    "returns 403 if user not active group member\n\n" \
                    "returns 404 if group ID is invalid\n\n" \
                    "returns 422 if parameters are missing"
        do_request

        expect(response_status).to eq(200)
        membership.reload
        expect(membership.notifications).to eq true
      end

      describe "invalid parameter" do
        let(:notifications) { "foo" }

        example "returns Unprocessable Entity", document: false do
          skip "request dosn't fail, but also doesn't update"
          do_request
          expect(response_status).to eq(422)
        end

        example "does not change notifications", document: false do
          do_request
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
