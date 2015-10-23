require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:follower) { create(:user) }
  let(:follower2) { create(:user) }

  context "User followings", :redis do
    let(:user) { create(:user) }

    describe "User follows another user" do
      it "User is subscribed" do
        user.add_follower(follower)
        user.add_follower(follower2)
        expect(user.followed_by?(follower)).to be (true)
        expect(user.followers).to include(follower.id.to_s)
        expect(user.followed_by?(follower2)).to be(true)
        expect(user.followers).to include(follower2.id.to_s)
        expect(user.follower_count).to be(2)
      end

      it "User has followers" do
        user.add_follower(follower)
        user.add_follower(follower2)
        expect(follower.following?(user)).to be(true)
        expect(follower.followings.to_json).to include(user.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(user)).to be(true)
        expect(follower2.followings.to_json).to include(user.id.to_s)
        expect(follower2.followings_count).to be(1)
      end
    end

    describe "User unfollows another user" do
      it "User is subscribed" do
        user.add_follower(follower)
        expect(user.followed_by?(follower)).to be(true)
        expect(user.followers).to include(follower.id.to_s)

        user.remove_follower(follower)
        expect(user.followed_by?(follower)).to be(false)
        expect(user.followers).not_to include(user.id.to_s)
      end

      it "User has followers" do
        user.add_follower(follower)
        expect(follower.following?(user)).to be(true)
        expect(follower.followings.to_json).to include(user.id.to_s)
        expect(follower.followings_count).to be(1)

        user.remove_follower(follower)
        expect(follower.following?(user)).to be(false)
        expect(follower.followings.to_json).not_to include(user.id.to_s)
        expect(follower.followings_count).to be(0)
      end
    end
  end

  context "Slot followings", :redis do
    let(:slot) { create(:std_slot_public) }

    describe "User follows slot" do
      it "User is subscribed to slot" do
        slot.add_follower(follower)
        slot.add_follower(follower2)
        expect(slot.followed_by?(follower)).to be(true)
        expect(slot.followers).to include(follower.id.to_s)
        expect(slot.followed_by?(follower2)).to be(true)
        expect(slot.followers).to include(follower2.id.to_s)
        expect(slot.follower_count).to be(2)
      end

      it "Slot has followers" do
        slot.add_follower(follower)
        slot.add_follower(follower2)
        expect(follower.following?(slot)).to be(true)
        expect(follower.followings.to_json).to include(slot.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(slot)).to be(true)
        expect(follower2.followings.to_json).to include(slot.id.to_s)
        expect(follower2.followings_count).to be(1)
      end
    end

    describe "User unfollows a slot" do
      it "User is subscribed to slot" do
        slot.add_follower(follower)
        expect(slot.followed_by?(follower)).to be(true)
        expect(slot.followers).to include(follower.id.to_s)

        slot.remove_follower(follower)
        expect(slot.followed_by?(follower)).to be(false)
        expect(slot.followers).not_to include(slot.id.to_s)
      end

      it "Slot has followers" do
        slot.add_follower(follower)
        expect(follower.following?(slot)).to be(true)
        expect(follower.followings.to_json).to include(slot.id.to_s)
        expect(follower.followings_count).to be(1)

        slot.remove_follower(follower)
        expect(follower.following?(slot)).to be(false)
        expect(follower.followings.to_json).not_to include(slot.id.to_s)
        expect(follower.followings_count).to be(0)
      end
    end
  end

  context "Group followings", :redis do
    let(:group) { create(:group) }

    describe "User follows group" do
      it "User is subscribed to group" do
        group.add_follower(follower)
        group.add_follower(follower2)
        expect(group.followed_by?(follower)).to be(true)
        expect(group.followers).to include(follower.id.to_s)
        expect(group.followed_by?(follower2)).to be(true)
        expect(group.followers).to include(follower2.id.to_s)
        expect(group.follower_count).to be(2)
      end

      it "Group has followers" do
        group.add_follower(follower)
        group.add_follower(follower2)
        expect(follower.following?(group)).to be(true)
        expect(follower.followings.to_json).to include(group.id.to_s)
        expect(follower.followings_count).to be(1)
        expect(follower2.following?(group)).to be(true)
        expect(follower2.followings.to_json).to include(group.id.to_s)
        expect(follower2.followings_count).to be(1)
      end
    end

    describe "User unfollows a group" do
      it "User is subscribed to group" do
        group.add_follower(follower)
        expect(group.followed_by?(follower)).to be(true)
        expect(group.followers).to include(follower.id.to_s)

        group.remove_follower(follower)
        expect(group.followed_by?(follower)).to be(false)
        expect(group.followers).not_to include(group.id.to_s)
      end

      it "Group has followers" do
        group.add_follower(follower)
        expect(follower.following?(group)).to be(true)
        expect(follower.followings.to_json).to include(group.id.to_s)
        expect(follower.followings_count).to be(1)

        group.remove_follower(follower)
        expect(follower.following?(group)).to be(false)
        expect(follower.followings.to_json).not_to include(group.id.to_s)
        expect(follower.followings_count).to be(0)
      end
    end
  end
end
