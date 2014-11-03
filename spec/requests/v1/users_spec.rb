require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /v1/users" do
    it "returns success" do
      get "/v1/users"
      expect(response.status).to be(200)
    end
  end

  describe "GET /v1/user/:id" do
    let(:user) { create(:user) }

    context "with valid ID" do
      it "returns the requested user" do
        get "/v1/users/#{user.id}"
        expect(json['username']).to eq(user.username)
      end
    end

    context "for hidden user", :focus do
      before(:each) do
        user.displayed = false
        user.save
      end

      it "doesn't return the requested user" do
        get "/v1/users/#{user.id}"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /v1/users" do
    describe "with valid params" do
      let(:valid_attributes) { attributes_for(:user) }

      it "returns ID of created user" do
        post v1_user_create_path, { user: valid_attributes }
        expect(json).to have_key('id')
      end

      it "does not return displayed state" do
        post v1_user_create_path, { user: valid_attributes }
        expect(json).to_not have_key('displayed')
      end
    end
  end
end
