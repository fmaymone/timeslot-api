require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  describe "GET /v1_users" do
    it "works! (now write some real specs)" do
      get v1_users_path
      expect(response.status).to be(200)
    end
  end

  describe "POST /v1_users" do
    describe "with valid params" do
      let(:valid_attributes) { attributes_for(:user) }

      it "returns ID of created user" do
        post v1_user_create_path, { user: valid_attributes }
        json = JSON.parse(response.body)
        expect(json).to have_key('id')
      end

      it "does not return displayed state" do
        post v1_user_create_path, { user: valid_attributes }
        json = JSON.parse(response.body)
        expect(json).to_not have_key('displayed')
      end
    end
  end
end
