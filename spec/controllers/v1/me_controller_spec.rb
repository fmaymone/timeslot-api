require 'rails_helper'

RSpec.describe V1::MeController, type: :controller do
  before(:each) { request.accept = "application/json" }
  let(:current_user) { create(:user, :with_email, :with_password) }

  describe "DELETE destroy" do
    before(:each) {
      request.headers['Authorization'] = "Token token=#{current_user.auth_token}"
    }
    it "doesn't destroy the requested user" do
      expect {
        delete :inactivate
      }.not_to change(User, :count)
    end

    it "sets the deleted_at of the user", :commit do
      delete :inactivate
      current_user.reload
      expect(current_user.deleted_at).not_to eq nil
    end
  end
end
