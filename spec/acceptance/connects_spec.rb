require 'documentation_helper'

resource "Connects" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/fb-connect", :seed do
    header "Content-Type", "application/json"

    parameter :socialId, "Facebook App specific ID of the user",
              required: true
    parameter :username, "Username of user (max. 50 characters)",
              required: true
    parameter :email, "Email of the user on facebook"
    parameter :first_name, "First name of the user on facebook"
    parameter :middle_name, "Middle name of the user on facebook"
    parameter :last_name, "Last name of the user on facebook"
    parameter :gender, "Gender of the user on facebook"
    parameter :link, "URL of the users public profile on facebook"
    parameter :locale, "Locale of the user on facebook"
    parameter :timezone, "Timezone of the user on facebook"
    parameter :updated_time, "Last updated time of the user on facebook"
    parameter :verified, "Verification state of the user on facebook"
    parameter :token, "Facebook secret token for the user"

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :email, "Email of the user"

    let(:socialId) { 10152854206708061 }
    let(:username) { "Silvi O Ivlis" }
    let(:first_name) { "Silvi" }
    let(:last_name) { "Ivlis" }
    let(:middle_name) { "O" }
    let(:gender) { "male" }
    let(:link) { "https://www.facebook.com/app_scoped_user_id/10152854206708061/" }
    let(:locale) { "en_US" }
    let(:timezone) { 2 }
    let(:updated_time) { "2013-12-04T18:09:09+0000" }
    let(:verified) { 1 }
    let(:email) { "alexpar@gmail.com" }
    let(:token) { "CAAFayXB6p6oBAChjrbg1RB6QoIdJyZC6k5xI8Srd214c13eMbtTasOTHwueRfw7jTqRiHSyOh4a9mOvN81obZCtQBBfrnVWjovjC8N00J0bfStxQLXVD3AfSgL8GSSXkkyO8mbTM85jidp4WZCZAAdCjQzNEmoelrnDow9tgILcF2fJrK3t1PZBcHh0II51ub9VvHaZC4ujQgsGPIZCmyuCDbZCUk7UMuul5o6telCWe0taZCRFsdwrHj" }

    context "signup/signin" do
      response_field :authToken, "Auth Token (if user wasn't signed in)"

      context "sign up" do
        example "Sign up with facebook", document: :v1 do
          explanation "returns 200 and an authToken\n\n" \
                      "returns 422 if facebook email already used by other user"
          do_request

          expect(response_status).to eq(200)
          expect(json).to have_key 'authToken'
        end
      end

      context "sign up/in (matching email)" do
        let!(:user) { create(:user, email: email) }

        example "Sign up/in with facebook (matching email address)",
                document: :v1 do
          explanation "returns 200 and signs the user with the matching " \
                      "email address in (we assume he is the legit owner of " \
                      "the existing timeslot account)"
          do_request

          expect(response_status).to eq(200)
          expect(json).to have_key 'authToken'
        end
      end

      context "sign in" do
        let(:user) { create(:user) }
        let!(:identity) {
          create(:connect, user: user, social_id: socialId) }

        example "Sign in with facebook", document: :v1 do
          explanation "Existing connection to the submitted facebook account\n\n" \
                      "returns 200 and an authToken"
          do_request

          expect(response_status).to eq(200)
          expect(json).to have_key 'authToken'
        end
      end
    end

    context "connect" do
      header "Authorization", :auth_header

      example "Connect facebook account", document: :v1 do
        explanation "User must be signed in, no existing connection " \
                    "to the submitted facebook account\n\n" \
                    "returns 200 and the user data\n\n" \
                    "returns 422 if email already used by other user"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key 'id'
        expect(json).not_to have_key 'authToken'
      end
    end

    context "failing connect" do
      header "Authorization", :auth_header

      let(:user) { create(:user) }
      let!(:identity) {
        create(:connect, user: user, social_id: socialId) }

      example "Connect facebook account, email collision", document: false do
        do_request

        expect(response_status).to eq(422)
        expect(json).not_to have_key 'id'
        expect(json).not_to have_key 'authToken'
        expect(json).to have_key 'error'
      end
    end
  end

  post "/v1/tw-connect", :seed do
    header "Content-Type", "application/json"

    parameter :username, "Username of user (max. 50 characters)",
              required: true
    parameter :socialId, "Twitter ID of the user",
              required: true
    parameter :auth_token, "Twitter Auth Token"
    parameter :auth_secret, "Twitter Auth Secret"

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"

    let(:socialId) { 3186786310 }
    let(:username) { "alexandrospar" }
    let(:auth_token) { "3186786310-OCKGioG9L94PwGc3Qjm4jIU6xIm1Bi5sWrl37xV" }
    let(:auth_secret) { "CAAFayXB6p6oBAChjrbg1RB6QoIdJyZasdfljk214C6k5x" }


    context "signup/signin" do
      response_field :authToken, "Auth Token for HTTP Header"

      context "sign up" do
        example "Sign up with twitter", document: :v1 do
          explanation "returns 200 and an authToken"
          do_request

          expect(response_status).to eq(200)
          expect(json).to have_key 'authToken'
        end
      end

      context "sign in" do
        let(:user) { create(:user) }
        let!(:identity) {
          create(:connect, user: user, social_id: socialId) }

        example "Sign in with twitter", document: :v1 do
          explanation "Existing connection to the submitted twitter account\n\n" \
                      "returns 200 and an authToken"
          do_request

          expect(response_status).to eq(200)
          expect(json).to have_key 'authToken'
        end
      end
    end

    context "connect" do
      header "Authorization", :auth_header

      example "Connect twitter account", document: :v1 do
        explanation "User must be signed in, no existing connection " \
                    "to the submitted twitter account\n\n" \
                    "returns 200 and the user data"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key 'id'
        expect(json).not_to have_key 'authToken'
      end
    end
  end
end
