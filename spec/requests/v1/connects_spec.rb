require 'rails_helper'

RSpec.describe "V1::Connects", type: :request do
  let(:json) { JSON.parse(response.body) }

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

    context "new user" do
      it "returns success" do
        post "/v1/fb-connect", payload
        expect(response.status).to be(200)
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

      it "creates a new user model" do
        expect {
          post "/v1/fb-connect", payload
        }.to change(User, :count).by 1
      end

      it "returns an auth token" do
        post "/v1/fb-connect", payload
        expect(json).to have_key 'authToken'
      end
    end

    context "existing user and identity" do
      let(:user) { create(:user) }
      let!(:identity) {
        create(:connect, user: user, social_id: payload['socialId']) }

      it "returns success" do
        post "/v1/fb-connect", payload
        expect(response.status).to be(200)
      end

      it "doesn't create a new connect model" do
        expect {
          post "/v1/fb-connect", payload
        }.not_to change(Connect, :count)
      end

      it "doesn't create a new user model" do
        expect {
          post "/v1/fb-connect", payload
        }.not_to change(User, :count)
      end

      it "returns an auth token" do
        post "/v1/fb-connect", payload
        expect(json).to have_key 'authToken'
      end
    end
  end
end
