require 'rails_helper'

describe MetaSlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :update_metaslot? do
    let(:owner) { create(:user) }
    let(:creator) { create(:user) }
    let(:slot) {
      create(:std_slot_private, owner: owner, creator: creator) }

    context "for the slot creator" do
      it "allows access" do
        expect(subject).to permit(creator, slot)
      end
    end

    context "for the slot owner" do
      it "denies access" do
        expect(subject).not_to permit(owner, slot)
      end
    end

    context "for another user" do
      let(:user) { create(:user) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:user) { nil }

    it "raises MissingCurrentUserError" do
      expect {
        subject.new(user, slot).public_send(:update_metaslot?)
      }.to raise_error TSErrors::MissingCurrentUserError
    end
  end
end
