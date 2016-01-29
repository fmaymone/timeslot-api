require 'rails_helper'

RSpec.describe PresentableSlots, type: :service do
  describe "returns collections of slots the current_user is allowed to see" do
    let(:user) { create(:user) }
    let(:current_user) { create(:user) }
    # let(:groupslot) { create(:group_slot) }
    # let(:incommon_groupslot) { create(:group_slot) }
    # let!(:memberships) {
    #   create(:membership, :active, group: groupslot.group,
    #          user: current_user)
    #   create(:membership, :active, group: groupslot.group,
    #          user: user)
    #   create(:membership, :active,
    #          group: incommon_groupslot.group, user: user)
    # }

    it "for a friend" do
      expect(
        described_class.call(relationship: FRIEND, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.std_slots.unprivate,
                             user.re_slots.unprivate]
                             # current_user.shared_group_slots(user)]
    end

    it "for a friend-of-a-friend (foaf)" do
      expect(
        described_class.call(relationship: FOAF, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.std_slots_public,
                             user.std_slots_foaf,
                             user.re_slots_public,
                             user.re_slots_foaf]
                             # current_user.shared_group_slots(user)]
    end

    it "for a stranger" do
      expect(
        described_class.call(relationship: STRANGER, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.std_slots_public,
                             user.re_slots_public]
                             # current_user.shared_group_slots(user)]
    end

    it "for a visitor" do
      expect(
        described_class.call(relationship: STRANGER, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.std_slots_public,
                             user.re_slots_public]
    end
  end
end
