require 'rails_helper'

RSpec.describe "V1::Connects", type: :request do
  let(:json) { JSON.parse(response.body) }
  # let!(:current_user) { create(:user) }
  # let(:auth_header) do
    # { 'Authorization' => "Token token=#{current_user.auth_token}" }
  # end

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
      let(:slots) { slots.push create(:std_slot_public, owner: current_user) }

      it "returns success" do
        p 'hole'
        post "/v1/fb-connect", payload
        expect(response.status).to be(200)
      end

      it "creates a new connect model" do
        expect {
          post "/v1/fb-connect", payload
        }.to change(Connect, :count).by 1
      end

      it "creates a new user model" do
        expect {
          post "/v1/fb-connect", payload
        }.to change(User, :count).by 1
      end

      it "returns an auth token" do
        post "/v1/fb-connect", payload
        expect(json).to have_key :authToken
      end

    end

    context "existing user" do

    end
  end
end
