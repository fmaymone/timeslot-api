require 'documentation_helper'

resource "Users" do
  let(:json) { JSON.parse(response_body) }

  get "/v1/users/authenticate/:id" do
    header "Accept", "application/json"

    parameter :id, "ID of the user to authenticate", required: true

    let!(:first_user) { create(:user) } # should not be the current_user
    let(:user) { create(:user) }
    let(:id) { user.id }
    let(:testgroup) { attributes_for(:group) }

    # The best idea I had to check which user is set as current_user was taking
    # an action which uses the current_user and see if it gets set correctly
    example "Authenticate an user", document: :v1 do
      explanation "returns OK if User set as current user\n\n" \
                  "returns 404 if ID is invalid\n\n"
      do_request

      expect(response_status).to eq(200)

      client.post(URI.parse("/v1/groups").path, { group: testgroup }, headers)
      expect(status).to eq(201)
      expect(json['ownerId']).to eq user.id
    end
  end

  get "/v1/users/:id" do
    header "Accept", "application/json"

    parameter :id, "ID of the user to get", required: true

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"

    let(:user) { create(:user) }
    let(:id) { user.id }
    let(:deleted_at) { user.deleted_at.nil? ? nil : user.deleted_at.iso8601 }

    example "Get user returns user data", document: :v1 do
      explanation "returns 404 if ID is invalid\n\n"
      do_request

      expect(response_status).to eq(200)
      expect(json).to eq(user.attributes.as_json
                          .transform_keys{ |key| key.camelize(:lower) })
    end
  end

  post "/v1/users" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :username, "Username of user (max. 20 characters)",
              scope: :user, required: true

    response_field :id, "ID of the new user"

    let(:username) { "foo" }

    example "Create user returns ID of new user", document: :v1 do
      explanation "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key("id")
    end
  end

  patch "/v1/users/:id" do
    header "Content-Type", "application/json"

    parameter :id, "ID of the user to update", required: true
    parameter :username, "Updated username of user (max. 20 characters)",
              scope: :user

    let!(:user) { create(:user, username: "foo") }
    let(:id) { user.id }
    let(:username) { "bar" }

    example "Update an existing user returns No Content", document: :v1 do
      explanation "Change username\n\n" \
                  "returns 404 if ID is invalid\n\n" \
                  "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      user.reload
      expect(user.username).to eq "bar"
      expect(response_status).to eq(204)
      expect(response_body).to eq("")
    end
  end

  delete "/v1/users/:id" do
    parameter :id, "ID of the user to delete", required: true

    let!(:user) { create(:user) }
    let(:id) { user.id }

    example "Delete user sets 'deletedAt' and returns user data",
            document: :v1 do
      explanation "Doesn't delete anything.\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      user.reload
      expect(user.deleted_at).not_to be nil
      expect(response_status).to eq(200)
      expect(json).to eq(user.attributes.as_json
                          .transform_keys{ |key| key.camelize(:lower) })
    end
  end
end
