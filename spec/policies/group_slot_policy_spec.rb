require 'rails_helper'

describe GroupSlotPolicy do
  subject { described_class }

  let(:group) { create(:group) }
  let(:slot) { create(:group_slot, group: group) }

  permissions :create_groupslot?, :update_groupslot?, :destroy_groupslot? do
    let(:user) { create(:user) }

    context "current_user is group owner and member (default)" do
      let(:group) { create(:group, owner: user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "current_user is group owner but not member (has left group)" do
      let(:group) { create(:group, owner: user) }
      before { user.leave_group group.id }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end

    context "current_user not group owner" do
      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end

    context "group members can post" do
      let(:group) { create(:group, :members_can_post) }
      let!(:membership) {
        create(:membership, :active, group: group, user: user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "group members can't post" do
      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end

    context "for a user" do
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
