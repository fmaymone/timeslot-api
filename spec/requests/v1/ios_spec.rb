require 'rails_helper'

RSpec.describe "V1::Ios", type: :request do
  describe "GET /v1/ios/clean-db" do
    let!(:db_content) {
      create(:std_slot)
      create(:user)
    }

    it "empties the db" do
      expect(BaseSlot.count).to be 1
      expect(User.count).not_to be 0
      get "/v1/ios/clean-db"
      expect(response.status).to be(200)
      expect(BaseSlot.count).to be 0
      expect(User.count).to be 0 # doesn't clean webview user. TODO realize why with webslot view, after cleaning we have 36 users and not 1
    end
  end
end
