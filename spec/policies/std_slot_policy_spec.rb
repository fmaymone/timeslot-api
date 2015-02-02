require 'rails_helper'

describe StdSlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :create_stdslot?, :update_stdslot?, :destroy_stdslot? do
    context "for a user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
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
