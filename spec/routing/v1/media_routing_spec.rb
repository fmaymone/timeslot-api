require "rails_helper"

RSpec.describe V1::MediaController, type: :routing do

  describe "routing" do
    it "routes to #create_signature" do
      expect(
        get: "/v1/media-signature"
      ).to route_to("v1/media#create_signature", format: :json)
    end
  end
end
