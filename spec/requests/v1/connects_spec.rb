require 'rails_helper'

RSpec.describe "V1::Connects", type: :request do
  let(:json) { JSON.parse(response.body) }
  let!(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "POST /v1/fb-connect" do
    let(:payload) do
      {
        "socialId" => 10152854206708061,
        "first_name" => "Silvi",
        "last_name" => "Ivlis",
        "middle_name" => "O",
        "username" => "Silvi O Ivlis",
        "gender" => "male",
        "link" => "https://www.facebook.com/app_scoped_user_id/10152854206708061/",
        "locale" => "en_US",
        "timezone" => 2,
        "updated_time" => "2013-12-04T18:09:09+0000",
        "verified" => 1,
        "email" => "alexpar@gmail.com",
        "token" => "CAAFayXB6p6oBAChjrbg1RB6QoIdJyZC6k5xI8Srd214c13eMbtTasOTHwueRfw7jTqRiHSyOh4a9mOvN81obZCtQBBfrnVWjovjC8N00J0bfStxQLXVD3AfSgL8GSSXkkyO8mbTM85jidp4WZCZAAdCjQzNEmoelrnDow9tgILcF2fJrK3t1PZBcHh0II51ub9VvHaZC4ujQgsGPIZCmyuCDbZCUk7UMuul5o6telCWe0taZCRFsdwrHj"
      }
    end

    context "new user (social sign up)", :seed do
      it "returns success" do
        post "/v1/fb-connect", payload
        expect(response.status).to be(200)
      end

      it "creates a new user model" do
        expect {
          post "/v1/fb-connect", payload
        }.to change(User, :count).by 1
      end

      it "creates a new connect model" do
        expect {
          post "/v1/fb-connect", payload
        }.to change(Connect, :count).by 1
      end

      it "saves additional data for the connect" do
        post "/v1/fb-connect", payload
        connect = Connect.last
        expect(connect.data).to have_key 'first_name'
      end

      it "returns an auth token" do
        post "/v1/fb-connect", payload
        expect(json).to have_key 'authToken'
      end

      context "invalid data" do
        it "returns an error" do
          post "/v1/fb-connect", payload.merge(username: 'x' * 55)
          expect(json).to have_key 'error'
        end
      end
    end

    context "existing user and identity (social sign in)" do
      let!(:identity) {
        create(:connect, user: create(:user), social_id: payload['socialId']) }

      it "returns success" do
        post "/v1/fb-connect", payload
        expect(response.status).to be(200)
      end

      it "doesn't create a new user model" do
        expect {
          post "/v1/fb-connect", payload
        }.not_to change(User, :count)
      end

      it "doesn't create a new connect model" do
        expect {
          post "/v1/fb-connect", payload
        }.not_to change(Connect, :count)
      end

      it "returns an auth token" do
        post "/v1/fb-connect", payload
        expect(json).to have_key 'authToken'
      end
    end

    context "signed-in user without existing facebook identity (connect)", :seed do
      it "returns success" do
        post "/v1/fb-connect", payload, auth_header
        expect(response.status).to be(200)
      end

      it "doesn't create a new user model" do
        expect {
          post "/v1/fb-connect", payload, auth_header
        }.not_to change(User, :count)
      end

      it "creates a new connect model" do
        expect {
          post "/v1/fb-connect", payload, auth_header
        }.to change(Connect, :count).by 1
      end

      it "saves additional data for the connect" do
        post "/v1/fb-connect", payload, auth_header
        connect = Connect.last
        expect(connect.data).to have_key 'first_name'
      end

      it "doesn't return an auth token" do
        post "/v1/fb-connect", payload, auth_header
        expect(response.body).not_to include 'authToken'
      end
    end

    context "signed-in user with existing facebook identity (merge)" do
      let!(:identity) {
        create(:connect, user: current_user, social_id: payload['socialId']) }

      it "returns success" do
        post "/v1/fb-connect", payload, auth_header
        expect(response.status).to be(200)
      end

      it "doesn't create a new user model" do
        expect {
          post "/v1/fb-connect", payload, auth_header
        }.not_to change(User, :count)
      end

      it "doesn't create a new connect model" do
        expect {
          post "/v1/fb-connect", payload, auth_header
        }.not_to change(Connect, :count)
      end

      it "doesn't return an auth token" do
        post "/v1/fb-connect", payload, auth_header
        expect(response.body).not_to include 'authToken'
      end
    end
  end
end
