require "rails_helper"

RSpec.describe IosController, type: :routing do
  describe "routing" do

    it "routes to #clean_db" do
      expect(get: "/ios/clean-db").to route_to("ios#clean_db")
    end
  end
end
