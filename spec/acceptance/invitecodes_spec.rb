require 'documentation_helper'

resource "Invitecode" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  get "/v1/invitecodes/:code" do
    header "Accept", "application/json"

    parameter :code, "Invitecode string", required: true

    response_field :id, "ID of invitecode"
    response_field :context, "Context in which the invite took place, eg. EmailOnIos, Student, etc."
    response_field :userId, "ID of inviting user"

    let!(:existing_invitecode) { create(:invitecode) }
    let(:code) { existing_invitecode.code }

    example "Try to get an invitecode object for a given invite code string", document: :v1 do
      explanation "Returns 200 and invitecode object or 404 when code is not found."
      do_request

      expect(response_status).to eq(200)
      expect(json).to have_key("id")
      expect(json).to have_key("context")
      expect(json).to have_key("userId")
      expect(json["userId"]).to eq existing_invitecode.user_id
    end

    describe "Get an invitecode that is deleted" do
      let!(:existing_invitecode) { create(:invitecode, deleted_at: "2016-01-01") }

      example "Get an invitecode that is deleted", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  post "/v1/invitecodes" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :userId, "ID of inviting user", required: true
    parameter :context, "Context in which the invite took place, eg. EmailOnIos, Student, etc.", required: true

    response_field :id, "ID of invitecode"
    response_field :code, "Invitecode string"

    let(:userId) { current_user.id }
    let(:context) { "SomeContext" }

    example "Create an invitecode for a given inviting user id and invite context", document: :v1 do
      explanation "Returns 201 and invitecode string in object"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key("id")
      expect(json).to have_key("code")
      expect(json["code"]).not_to be nil
      new_invitecode = Invitecode.last
      expect(new_invitecode.user_id).to eq current_user.id
    end

    describe "Create invitecode for another user" do
      let(:userId) { create(:user).id }

      example "Create invitecode for another user", document: false do
        do_request
        expect(response_status).to eq(422)
      end
    end
  end
end
