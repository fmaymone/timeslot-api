require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  permissions :create?, :signin?, :reset_password?, :slots? do
    context "for a visitor" do
      let(:user) { nil }

      it "allows access" do
        expect(subject).to permit(user, User)
      end
    end
  end

  permissions :index?, :show?, :update?, :add_friends?,
              :remove_friends?, :destroy?, :signout?,
              :slots_from_friends?, :media_items? do
    context "for a user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, User)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, User)
      end
    end
  end
end
