require 'rails_helper'

RSpec.describe V1::GlobalSlotsController, type: :routing do
  describe "routing" do
    it "routes to #search" do
      expect(get: "/v1/globalslots/search")
        .to route_to("v1/global_slots#search", format: :json)
    end

    it "routes to #create_reslot" do
      expect(post: "/v1/globalslots/reslot")
        .to route_to("v1/global_slots#create_reslot", format: :json)
    end
  end
end
