require 'rails_helper'

RSpec.describe PresentableSlots, type: :service do
  describe "returns collections of slots the current_user is allowed to see" do
    let(:user) { create(:user, :with_public_slot) }
    let(:current_user) { create(:user, :with_public_slot) }
    let(:common_group) { create(:group, :with_3_slots) }
    let!(:memberships) {
      create(:membership, :active, group: common_group, user: current_user)
      create(:membership, :active, group: common_group, user: user)
    }

    it "for me" do
      expect(
        described_class.call(relationship: ME, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.related_slots,
                             user.group_slots]
    end

    it "for a friend" do
      expect(
        described_class.call(relationship: FRIEND, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.related_slots.unprivate,
                             user.public_group_slots,
                             current_user.shared_group_slots(user)]
    end

    it "for a friend-of-a-friend (foaf)" do
      expect(
        described_class.call(relationship: FOAF, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.std_slots_public,
                             user.std_slots_foaf,
                             user.my_calendar_slots.public,
                             user.public_group_slots,
                             current_user.shared_group_slots(user)]
    end

    it "for a stranger" do
      expect(
        described_class.call(relationship: STRANGER, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.related_slots.public,
                             user.public_group_slots,
                             current_user.shared_group_slots(user)]
    end

    it "for a visitor" do
      expect(
        described_class.call(relationship: VISITOR, user: user,
                             current_user: current_user)
      ).to eq_sql_query_for [user.related_slots.public,
                             user.public_group_slots]
    end
  end
end
