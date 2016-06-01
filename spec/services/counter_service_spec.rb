require 'rails_helper'

RSpec.describe CounterService, type: :service do
  let(:user) { create(:user) }

  describe "active_slots" do
    let(:friend) do
      friend = create(:user)
      create(:friendship, :established, user: user, friend: friend)
      friend
    end
    let(:stranger) { create(:user) }

    let!(:tagged_slots) do
      slot = create(:std_slot_private, title: 'tagged slot')
      create(:passengership, :add_media_permitted, user: user, slot: slot)
      slot
    end
    let!(:created_slots) do
      create(:std_slot_private, owner: user, creator: user, title: 'private slot')
      create(:std_slot_friends, owner: user, creator: user, title: 'friend slot')
      create(:std_slot_public, owner: user, creator: user, title: 'public slot')
    end
    let!(:calendar_slots) do
      slot = create(:std_slot_private, title: 'calendar slot')
      create(:passengership, :show_in_schedule, user: user, slot: slot)
      slot
    end

    let!(:duplicate_slot) do
      slot = create(:std_slot_public, title: 'duplicate slot')
      create(:passengership, :show_in_schedule, user: user, slot: slot)
      create(:containership, group: public_group, slot: slot)
      slot
    end
    let!(:shared_group) do
      group = create(:group, :with_3_slots, public: false)
      create(:membership, :active, group: group, user: user)
      create(:membership, :active, group: group, user: friend)
      create(:membership, :active, group: group, user: stranger)
      group
    end
    let!(:public_group) do
      group = create(:group, :with_3_slots, public: true)
      create(:membership, :active, group: group, user: user)
      group
    end
    let!(:private_group) do
      group = create(:group, :with_3_slots, public: false)
      create(:membership, :active, group: group, user: user)
      group
    end

    context 'for me' do
      it "counts all my created, tagged at, my_calendar and group slots" do
        result = described_class.new.active_slots(user: user,
                                                  current_user: user)
        count = user.std_slots.count +
                user.related_slots.count +
                user.group_slots.count - 1 # subtract 1 duplicate slot
        expect(result).to eq count
      end
    end

    context 'for a friend' do
      it "returns the correct slot count" do
        result = described_class.new.active_slots(user: user,
                                                  current_user: friend)
        count = user.std_slots_public.count +
                user.std_slots_friends.count +
                user.my_calendar_slots.unprivate.count +
                public_group.slots.count +
                shared_group.slots.count - 1 # subtract 1 duplicate slot
        expect(result).to eq count
      end
    end

    context 'for a stranger' do
      it "returns the correct slot count" do
        result = described_class.new.active_slots(user: user,
                                                  current_user: stranger)
        count = user.std_slots_public.count +
                user.my_calendar_slots.public.count +
                public_group.slots.count +
                shared_group.slots.count - 1 # subtract 1 duplicate slot
        expect(result).to eq count
      end
    end

    context 'for a visiter' do
      it "returns the correct slot count" do
        result = described_class.new.active_slots(user: user, current_user: nil)
        count = user.std_slots_public.count +
                user.my_calendar_slots.public.count +
                public_group.slots.count - 1 # subtract 1 duplicate slot
        expect(result).to eq count
      end
    end
  end

  describe "active_visible_calendars" do
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
