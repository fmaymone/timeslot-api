require 'rails_helper'

RSpec.describe "V1::Groups", :type => :request do
  describe "GET /v1_groups" do
    it "works! (now write some real specs)" do
      get v1_groups_path
      expect(response.status).to be(200)
    end
  end
end
