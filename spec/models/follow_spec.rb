require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:follower) { create(:user, username: 'follower 1') }
  let(:follower2) { create(:user, username: 'follower 2') }

  subject { follower }

  it { is_expected.to respond_to(:followers) }
  it { is_expected.to respond_to(:followings) }
  it { is_expected.to respond_to(:follow) }
  it { is_expected.to respond_to(:unfollow) }
  it { is_expected.to respond_to(:add_follower) }
  it { is_expected.to respond_to(:remove_follower) }
  it { is_expected.to respond_to(:follows?) }
  it { is_expected.to respond_to(:following?) }
  it { is_expected.to respond_to(:followed_by?) }
  it { is_expected.to respond_to(:followers_count) }
  it { is_expected.to respond_to(:followings_count) }
  it { is_expected.to respond_to(:redis_key) }

  it { is_expected.to be_valid }

  context "User follow", :redis do
    let(:user) { create(:user) }

    describe "User follows another user" do
      it "User has followers" do
        # Subscribe
        user.add_follower(follower)
        user.add_follower(follower2)
        # Test
        expect(user.followed_by?(follower)).to be(true)
        expect(user.followers).to include(follower.id.to_s)
        expect(user.followed_by?(follower2)).to be(true)
        expect(user.followers).to include(follower2.id.to_s)
        expect(user.followers_count).to be(2)
        # Test bi-directional relations
        expect(follower.followed_by?(user)).to be(false)
        expect(follower.followed_by?(follower2)).to be(false)
        expect(follower2.followed_by?(user)).to be(false)
        expect(follower2.followed_by?(follower)).to be(false)
      end

      it "User has followers (test helpers)" do
        # Subscribe
        follower.follow(user)
        follower2.follow(user)
        # Test
        expect(follower.follows?(user)).to be(true)
        expect(follower2.follows?(user)).to be(true)
        expect(user.followers).to include(follower.id.to_s)
        expect(user.followers).to include(follower2.id.to_s)
        expect(user.followers_count).to be(2)
      end

      it "User has followings" do
        # Subscribe
        user.add_follower(follower)
        user.add_follower(follower2)
        # Test
        expect(follower.following?(user)).to be(true)
        expect(follower.followings.to_json).to include(user.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(user)).to be(true)
        expect(follower2.followings.to_json).to include(user.id.to_s)
        expect(follower2.followings_count).to be(1)
      end
    end

    describe "User unfollows another user" do
      it "User has no followers" do
        # Subscribe
        user.add_follower(follower)
        expect(user.followed_by?(follower)).to be(true)
        expect(user.followers).to include(follower.id.to_s)
        # Unsubscribe
        user.remove_follower(follower)
        expect(user.followed_by?(follower)).to be(false)
        expect(user.followers).not_to include(user.id.to_s)
      end

      it "User has no followers (test helpers)" do
        # Subscribe
        follower.follow(user)
        expect(follower.follows?(user)).to be(true)
        expect(user.followers).to include(follower.id.to_s)
        # Unsubscribe
        follower.unfollow(user)
        expect(follower.follows?(user)).to be(false)
        expect(user.followers).not_to include(user.id.to_s)
      end

      it "User has no followings" do
        # Subscribe
        user.add_follower(follower)
        expect(follower.following?(user)).to be(true)
        expect(follower.followings.to_json).to include(user.id.to_s)
        expect(follower.followings_count).to be(1)
        # Unsubscribe
        user.remove_follower(follower)
        expect(follower.following?(user)).to be(false)
        expect(follower.followings.to_json).not_to include(user.id.to_s)
        expect(follower.followings_count).to be(0)
      end
    end
  end

  context "Slot follow", :redis do
    let(:slot) { create(:std_slot_public) }

    describe "User follows a slot" do
      it "Slot has followers" do
        # Subscribe
        slot.add_follower(follower)
        slot.add_follower(follower2)
        # Test
        expect(slot.followed_by?(follower)).to be(true)
        expect(slot.followers).to include(follower.id.to_s)
        expect(slot.followed_by?(follower2)).to be(true)
        expect(slot.followers).to include(follower2.id.to_s)
        expect(slot.followers_count).to be(3) # includes creator
      end

      it "Slot has followings" do
        # Subscribe
        slot.add_follower(follower)
        slot.add_follower(follower2)
        # Test
        expect(follower.following?(slot)).to be(true)
        expect(follower.followings.to_json).to include(slot.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(slot)).to be(true)
        expect(follower2.followings.to_json).to include(slot.id.to_s)
        expect(follower2.followings_count).to be(1)
      end
    end

    describe "User unfollows a slot" do
      it "Slot has no followers" do
        # Subscribe
        slot.add_follower(follower)
        expect(slot.followed_by?(follower)).to be(true)
        expect(slot.followers).to include(follower.id.to_s)
        # Unsubscribe
        slot.remove_follower(follower)
        expect(slot.followed_by?(follower)).to be(false)
        expect(slot.followers).not_to include(slot.id.to_s)
      end

      it "Slot has no followings" do
        # Subscribe
        slot.add_follower(follower)
        expect(follower.following?(slot)).to be(true)
        expect(follower.followings.to_json).to include(slot.id.to_s)
        expect(follower.followings_count).to be(1)
        # Unsubscribe
        slot.remove_follower(follower)
        expect(follower.following?(slot)).to be(false)
        expect(follower.followings.to_json).not_to include(slot.id.to_s)
        expect(follower.followings_count).to be(0)
      end
    end

    describe "User is allowed to follow a private slot through a tag (indirect)" do
      let(:slot_private) { create(:std_slot_private) }

      it "Slot has followers" do
        # Subscribe
        slot_private.add_follower(follower)
        slot_private.add_follower(follower2)
        # Test
        expect(slot_private.followed_by?(follower)).to be(true)
        expect(slot_private.followers).to include(follower.id.to_s)
        expect(slot_private.followed_by?(follower2)).to be(true)
        expect(slot_private.followers).to include(follower2.id.to_s)
        expect(slot_private.followers_count).to be(3) # includes creator
      end

      it "Slot has also followings" do
        # Subscribe
        slot_private.add_follower(follower)
        slot_private.add_follower(follower2)
        # Test
        expect(follower.following?(slot_private)).to be(true)
        expect(follower.followings.to_json).to include(slot_private.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(slot_private)).to be(true)
        expect(follower2.followings.to_json).to include(slot_private.id.to_s)
        expect(follower2.followings_count).to be(1)
      end
    end
  end

  context "Group followings", :redis do
    let(:group) { create(:group) }

    describe "User follows a group" do
      it "Group has followers" do
        # Subscribe
        group.add_follower(follower)
        group.add_follower(follower2)
        # Test
        expect(group.followed_by?(follower)).to be(true)
        expect(group.followers).to include(follower.id.to_s)
        expect(group.followed_by?(follower2)).to be(true)
        expect(group.followers).to include(follower2.id.to_s)
        expect(group.followers_count).to be(3) # owner also follows group
      end

      it "Group has followings" do
        # Subscribe
        group.add_follower(follower)
        group.add_follower(follower2)
        # Test
        expect(follower.following?(group)).to be(true)
        expect(follower.followings.to_json).to include(group.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(group)).to be(true)
        expect(follower2.followings.to_json).to include(group.id.to_s)
        expect(follower2.followings_count).to be(1)
      end
    end

    describe "User unfollows a group" do
      it "Group has no followers" do
        # Subscribe
        group.add_follower(follower)
        expect(group.followed_by?(follower)).to be(true)
        expect(group.followers).to include(follower.id.to_s)
        # Unsubscribe
        group.remove_follower(follower)
        expect(group.followed_by?(follower)).to be(false)
        expect(group.followers).not_to include(group.id.to_s)
      end

      it "Group has no followings" do
        # Subscribe
        group.add_follower(follower)
        expect(follower.following?(group)).to be(true)
        expect(follower.followings.to_json).to include(group.id.to_s)
        expect(follower.followings_count).to be(1)
        # Unsubscribe
        group.remove_follower(follower)
        expect(follower.following?(group)).to be(false)
        expect(follower.followings.to_json).not_to include(group.id.to_s)
        expect(follower.followings_count).to be(0)
      end
    end
  end

  context "Test auto-following through social relations", :redis do
    let!(:user) { create(:user) }

    describe "Test reslots (as slot follow)" do
      let(:meta_slot) { create(:meta_slot, creator: user) }
      let(:slot) { create(:std_slot_public, meta_slot: meta_slot) }
      let(:reslot) { create(:std_slot_public, meta_slot: meta_slot) }

      before(:each) do
        # Perform activities
        UsersToSlotTagger.new(slot).tag([follower.id])
        UsersToSlotTagger.new(reslot).tag([follower2.id], follower2) # aka 'reslot'
      end

      it "Slot has follower" do
        # Default Test
        expect(slot.followers).to include(follower.id.to_s)
        expect(slot.followers).not_to include(follower2.id.to_s)
        # slot has 1 follower from reslot and 1 follower is the creator
        expect(slot.followers_count).to be(2)
        expect(follower.follows?(slot)).to be(true)
        expect(follower2.follows?(slot)).to be(false)
        # Test bi-directional relations
        expect(slot.followed_by?(follower)).to be(true)
        expect(slot.followed_by?(follower2)).to be(false)
        expect(slot.follows?(follower)).to be(false)
        expect(slot.follows?(follower2)).to be(false)
        # Test relations outside parents/predecessors scope (e.g. the ReSlot itself)
        expect(follower.follows?(reslot)).to be(false)
        expect(follower2.follows?(reslot)).to be(true)
        # Test bi-directional relations
        expect(reslot.followed_by?(follower)).to be(false)
        expect(reslot.followed_by?(follower2)).to be(true)
        # Test Follower
        expect(reslot.followers).to include(follower2.id.to_s)
        expect(reslot.followers).not_to include(follower.id.to_s)
        # slot has 1 follower from reslot and 1 follower is the creator
        expect(reslot.followers_count).to be(2)
      end

      it "User has followings" do
        # Default Test User
        expect(user.following?(slot)).to be(true)
        expect(user.followings.to_json).to include(slot.id.to_s)
        expect(user.followings_count).to be(2)
        # Default Test Follower 1
        expect(follower.following?(slot)).to be(true)
        expect(follower.followings).to include(slot.id.to_s)
        expect(follower.followings_count).to be(1)
        # Default Test Follower 2
        expect(follower2.following?(slot)).to be(false)
        expect(follower2.followings.to_json).not_to include(slot.id.to_s)
        expect(follower2.following?(reslot)).to be(true)
        expect(follower2.followings.to_json).to include(reslot.id.to_s)
        expect(follower2.followings_count).to be(1)
      end

      it "Unsubscribe from a slot if it was removed" do
        # Pre Testing
        expect(slot.followed_by?(follower)).to be(true)
        expect(reslot.followed_by?(follower2)).to be(true)
        # Remove Slots
        slot.delete
        reslot.delete
        # Test Follower
        expect(slot.followed_by?(follower)).to be(false)
        expect(slot.followers).not_to include(follower.id.to_s)
        expect(slot.followers_count).to be(0)
        # Test bi-directional relations
        expect(follower.follows?(slot)).to be(false)
        expect(follower.following?(slot)).to be(false)
        expect(follower.followings.to_json).not_to include(slot.id.to_s)
        expect(follower.followings_count).to be(0)
        # Test Follower 2
        expect(reslot.followed_by?(follower2)).to be(false)
        expect(reslot.followers).not_to include(follower2.id.to_s)
        expect(reslot.followers_count).to be(0)
        # Test bi-directional relations
        expect(follower2.follows?(reslot)).to be(false)
        expect(follower2.following?(reslot)).to be(false)
        expect(follower2.followings.to_json).not_to include(reslot.id.to_s)
        expect(follower2.followings_count).to be(0)
      end

      it "Unsubscribe from a slot if the visibility has changed" do
        # Pre Testing
        expect(slot.followed_by?(follower)).to be(true)
        expect(reslot.followed_by?(follower2)).to be(true)
        # Remove ReSlots
        slot.update_from_params(visibility: 'private')
        reslot.update_from_params(visibility: 'private')
        # Test Follower
        expect(slot.followed_by?(follower)).to be(true)
        expect(slot.followers).to include(follower.id.to_s)
        expect(slot.followers_count).to be(1)
        # Test bi-directional relations
        expect(follower.follows?(slot)).to be(true)
        expect(follower.following?(slot)).to be(true)
        expect(follower.followings.to_json).to include(slot.id.to_s)
        expect(follower.followings_count).to be(1)
        # Test Follower 2
        expect(reslot.followed_by?(follower2)).to be(false)
        expect(reslot.followers).not_to include(follower2.id.to_s)
        expect(reslot.followers_count).to be(0)
        # Test bi-directional relations
        expect(follower2.follows?(reslot)).to be(false)
        expect(follower2.following?(reslot)).to be(false)
        expect(follower2.followings.to_json).not_to include(reslot.id.to_s)
        expect(follower2.followings_count).to be(0)
      end
    end

    describe "Test friendships (as user follow" do
      before(:each) do
        create(:friendship, :established, user: user, friend: follower)
        create(:friendship, :established, user: user, friend: follower2)
      end

      it "User has follower" do
        # Default Test
        expect(user.followed_by?(follower)).to be(true)
        expect(user.followed_by?(follower2)).to be(true)
        expect(user.followers).to include(follower.id.to_s)
        expect(user.followers).to include(follower2.id.to_s)
        expect(user.followers_count).to be(2)
        # Test bi-directional relations
        expect(follower.followed_by?(user)).to be(true)
        expect(follower.followed_by?(follower2)).to be(false)
        expect(follower2.followed_by?(user)).to be(true)
        expect(follower2.followed_by?(follower)).to be(false)
        # Test helpers
        expect(follower.follows?(user)).to be(true)
        expect(follower2.follows?(user)).to be(true)
        expect(user.followings.to_json).to include(follower.id.to_s)
        expect(user.followings.to_json).to include(follower2.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.followings_count).to be(1)
      end

      it "User has followings" do
        # Default Test
        expect(follower.following?(user)).to be(true)
        expect(follower.followings.to_json).to include(user.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(user)).to be(true)
        expect(follower2.followings.to_json).to include(user.id.to_s)
        expect(follower2.followings_count).to be(1)
      end

      it "Unsubscribe from user if active friendship was removed" do
        # Pre Testing
        expect(user.followed_by?(follower)).to be(true)
        expect(user.followed_by?(follower2)).to be(true)
        # Remove friendships
        user.remove_friends([follower.id, follower2.id])
        # Test Follower
        expect(user.followed_by?(follower)).to be(false)
        expect(user.followers).not_to include(follower.id.to_s)
        expect(user.followers).not_to include(follower.id.to_s)
        expect(user.followers_count).to be(0)
        expect(follower.follows?(user)).to be(false)
        expect(follower.following?(user)).to be(false)
        expect(follower.followings.to_json).not_to include(user.id.to_s)
        expect(follower.followings_count).to be(0)
        # Test Follower 2
        expect(user.followed_by?(follower2)).to be(false)
        expect(user.followers).not_to include(follower2.id.to_s)
        expect(user.followers).not_to include(follower2.id.to_s)
        expect(follower2.follows?(user)).to be(false)
        expect(follower2.following?(user)).to be(false)
        expect(follower2.followings.to_json).not_to include(user.id.to_s)
        expect(follower2.followings_count).to be(0)
      end

      it "Unsubscribe from all if user was removed" do
        # Pre Testing
        expect(user.followed_by?(follower)).to be(true)
        expect(user.followed_by?(follower2)).to be(true)
        # Remove User
        user.inactivate
        # Test Follower
        expect(user.followed_by?(follower)).to be(false)
        expect(user.followers).not_to include(follower.id.to_s)
        expect(user.followers).not_to include(follower.id.to_s)
        expect(user.followers_count).to be(0)
        expect(follower.follows?(user)).to be(false)
        expect(follower.following?(user)).to be(false)
        expect(follower.followings.to_json).not_to include(user.id.to_s)
        expect(follower.followings_count).to be(0)
        # Test Follower 2
        expect(user.followed_by?(follower2)).to be(false)
        expect(user.followers).not_to include(follower2.id.to_s)
        expect(user.followers).not_to include(follower2.id.to_s)
        expect(follower2.follows?(user)).to be(false)
        expect(follower2.following?(user)).to be(false)
        expect(follower2.followings.to_json).not_to include(user.id.to_s)
        expect(follower2.followings_count).to be(0)
      end
    end

    describe "Test memberships (as group follow)" do
      let(:group) { create(:group, owner: user) }

      before(:each) do
        create(:membership, :active, group: group, user: follower)
        create(:membership, :active, group: group, user: follower2)
      end

      it "Group has follower" do
        # Default Test
        expect(group.followed_by?(follower)).to be(true)
        expect(group.followers).to include(follower.id.to_s)
        expect(group.followed_by?(follower2)).to be(true)
        expect(group.followers).to include(follower2.id.to_s)
        expect(group.followers_count).to be(3) # owner also follows group
        # Test bi-directional relations
        expect(follower.followed_by?(group)).to be(false)
        expect(follower.followed_by?(follower2)).to be(false)
        expect(follower2.followed_by?(group)).to be(false)
        expect(follower2.followed_by?(follower)).to be(false)
        # Test helpers
        expect(follower.follows?(group)).to be(true)
        expect(follower2.follows?(group)).to be(true)
        expect(follower.followings.to_json).to include(group.id.to_s)
        expect(follower2.followings.to_json).to include(group.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.followings_count).to be(1)
      end

      it "User has followings" do
        # Default Test
        expect(follower.following?(group)).to be(true)
        expect(follower.followings.to_json).to include(group.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(group)).to be(true)
        expect(follower2.followings.to_json).to include(group.id.to_s)
        expect(follower2.followings_count).to be(1)
      end

      it "Unsubscribe from group if active membership was removed" do
        # Remove membership
        follower.leave_group(group.id)
        follower2.leave_group(group.id)
        # Test Follower
        expect(group.followed_by?(follower)).to be(false)
        expect(group.followers).not_to include(follower.id.to_s)
        expect(group.followers).not_to include(follower.id.to_s)
        expect(follower.follows?(group)).to be(false)
        expect(follower.following?(group)).to be(false)
        expect(follower.followings.to_json).not_to include(group.id.to_s)
        expect(follower.followings_count).to be(0)
        # Test Follower 2
        expect(group.followed_by?(follower2)).to be(false)
        expect(group.followers).not_to include(follower2.id.to_s)
        expect(group.followers).not_to include(follower2.id.to_s)
        expect(follower2.follows?(group)).to be(false)
        expect(follower2.following?(group)).to be(false)
        expect(follower2.followings.to_json).not_to include(group.id.to_s)
        expect(follower2.followings_count).to be(0)
      end

      it "Unsubscribe from group if group was removed" do
        # Delete Group
        group.delete
        # Test Follower
        expect(group.followed_by?(follower)).to be(false)
        expect(group.followers).not_to include(follower.id.to_s)
        expect(group.followers).not_to include(follower.id.to_s)
        expect(follower.follows?(group)).to be(false)
        expect(follower.following?(group)).to be(false)
        expect(follower.followings.to_json).not_to include(group.id.to_s)
        expect(follower.followings_count).to be(0)
        # Test Follower 2
        expect(group.followed_by?(follower2)).to be(false)
        expect(group.followers).not_to include(follower2.id.to_s)
        expect(group.followers).not_to include(follower2.id.to_s)
        expect(follower2.follows?(group)).to be(false)
        expect(follower2.following?(group)).to be(false)
        expect(follower2.followings.to_json).not_to include(group.id.to_s)
        expect(follower2.followings_count).to be(0)
      end
    end
  end
end
