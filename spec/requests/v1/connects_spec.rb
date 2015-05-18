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

      it "sets the fbemail as the email for the new user" do
        post "/v1/fb-connect", payload
        expect(User.last.email).to eq payload['email']
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
        expect(json['authToken']).not_to be nil
      end

      context "invalid data" do
        it "invalid username returns an error" do
          post "/v1/fb-connect", payload.merge(username: 'x' * 55)
          expect(json).to have_key 'error'
        end
      end
    end

    context "existing user without existing identity (matching email)", :seed do
      context "non-verified email address" do
        let!(:user) { create(:user, :with_email, email_verified: false) }

        it "returns unprocessable entity" do
          post "/v1/fb-connect", payload.merge(email: user.email)
          expect(response.status).to be(422)
        end

        it "returns an error" do
          post "/v1/fb-connect", payload.merge(email: user.email)
          expect(json).to have_key 'error'
        end

        it "doesn't create a new user model" do
          expect {
            post "/v1/fb-connect", payload.merge(email: user.email)
          }.not_to change(User, :count)
        end

        it "doesn't create a new connect model" do
          expect {
            post "/v1/fb-connect", payload.merge(email: user.email)
          }.not_to change(Connect, :count)
        end

        it "doesn't return an auth token" do
          post "/v1/fb-connect", payload.merge(email: user.email)
          expect(json).not_to have_key 'authToken'
        end
      end

      context "verified email address" do
        let!(:user) { create(:user, :with_email, email_verified: true) }

        it "returns success" do
          post "/v1/fb-connect", payload.merge(email: user.email)
          expect(response.status).to be(200)
        end

        it "doesn't create a new user model" do
          expect {
            post "/v1/fb-connect", payload.merge(email: user.email)
          }.not_to change(User, :count)
        end

        it "creates a new connect model" do
          expect {
            post "/v1/fb-connect", payload.merge(email: user.email)
          }.to change(Connect, :count).by 1
        end

        it "returns an auth token" do
          post "/v1/fb-connect", payload.merge(email: user.email)
          expect(json).to have_key 'authToken'
          expect(json['authToken']).to eq user.auth_token
        end
      end
    end

    context "existing user and identity (social sign in)" do
      let!(:user) { create(:user) }
      let!(:identity) {
        create(:connect, user: user, social_id: payload['socialId']) }

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
        expect(json['authToken']).not_to be nil
      end

      it "creates an auth token if non exists" do
        user.update(auth_token: nil)
        post "/v1/fb-connect", payload
        expect(json).to have_key 'authToken'
        expect(json['authToken']).not_to be nil
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

      it "returns 422 if email address already used by other timeslot user" do
        create(:user, email: payload['email'])
        post "/v1/fb-connect", payload, auth_header
        expect(response).to have_http_status 422
      end
    end

    context "signed-in user with existing facebook identity (re-connect)" do
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

    context "signed-in user & existing facebook identity with other user connected (collision)" do
      let!(:identity) {
        create(:connect, social_id: payload['socialId']) }

      it "returns unprocessable entity" do
        post "/v1/fb-connect", payload, auth_header
        expect(response.status).to be(422)
      end

      it "returns an error" do
        post "/v1/fb-connect", payload, auth_header
        expect(response.body).to include 'account already connected'
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

  describe "POST /v1/tw-connect" do
    let(:payload) do
      {
        "socialId" => 3186786310,
        "username" => "alexandrospar",
        "auth_token" => "3186786310-OCKGioG9L94PwGc3Qjm4jIU6xIm1Bi5sWrl37xV",
        "auth_secret" => "CAAFayXB6p6oBAChjrbg1RB6QoIdJyZasdfljk214C6k5x"
      }
    end

    context "new user (social sign up)", :seed do
      it "returns success" do
        post "/v1/tw-connect", payload
        expect(response.status).to be(200)
      end

      it "creates a new user model" do
        expect {
          post "/v1/tw-connect", payload
        }.to change(User, :count).by 1
      end

      it "creates a new connect model" do
        expect {
          post "/v1/tw-connect", payload
        }.to change(Connect, :count).by 1
      end

      it "saves additional data for the connect" do
        post "/v1/tw-connect", payload
        connect = Connect.last
        expect(connect.data).to have_key 'auth_secret'
      end

      it "returns an auth token" do
        post "/v1/tw-connect", payload
        expect(json).to have_key 'authToken'
      end

      context "invalid data" do
        it "returns an error" do
          post "/v1/tw-connect", payload.merge(username: 'x' * 55)
          expect(json).to have_key 'error'
        end
      end
    end

    context "existing user and identity (social sign in)" do
      let!(:identity) { create(:connect, :twitter, user: create(:user),
                               social_id: payload['socialId']) }

      it "returns success" do
        post "/v1/tw-connect", payload
        expect(response.status).to be(200)
      end

      it "doesn't create a new user model" do
        expect {
          post "/v1/tw-connect", payload
        }.not_to change(User, :count)
      end

      it "doesn't create a new connect model" do
        expect {
          post "/v1/tw-connect", payload
        }.not_to change(Connect, :count)
      end

      it "returns an auth token" do
        post "/v1/tw-connect", payload
        expect(json).to have_key 'authToken'
      end
    end

    context "signed-in user without existing facebook identity (connect)", :seed do
      it "returns success" do
        post "/v1/tw-connect", payload, auth_header
        expect(response.status).to be(200)
      end

      it "doesn't create a new user model" do
        expect {
          post "/v1/tw-connect", payload, auth_header
        }.not_to change(User, :count)
      end

      it "creates a new connect model" do
        expect {
          post "/v1/tw-connect", payload, auth_header
        }.to change(Connect, :count).by 1
      end

      it "saves additional data for the connect" do
        post "/v1/tw-connect", payload, auth_header
        connect = Connect.last
        expect(connect.data).to have_key 'auth_secret'
      end


      it "doesn't return an auth token" do
        post "/v1/tw-connect", payload, auth_header
        expect(response.body).not_to include 'authToken'
      end
    end

    context "signed-in user with existing facebook identity (merge)" do
      let!(:identity) { create(:connect, :twitter, user: current_user,
                               social_id: payload['socialId']) }

      it "returns success" do
        post "/v1/tw-connect", payload, auth_header
        expect(response.status).to be(200)
      end

      it "doesn't create a new user model" do
        expect {
          post "/v1/tw-connect", payload, auth_header
        }.not_to change(User, :count)
      end

      it "doesn't create a new connect model" do
        expect {
          post "/v1/tw-connect", payload, auth_header
        }.not_to change(Connect, :count)
      end

      it "doesn't return an auth token" do
        post "/v1/tw-connect", payload, auth_header
        expect(response.body).not_to include 'authToken'
      end
    end
  end
end
