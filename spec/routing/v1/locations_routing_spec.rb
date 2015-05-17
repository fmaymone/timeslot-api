require "rails_helper"

RSpec.describe V1::LocationsController, type: :routing do
  describe "routing" do

    it "routes to #search" do
      expect(
        get: "/v1/locations/search"
      ).to route_to("v1/locations#search", format: :json)
    end
  end
end
