require 'rails_helper'

describe MePolicy do
  subject { described_class }

  permissions :show?, :update?, :inactivate?, :signout?, :suggested_users?,
              :my_slots?, :schedule?, :slots_of_my_friends?, :my_media_items?,
              :calendars?, :add_friends?, :remove_friends?, :update_device? do
    context "for a user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, :me)
      end
    end
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [
        :show?, :update?, :inactivate?, :signout?, :suggested_users?,
        :my_slots?, :schedule?, :slots_of_my_friends?, :my_media_items?,
        :calendars?, :add_friends?, :remove_friends?, :update_device?
      ]
    }
    let(:user) { nil }

    it "raises MissingCurrentUserError" do
      permissions.each do |permission|
        expect {
          subject.new(user, :me).public_send(permission)
        }.to raise_error TSErrors::MissingCurrentUserError
      end
    end
  end
end
