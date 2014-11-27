require "rails_helper"

RSpec.describe V1::BaseSlotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/slots")
        .to route_to("v1/base_slots#index", format: :json)
    end

    it "routes to #create" do
      expect(
        post: "/v1/slots").to route_to("v1/base_slots#create", format: :json)
    end
  end
end
