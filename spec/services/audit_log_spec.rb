require 'spec_helper'

describe AuditLog do
  let!(:user) { FactoryGirl.create(:user) }

  describe :after_commit, :commit do
    it "logs instance changes" do
      expect(Rails.logger).to receive(:info).once

      new_name = "name_#{user.id}"
      user.update(username: new_name)
    end
  end
end
