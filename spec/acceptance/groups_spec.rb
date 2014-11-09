require 'documentation_helper'

resource "Groups" do
  let(:json) { JSON.parse(response_body) }

  get "/v1/groups/:id" do
    header "Accept", "application/json"

    parameter :id, "ID of the group to get", required: true

    response_field :id, "ID of the group"
    response_field :name, "name of the group"
    response_field :owner_id, "user id of group owner"
    response_field :subs_can_post, "Can subscribers post?"
    response_field :subs_can_invite, "Can subscribers invite friends?"
    response_field :created_at, "Creation of group"
    response_field :updated_at, "Latest update of group in db"
    response_field :deleted_at, "Deletion of group"

    let(:group) { create(:group) }
    let(:id) { group.id }
    let(:deleted_at) { group.deleted_at.nil? ? nil : group.deleted_at.iso8601 }

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
    parameter :owner_id, "User ID of group owner", scope: :group, required: true
    parameter :subs_can_post, "Can subscribers post?", scope: :group
    parameter :subs_can_invite, "Can subscribers invite friends?", scope: :group

    response_field :id, "ID of the new group"

    let(:name) { "foo" }
    let(:owner_id) { create(:user).id }

    example "Create group returns data of new group", document: :v1 do
      explanation "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key("id")
    end
  end

  patch "/v1/groups/:id" do
    header "Content-Type", "application/json"

    parameter :id, "ID of the group to update", required: true
    parameter :name, "Updated name of group", scope: :group

    let(:group) { create(:group, name: "foo") }
    let(:id) { group.id }
    let(:name) { "bar" }

    example "Update an existing group returns No Content", document: :v1 do
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

  delete "/v1/groups/:id" do
    parameter :id, "ID of the group to delete", required: true

    let(:group) { create(:group) }
    let(:id) { group.id }

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

  patch "/v1/groups/:group_id/members" do
    parameter :group_id, "ID of the group to delete", required: true
    parameter :notifications, "receive notifications?", scope: :group

    let(:member) { create(:user) }
    let(:group) { create(:group) }

    let(:group_id) { group.id }
    let(:notifications) { false }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group,
               notifications: true)
      end

      example "Update settings of joined group returns OK", document: :v1 do
        explanation "Change notifications for group\n\n" \
                    "returns 403 if user not active group member\n\n" \
                    "returns 404 if group ID is invalid\n\n" \
                    "returns 422 if parameters are missing\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(200)
        expect(response_body).to eq("")
        membership.reload
        expect(membership.notifications).to eq false
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

    describe "group not existing" do
      let!(:membership) do
        create(:membership, :inactive, user: member, notifications: true)
      end

      example "returns Not Found", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end

    describe "invalid parameter" do
      let(:notifications) { "foo" }

      example "returns Unprocessable Entity", document: false do
        do_request
        expect(response_status).to eq(422)
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
end
