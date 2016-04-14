require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  permissions :create?, :signin?, :reset_password?, :slots?, :media_items? do
    context "for a visitor" do
      let(:user) { nil }

      it "allows access" do
        expect(subject).to permit(user, User)
      end
    end
  end

  permissions :show?, :friends?, :calendars? do
    context "for a user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, User)
      end
    end

    context 'for a visitor / invalid or missing auth_token' do
      let(:user) { nil }

      it "raises MissingCurrentUserError" do
        expect {
          subject.new(user, User).public_send(:show?)
        }.to raise_error TSErrors::MissingCurrentUserError
      end
    end
  end

  permissions :global_group? do
    context "current_user has role 'curator'", :seed do
      let(:user) { User.find_by email: 'global-importer@timeslot.com' }

      it "allows access" do
        expect(subject).to permit(user, User)
      end
    end

    context "current_user is a basic user" do
      let(:user) { create(:user) }

      it "denies access" do
        expect(subject).not_to permit(user, User)
      end
    end
  end
end
