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

  permissions :friends? do
    let(:user) { create(:user) }

    context "for yourself" do
      it "allows access" do
        expect(subject).to permit(user, user)
      end
    end

    context "for a friend" do
      let(:friend) do
        friend = create(:user)
        create(:friendship, :established, user: user, friend: friend)
        friend
      end

      it "allows access" do
        expect(subject).to permit(user, friend)
      end
    end

    context "for a foaf" do
      let(:foaf) do
        foaf = create(:user)
        friend = create(:user)
        create(:friendship, :established, user: user, friend: friend)
        create(:friendship, :established, user: foaf, friend: friend)
        foaf
      end

      it "denies access" do
        expect(subject).not_to permit(user, foaf)
      end
    end

    context "for a stranger" do
      let(:stranger) { create(:user) }

      it "denies access" do
        expect(subject).not_to permit(user, stranger)
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
