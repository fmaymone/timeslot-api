require 'spec_helper'

RSpec.describe PresentableSlots, type: :service do
  describe "returns collections of slots the current_user is allowed to see" do
    let(:user) { FactoryGirl.create(:user) }

    context 'my slots' do
      it "for herself" do
        expect(
          described_class.call(relationship: ME, user: user)
        ).to eq [user.std_slots, user.re_slots]
      end
    end

    context 'someone elses slots' do
      let(:current_user) { FactoryGirl.create(:user) }
      let(:groupslot) { FactoryGirl.create(:group_slot) }
      let(:incommon_groupslot) { FactoryGirl.create(:group_slot) }
      let!(:memberships) {
        FactoryGirl.create(:membership, :active, group: groupslot.group,
                           user: current_user)
        FactoryGirl.create(:membership, :active, group: groupslot.group,
                           user: user)
        FactoryGirl.create(:membership, :active,
                           group: incommon_groupslot.group, user: user)
      }

      it "for a friend" do
        expect(
          described_class.call(relationship: FRIEND, user: user,
                               current_user: current_user)
        ).to eq [user.std_slots_public, user.std_slots_friends,
                 user.re_slots, current_user.shared_group_slots(user)]

      end

      it "for a stranger" do
        expect(
          described_class.call(relationship: STRANGER, user: user,
                               current_user: current_user)
        ).to eq [user.std_slots_public, user.re_slots,
                 current_user.shared_group_slots(user)]
      end

      it "for a visitor" do
        expect(
          described_class.call(relationship: STRANGER, user: user)
        ).to eq [user.std_slots_public, user.re_slots]
      end
    end
  end
end
