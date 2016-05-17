require 'rails_helper'

RSpec.describe SlotsCollector, type: :service do
  describe :user_slots do
    # this should also test for slots in common groups but is skipped for now

    let(:current_user) { create(:user) }

    let!(:public_stdslot) {
      create(:std_slot_public, owner: other, creator: other) }
    let!(:foaf_stdslot) {
      create(:std_slot_foaf, owner: other, creator: other) }
    let!(:friends_stdslot) {
      create(:std_slot_friends, owner: other, creator: other) }
    let!(:private_stdslot) {
      create(:std_slot_private, owner: other, creator: other) }

    # let!(:public_reslot) { create(:re_slot_public, slotter: other) }
    # let!(:foaf_reslot) { create(:re_slot_foaf, slotter: other) }
    # let!(:friends_reslot) { create(:re_slot_friends, slotter: other) }
    # let!(:private_reslot) { create(:re_slot_private, slotter: other) }

    context 'friend' do
      let!(:other) do
        friend = create(:user)
        create(:friendship, :established, user: current_user, friend: friend)
        friend
      end

      it "collects all non-private slots" do
        result = SlotsCollector.new.user_slots(current_user: current_user,
                                               user: other)
        slots = result.data
        expect(slots).to include public_stdslot
        expect(slots).to include foaf_stdslot
        expect(slots).to include friends_stdslot
        expect(slots).not_to include private_stdslot

        # expect(slots).to include public_reslot
        # expect(slots).to include foaf_reslot
        # expect(slots).to include friends_reslot
        # expect(slots).not_to include private_reslot
      end
    end

    context 'foaf' do
      let!(:other) do
        friend = create(:user)
        foaf = create(:user)
        create(:friendship, :established, user: current_user, friend: friend)
        create(:friendship, :established, user: foaf, friend: friend)
        foaf
      end

      it "collects all public and foaf-visible slots" do
        result = SlotsCollector.new.user_slots(current_user: current_user,
                                              user: other)
        slots = result.data
        expect(slots).to include public_stdslot
        expect(slots).to include foaf_stdslot
        expect(slots).not_to include friends_stdslot
        expect(slots).not_to include private_stdslot

        # expect(slots).to include public_reslot
        # expect(slots).to include foaf_reslot
        # expect(slots).not_to include friends_reslot
        # expect(slots).not_to include private_reslot
      end
    end

    context 'stranger' do
      let(:other) { create(:user) }

      it "collects all public slots" do
        result = SlotsCollector.new.user_slots(current_user: current_user,
                                              user: other)
        slots = result.data
        expect(slots).to include public_stdslot
        expect(slots).not_to include foaf_stdslot
        expect(slots).not_to include friends_stdslot
        expect(slots).not_to include private_stdslot

        # expect(slots).to include public_reslot
        # expect(slots).not_to include foaf_reslot
        # expect(slots).not_to include friends_reslot
        # expect(slots).not_to include private_reslot
      end
    end

    context 'visitor' do
      let(:other) { create(:user) }

      it "collects all public slots and reslots" do
        result = SlotsCollector.new.user_slots(user: other)

        slots = result.data
        expect(slots).to include public_stdslot
        expect(slots).not_to include foaf_stdslot
        expect(slots).not_to include friends_stdslot
        expect(slots).not_to include private_stdslot

        # expect(slots).to include public_reslot
        # expect(slots).not_to include foaf_reslot
        # expect(slots).not_to include friends_reslot
        # expect(slots).not_to include private_reslot
      end
    end
  end

  describe :slots_from_friends do
    let(:user) { create(:user) }
    let!(:friends) do
      friends = create_list(:user, 4)
      friends.each do |friend|
        create(:friendship, :established, user: user, friend: friend)
      end
      friends
    end
    let!(:public_stdslot) { create(:std_slot_public, owner: friends.first) }
    let!(:foaf_stdslot) { create(:std_slot_friends, owner: friends.second) }
    let!(:friends_stdslot) { create(:std_slot_foaf, owner: friends.third) }
    let!(:private_stdslot) { create(:std_slot_private, owner: friends.last) }

    # let!(:public_reslot) { create(:re_slot_public, slotter: friends.last) }
    # let!(:foaf_reslot) { create(:re_slot_foaf, slotter: friends.last) }
    # let!(:friends_reslot) { create(:re_slot_friends, slotter: friends.last) }
    # let!(:private_reslot) { create(:re_slot_private, slotter: friends.last) }

    it "returns all non-private slots & reslots from friends" do
      result = SlotsCollector.new.slots_from_friends(user: user)

      slots = result.data
      expect(slots).to include public_stdslot
      expect(slots).to include foaf_stdslot
      expect(slots).to include friends_stdslot
      expect(slots).not_to include private_stdslot

      # expect(slots).to include public_reslot
      # expect(slots).to include foaf_reslot
      # expect(slots).to include friends_reslot
      # expect(slots).not_to include private_reslot
    end
  end

  describe 'filter' do
    let(:user) { create(:user) }
    let(:moment) { '2016-04-21T11:08:18.000Z' }

    context "past" do
      let!(:januar_slot) do
        create(:std_slot_public, owner: user, title: 'im januar',
               start_date: '2016-01-21 15:06:18Z',
               end_date: '2016-04-21 16:06:18Z'
              )
      end
      let!(:februar_slot) do
        create(:std_slot_public, owner: user, title: 'im januar',
               start_date: '2016-02-21 15:06:18Z',
               end_date: '2016-04-21 16:06:18Z'
              )
      end
      let!(:maerz_slot) do
        create(:std_slot_public, owner: user, title: 'im januar',
               start_date: '2016-03-21 15:06:18Z',
               end_date: '2016-04-21 16:06:18Z'
              )
      end

      it "returns slots descending from 'moment'" do
        collector = SlotsCollector.new(mode: 'past', moment: moment, limit: 2)
        result = collector.my_slots(user: user)
        slots = result.data

        slots.each do |slot|
          expect(slot.start_date).to be < moment
        end
        expect(slots).to include maerz_slot
        expect(slots).to include februar_slot
        expect(slots).not_to include januar_slot
      end
    end

    context "between" do
      let(:earliest) { '2016-04-21T11:06:18.000Z' }
      let(:latest) { '2016-04-21T19:06:18.000Z' }

      let!(:between_slot) do
        create(:std_slot_public, owner: user, title: 'in between',
               start_date: '2016-04-21 15:06:18Z',
               end_date: '2016-04-21 16:06:18Z'
              )
      end
      let!(:overlap_earliest_slot) do
        create(:std_slot_public, owner: user, title: 'overlap earliest',
               start_date: '2016-04-21 03:06:18Z',
               end_date: '2016-04-21 16:06:18Z'
              )
      end
      let!(:overlap_latest_slot) do
        create(:std_slot_public, owner: user, title: 'overlap latest',
               start_date: '2016-04-21 15:06:18Z',
               end_date: '2016-04-21 23:06:18Z'
              )
      end
      let!(:overlap_both_slot) do
        create(:std_slot_public, owner: user, title: 'overlap both',
               start_date: '2016-04-21 05:06:18Z',
               end_date: '2016-04-21 22:06:18Z'
              )
      end
      let!(:before_slot) do
        create(:std_slot_public, owner: user, title: 'before',
               start_date: '2016-04-21 01:06:18Z',
               end_date: '2016-04-21 03:06:18Z'
              )
      end
      let!(:later_slot) do
        create(:std_slot_public, owner: user, title: 'later',
               start_date: '2016-04-21 20:06:18Z',
               end_date: '2016-04-21 21:06:18Z'
              )
      end

      it "returns slots after 'moment' from the filtered slotset" do
        collector = SlotsCollector.new(mode: 'upcoming', moment: moment,
                                       limit: 6, filter: 'between',
                                       earliest: earliest, latest: latest)
        result = collector.my_slots(user: user)
        slots = result.data

        slots.each do |slot|
          expect(slot.start_date).to be >= moment
          expect(slot.end_date).to be > earliest
          expect(slot.start_date).to be < latest
        end

        expect(slots).not_to include before_slot
        expect(slots).not_to include later_slot
      end
    end
  end
end
