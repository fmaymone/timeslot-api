require 'rails_helper'

describe MetaSlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :update_metaslot? do
    context "for the slot creator" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot_private, creator: user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "for the slot owner" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot_private, owner: user) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end

    context "for a user" do
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
      }.to raise_error TS_Errors::MissingCurrentUserError
    end
  end
end
