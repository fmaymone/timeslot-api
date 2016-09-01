require 'documentation_helper'

share_id_webview = nil
share_id_iframe = nil
share_id_image = nil
share_id_pdf = nil
share_id_qrcode = nil
share_id_user = nil

resource "Share", :keep_data do
  let!(:current_user) { create(:user, :with_email, :with_password) }
  let!(:slot) { create(:std_slot_public, owner: current_user) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  ## -- 1. TEST SHARE SLOTS -- ##

  # Share Slot as Webview
  post "/v1/share/:id/webview" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "The id of the slot", required: true
    response_field :shareId, "The plain share ID"
    response_field :shareUrl, "The full share link including the share ID"

    context "Share Slot as Webview" do
      let(:id) { share_id_user ||= slot.id }
      let(:json) { JSON.parse(response_body) }

      example "Share Slot as Webview", document: :v1 do
        explanation "returns 404 if slot was not found\n\n" \
                    "returns 422 if slot could not be shared\n\n"
        do_request

        expect(response_status).to eq(200)

        expect(json).to include('shareId')
        expect(json).to include('shareUrl')
        # Store share ID for further testings
        share_id_webview = json['shareId']
      end
    end
  end

  # Share Slot as iFrame
  post "/v1/share/:id/iframe" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "The id of the slot", required: true
    response_field :shareId, "The plain share ID"
    response_field :shareUrl, "The full share link including the share ID"

    context "Share Slot as iFrame" do
      let(:id) { share_id_user ||= slot.id }
      let(:json) { JSON.parse(response_body) }

      example "Share Slot as iFrame", document: :v1 do
        explanation "returns 404 if slot was not found\n\n" \
                    "returns 422 if slot could not be shared\n\n"
        do_request

        expect(response_status).to eq(200)

        expect(json).to include('shareId')
        expect(json).to include('shareUrl')
        # Store share ID for further testings
        share_id_iframe = json['shareId']
      end
    end
  end

  # Share Slot as Image
  post "/v1/share/:id/image" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "The id of the slot", required: true
    response_field :shareId, "The plain share ID"
    response_field :shareUrl, "The full share link including the share ID"

    context "Share Slot as Image" do
      let(:id) { share_id_user ||= slot.id }
      let(:json) { JSON.parse(response_body) }

      example "Share Slot as Image", document: :v1 do
        explanation "returns 404 if slot was not found\n\n" \
                    "returns 422 if slot could not be shared\n\n"
        do_request
        expect(response_status).to eq(200)

        expect(json).to include('shareId')
        expect(json).to include('shareUrl')
        # Store share ID for further testings
        share_id_image = json['shareId']
      end
    end
  end

  # Share Slot as PDF
  post "/v1/share/:id/pdf" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "The id of the slot", required: true
    response_field :shareId, "The plain share ID"
    response_field :shareUrl, "The full share link including the share ID"

    context "Share Slot as PDF" do
      let(:id) { share_id_user ||= slot.id }
      let(:json) { JSON.parse(response_body) }

      example "Share Slot as PDF", document: :v1 do
        explanation "returns 404 if slot was not found\n\n" \
                    "returns 422 if slot could not be shared\n\n"
        do_request
        expect(response_status).to eq(200)

        expect(json).to include('shareId')
        expect(json).to include('shareUrl')
        # Store share ID for further testings
        share_id_pdf = json['shareId']
      end
    end
  end

  # Share Slot as QR-Code
  post "/v1/share/:id/qrcode" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "The id of the slot", required: true
    response_field :shareId, "The plain share ID"
    response_field :shareUrl, "The full share link including the share ID"

    context "Share Slot as QR-Code" do
      let(:id) { share_id_user ||= slot.id }
      let(:json) { JSON.parse(response_body) }

      example "Share Slot as QR-Code", document: :v1 do
        explanation "returns 404 if slot was not found\n\n" \
                    "returns 422 if slot could not be shared\n\n"
        do_request
        expect(response_status).to eq(200)

        expect(json).to include('shareId')
        expect(json).to include('shareUrl')
        # Store share ID for further testings
        share_id_qrcode = json['shareId']
      end
    end
  end

  # Share Slot via Email
  post "/v1/share/:id/email", :vcr, :aws do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "The id of the slot", required: true
    parameter :email, "The email of the recipient", required: true

    context "Share Slot via Email" do
      let(:id) { share_id_user ||= slot.id }
      let(:json) { JSON.parse(response_body) }
      let(:email) { 'success@simulator.amazonses.com' }

      example "Share Slot via Email", document: :v1 do
        explanation "returns 404 if slot was not found\n\n" \
                    "returns 422 if slot could not be shared\n\n"

        do_request
        expect(response_status).to eq(200)
      end
    end
  end

  ## -- 2. TEST SHARE REDIRECTS -- ##

  # Get Shared View: Webview
  get "/v1/" do
    header "Accept", "text/html"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as Webview" do
      let(:id) { share_id_webview }

      example "Get Slot as Webview", document: false do
        do_request
        expect(response_status).to eq(200)
        expect(response_body).to include('<!DOCTYPE')
        expect(response_body).to include('</html>')
      end
    end
  end

  # Get Shared View: iFrame
  get "/v1/" do
    header "Accept", "text/html"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as iFrame" do
      let(:id) { share_id_iframe }

      example "Get Slot as iFrame", document: false do
        do_request
        expect(response_status).to eq(200)
        expect(response_body).to include('<iframe')
        expect(response_body).to include('</iframe>')
      end
    end
  end

  # Get Shared View: Image
  get "/v1/" do
    header "Accept", "image/jpg"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as Image" do
      let(:id) { share_id_image }

      example "Get Slot as Image", document: false do
        do_request
        expect(response_status).to eq(200)
      end
    end
  end

  # Get Shared View: PDF
  get "/v1/" do
    header "Accept", "application/pdf"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as PDF" do
      let(:id) { share_id_pdf }

      example "Get Slot as PDF", document: false do
        do_request
        expect(response_status).to eq(200)
      end
    end
  end

  # Get Shared View: QR-Code
  get "/v1/" do
    header "Accept", "image/png"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as QR-Code" do
      let(:id) { share_id_qrcode }

      example "Get Slot as QR-Code", document: false do
        do_request
        expect(response_status).to eq(200)
      end
    end
  end

  ## -- 3. DELETE SHARED CONTENTS -- ##

  # Un-Share all views
  delete "/v1/share/:id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "The id of the slot", required: true

    context "Delete all shared content" do
      let(:id) { share_id_user ||= slot.id }

      example "Delete all shared content", document: :v1 do
        explanation "returns 404 if slot was not found\n\n" \
                    "returns 422 if slot could not be unshared\n\n"
        do_request
        expect(response_status).to eq(200)
      end
    end
  end

  ## -- 4. TEST SHARE REDIRECTS AGAIN -- ##

  # Get Shared View: Webview
  get "/v1/" do
    header "Accept", "text/html"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as Webview" do
      let(:id) { share_id_webview }

      example "Do not get Slot as Webview", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  # Get Shared View: iFrame
  get "/v1/" do
    header "Accept", "text/html"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as iFrame" do
      let(:id) { share_id_iframe }

      example "Do not get Slot as iFrame", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  # Get Shared View: Image
  get "/v1/" do
    header "Accept", "image/jpg"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as Image" do
      let(:id) { share_id_image }

      example "Do not get Slot as Image", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  # Get Shared View: PDF
  get "/v1/" do
    header "Accept", "application/pdf"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as PDF" do
      let(:id) { share_id_pdf }

      example "Do not get Slot as PDF", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end

  # Get Shared View: QR-Code
  get "/v1/" do
    header "Accept", "image/png"
    parameter :id, "The id as a part of the share URL", required: true

    context "Get Slot as QR-Code" do
      let(:id) { share_id_qrcode }

      example "Do not get Slot as QR-Code", document: false do
        do_request
        expect(response_status).to eq(404)
      end
    end
  end
end
