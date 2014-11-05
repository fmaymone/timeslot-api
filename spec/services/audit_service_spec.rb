require 'spec_helper'

describe AuditService  do
  let(:user) { FactoryGirl.create(:user) }

  describe :after_commit, :commit do
    it "logs instance changes" do
      # twice: once for creation, once for change
      expect(Rails.logger).to receive(:info).twice

      new_name = "name_#{user.id}"
      user.update(username: new_name)
    end
  end
end
