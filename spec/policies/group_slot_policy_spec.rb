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
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [
        :create_groupslot?, :update_groupslot?, :destroy_groupslot?
      ]
    }
    let(:user) { nil }

    it "raises MissingCurrentUserError" do
      permissions.each do |permission|
        expect {
          subject.new(user, slot).public_send(permission)
        }.to raise_error TS_Errors::MissingCurrentUserError
      end
    end
  end
end
