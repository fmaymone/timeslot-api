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

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end
end
