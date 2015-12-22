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

  permissions :show? do
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
end
