require 'rails_helper'

RSpec.describe SlotsCollector, type: :service do
  describe "collects all slots the current_user is allowed to see" do
    let(:user) { create(:user) }

    it "for herself" do
      skip 'pending'
    end
  end
end
