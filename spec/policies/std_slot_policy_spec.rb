require 'rails_helper'

describe StdSlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :update?, :delete? do
    let(:owner) { create(:user) }
    let(:creator) { create(:user) }

    context "for the slot owner" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot, owner: owner, creator: creator) }

      it "allows access" do
        expect(subject).to permit(owner, slot)
      end
    end

    context "for the slot creator" do
      let(:slot) { create(:std_slot, owner: owner, creator: creator) }

      it "fails with MissingCurrentUserError" do
        expect(subject).not_to permit(creator, slot)
      end
    end

    context "for a user who is neither slot owner nor creator" do
      let(:user) { create(:user) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:permissions) { [:update?] }
    let(:user) { nil }

    it "raises MissingCurrentUserError" do
      permissions.each do |permission|
        expect {
          subject.new(user, slot).public_send(permission)
        }.to raise_error TSErrors::MissingCurrentUserError
      end
    end
  end
end
