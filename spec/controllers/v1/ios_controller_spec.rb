require 'rails_helper'

RSpec.describe V1::IosController, type: :controller do
  before(:each) {
    request.accept = "application/json"
  }
  let(:current_user) { create(:user) }
  let(:valid_session) { {} }

  describe "GET clean_db" do
    let!(:db_content) {
      create(:std_slot)
    }
    it "removes all entries from db" do
      expect(BaseSlot.count).to be 1
      get :clean_db
      expect(BaseSlot.count).to be 0
    end
  end
end
