require 'rails_helper'

describe ReSlotPolicy do
  subject { described_class }

  let(:slot) { create(:re_slot) }

  permissions :update_reslot? do
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

  permissions :destroy_reslot? do
    context "for a user" do
      let(:user) { create(:user) }

      context "not own reslot" do
        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end

      context "own reslot" do
        let(:slot) { create(:re_slot, slotter: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
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
