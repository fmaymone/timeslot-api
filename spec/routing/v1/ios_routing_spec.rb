require "rails_helper"

RSpec.describe V1::IosController, type: :routing do
  describe "routing" do
    it "routes to #clean_db" do
      expect(
        get: "v1/ios/clean-db"
      ).to route_to("v1/ios#clean_db", format: :json)
    end
  end
end
