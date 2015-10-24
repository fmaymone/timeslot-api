require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:follower) { create(:user) }
  let(:follower2) { create(:user) }

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
  it { is_expected.to respond_to(:feed_type) }

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
        expect(user.followers).to include(follower.id.to_s)
        expect(follower2.follows?(user)).to be(true)
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
        expect(slot.followers_count).to be(2)
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
        expect(group.followers_count).to be(2)
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
end
