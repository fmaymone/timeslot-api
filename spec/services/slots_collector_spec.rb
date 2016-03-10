require 'rails_helper'

RSpec.describe SlotsCollector, type: :service do
  describe :user_slots do
    # this should also test for slots in common groups but is skipped for now

    let(:current_user) { create(:user) }

    let!(:public_stdslot) { create(:std_slot_public, owner: other, creator: other) }
    let!(:foaf_stdslot) { create(:std_slot_foaf, owner: other, creator: other) }
    let!(:friends_stdslot) { create(:std_slot_friends, owner: other, creator: other) }
    let!(:private_stdslot) { create(:std_slot_private, owner: other, creator: other) }

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
        slots = SlotsCollector.new.user_slots(current_user: current_user,
                                              user: other)
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
        slots = SlotsCollector.new.user_slots(current_user: current_user,
                                              user: other)
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
        slots = SlotsCollector.new.user_slots(current_user: current_user,
                                              user: other)
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
        slots = SlotsCollector.new.user_slots(user: other)

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
      slots = SlotsCollector.new.slots_from_friends(user: user)

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
end
