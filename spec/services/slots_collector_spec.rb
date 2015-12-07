require 'rails_helper'

RSpec.describe SlotsCollector, type: :service do
  describe :user_slots do
    it "collects all slots the current_user is allowed to see" do
      skip "Pending"
    end
  end

  describe :slots_from_friends do
    let(:user) { create(:user) }
    let!(:friends) do
      friends = create_list(:user, 4)
      friends.each do |friend|
        create(:friendship, :established, user: user, friend: friend)
      end
      create(:std_slot_private, owner: friends.first)
      create(:std_slot_friends, owner: friends.second)
      create(:std_slot_foaf, owner: friends.third)
      create(:std_slot_public, owner: friends.last)
      friends
    end

    it "returns slots from friends" do
      collector = SlotsCollector.new
      slots = collector.slots_from_friends(current_user: user)

      expect(slots).not_to include friends.first.std_slots.take
      expect(slots).to include friends.second.std_slots.take
      expect(slots).to include friends.third.std_slots.take
      expect(slots).to include friends.last.std_slots.take
    end
  end
end
