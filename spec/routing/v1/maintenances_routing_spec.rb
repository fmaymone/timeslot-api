require "rails_helper"

RSpec.describe V1::MaintenancesController, type: :routing do
  describe "routing" do

    it "routes to #health" do
      expect(
        get: "/v1/maintenance"
      ).to route_to("v1/maintenances#health", format: :json)
    end

    it "routes to #clientversions" do
      expect(
        get: "/v1/maintenance/clientversions"
      ).to route_to("v1/maintenances#clientversions", format: :json)
    end

    it "routes to #clean_db" do
      expect(
        get: "v1/maintenance/clean-db"
      ).to route_to("v1/maintenances#clean_db", format: :json)
    end
  end
end
