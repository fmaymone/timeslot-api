require 'rails_helper'

describe MePolicy do
  subject { described_class }

  permissions :show?, :update?, :inactivate?, :signout?,
              :my_slots?, :slots_from_friends?, :my_media_items?,
              :add_friends?, :remove_friends?, :update_device? do
    context "for a user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, :me)
      end
    end

    context "for a visitor" do
      it "denies access" do
        expect(subject).not_to permit(nil, :me)
      end
    end
  end
end
