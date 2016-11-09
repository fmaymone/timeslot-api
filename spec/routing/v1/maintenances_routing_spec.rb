require "rails_helper"

RSpec.describe V1::MaintenancesController, type: :routing do
  describe "routing" do

    it "routes to #health" do
      expect(
        get: "/v1/maintenance"
      ).to route_to("v1/maintenances#health", format: :json)
    end
  end
end
