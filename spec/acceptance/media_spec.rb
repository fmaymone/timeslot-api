require 'documentation_helper'

resource "Media" do
  let(:json) { JSON.parse(response_body) }

  get "/v1/media-signature" do
    header "Accept", "application/json"

    response_field :signature, "Signature for cloudinary upload"
    response_field :pulic_id, "ID for the resource to be uploaded"
    response_field :timestamp, "Timestamp"
    response_field :api_key, "API Key"

    example "Get a new cloudinary signature", document: :v1 do
      explanation "Cloundinary signed parameters to be used for client side" \
                  " image or raw data (voice/video) upload."
      do_request

      expect(status).to eq(201)
      expect(json).to have_key("signature")
      expect(json).to have_key("public_id")
      expect(json).to have_key("timestamp")
      expect(json).to have_key("api_key")
    end
  end
end
