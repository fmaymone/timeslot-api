require 'rails_helper'

RSpec.describe CounterService, type: :service do
  let(:user) { create(:user) }
  let(:user_with_calendars) do
    requestee = create(:user)
    create_list(:group, 3, public: false, owner: requestee)
    requestee
  end
  let!(:public_calendar_count) do
    create_list(:group, 2, public: true, owner: user_with_calendars)
    public_group = create(:group, public: true)
    create(:membership, :active, group: public_group, user: user_with_calendars)
    3
  end

  describe "active_visible_calendars" do
    context 'for me' do
      it "adds the number of non-public calendars" do
        count = described_class.new.active_visible_calendars(
          asker: user_with_calendars, requestee: user_with_calendars)
        expect(count).to eq user_with_calendars.active_memberships.count
      end
    end

    context 'for user without shared non-public calendars' do
      it "only returns the number of public calendars" do
        count = described_class.new.active_visible_calendars(
          asker: user, requestee: user_with_calendars)
        expect(count).to eq public_calendar_count
      end
    end

    context 'for user with shared non-public calendars' do
      let!(:shared_nonpublic_calendar) do
        shared_group = create(:group, public: false)
        create(:membership, :active, user: user,
               group: shared_group)
        create(:membership, :active, user: user_with_calendars,
               group: shared_group)
        shared_group
      end

      it "adds the number of shared non-public calendars" do
        count = described_class.new.active_visible_calendars(
          asker: user, requestee: user_with_calendars)
        expect(count).to eq public_calendar_count + 1
      end
    end
  end

  describe "number_of_users_who_can_view_the_slot" do
    context 'public slot' do
      let(:slot) { create(:std_slot_public) }

      it "returns 'all'" do
        count = described_class.new.number_of_users_who_can_view_the_slot(slot)
        expect(count).to eq 'all'
      end
    end

    context 'friend-visible slot' do
      let(:owner) { create(:user, :with_3_friends) }
      let(:duplicate_user) { create(:user) }
      let(:duplicate_member) { create(:user) }
      let(:slot) { create(:std_slot_friends, owner: owner) }

      let!(:group_1) do
        group_1 = create(:group, :with_3_members)
        create(:membership, :active, user: slot.owner, group: group_1)
        create(:membership, :active, user: duplicate_member, group: group_1)
        create(:membership, :active, user: duplicate_user, group: group_1)
        create(:containership, slot: slot, group: group_1)
        group_1
      end

      let!(:group_2) do
        group_2 = create(:group)
        create_list(:membership, 5, :active, group: group_2)
        create(:membership, :active, user: duplicate_member, group: group_2)
        create(:containership, slot: slot, group: group_2)
      end

      let!(:tagged_users) do
        create_list(:passengership, 2, slot: slot)
        create(:passengership, user: duplicate_user, slot: slot)
      end

      it "number of unique group members + number of tagged users + friends" do
        count = described_class.new.number_of_users_who_can_view_the_slot(slot)
        expect(count).to eq 18
      end
    end

    context 'private slot' do
      let(:duplicate_user) { create(:user) }
      let(:duplicate_member) { create(:user) }
      let(:slot) { create(:std_slot_private) }

      let!(:group_1) do
        group_1 = create(:group, :with_3_members)
        create(:membership, :active, user: slot.owner, group: group_1)
        create(:membership, :active, user: duplicate_member, group: group_1)
        create(:membership, :active, user: duplicate_user, group: group_1)
        create(:containership, slot: slot, group: group_1)
        group_1
      end

      let!(:group_2) do
        group_2 = create(:group)
        create_list(:membership, 5, :active, group: group_2)
        create(:membership, :active, user: duplicate_member, group: group_2)
        create(:containership, slot: slot, group: group_2)
      end

      let!(:tagged_users) do
        create_list(:passengership, 2, slot: slot)
        create(:passengership, user: duplicate_user, slot: slot)
      end

      it "returns number of unique group members + number of tagged users" do
        count = described_class.new.number_of_users_who_can_view_the_slot(slot)
        expect(count).to eq 15
      end
    end
  end
end
