require "rails_helper"

RSpec.describe V1::ConnectsController, type: :routing do
  describe "routing" do

    it "routes to #facebook-connect" do
      expect(
        post: "/v1/fb-connect"
      ).to route_to("v1/connects#facebook_connect", format: :json)
    end
  end
end
