require 'rails_helper'

RSpec.describe V1::GlobalSlotsController, type: :routing do
  describe "routing" do
    it "routes to search#global_slots" do
      expect(get: "/v1/globalslots/search")
        .to route_to("v1/search#global_slots", format: :json)
    end

    it "routes to #create_reslot" do
      expect(post: "/v1/globalslots/reslot")
        .to route_to("v1/global_slots#create_reslot", format: :json)
    end
  end
end
