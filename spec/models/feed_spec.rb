require 'rails_helper'

RSpec.describe Feed, :focus, type: :model do
  let(:follower) { create(:user) }
  let(:follower2) { create(:user) }

  context "User feeds", :redis do
    let(:user) { create(:user, :with_email, :with_password, :with_feed) }
    let(:slot) { create(:std_slot_public, owner: user) }
    #let(:slot2) { create(:std_slot_public, owner: follower) }
    #let(:slot3) { create(:std_slot_public, owner: follower2) }

    before(:each) do
      user.add_follower(follower)
      user.add_follower(follower2)
      slot.create_comment(user, 'This is a test comment.')
      slot.create_like(user)
      slot.create_comment(follower, 'This is a test comment.')
      slot.create_like(follower)
      slot.create_comment(follower2, 'This is a test comment.')
      slot.create_like(follower2)
    end

    describe "User follows another user" do
      it "User is subscribed" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(6)
        #expect(user_feed).to include({object: slot.id.to_s})

        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(4)
        # expect(news_feed.first['actor']).to eq(follower.id)
        # expect(news_feed.last['actor']).to eq(follower2.id)
        # expect(news_feed.first['object']).to eq(slot.id)
        # expect(news_feed.first['target']).to eq(slot.creator.id)

        notification_feed = Feed.news_feed(user.id).as_json
        expect(notification_feed.count).to be(4)
        # expect(notification_feed.first['actor'].to_i).to eq(follower.id)
        # expect(notification_feed.last['actor'].to_i).to eq(follower2.id)
        # expect(notification_feed.first['object']).to eq(slot.id)
        # expect(notification_feed.first['target'].to_i).to eq(slot.creator.id)
      end

      it "User has followers" do
        user_feed = Feed.user_feed(follower.id).as_json
        expect(user_feed.count).to be(2)
        news_feed = Feed.news_feed(follower.id).as_json
        expect(news_feed.count).to be(4)
        notification_feed = Feed.news_feed(follower.id).as_json
        expect(notification_feed.count).to be(4)
      end
    end

    describe "User unfollows another user" do
      it "User is subscribed" do
        expect(user.is_followed_by(follower)).to be(true)
        expect(user.followers).to include(follower.id.to_s)

        user.remove_follower(follower)
        expect(user.is_followed_by(follower)).to be(false)
        expect(user.followers).not_to include(user.id.to_s)
      end

      it "User has followers" do
        expect(follower.is_following(user)).to be(true)
        expect(follower.following.to_json).to include(user.id.to_s)
        expect(follower.following_count).to be(1)

        user.remove_follower(follower)
        expect(follower.is_following(user)).to be(false)
        expect(follower.following.to_json).not_to include(user.id.to_s)
        expect(follower.following_count).to be(0)
      end
    end
  end

  context "Slot feeds", :redis do
    let(:slot) { create(:std_slot_public) }

    describe "User follows slot" do
      it "User is subscribed to slot" do
        slot.add_follower(follower)
        slot.add_follower(follower2)
        expect(slot.is_followed_by(follower)).to be(true)
        expect(slot.followers).to include(follower.id.to_s)
        expect(slot.is_followed_by(follower2)).to be(true)
        expect(slot.followers).to include(follower2.id.to_s)
        expect(slot.follower_count).to be(2)
      end

      it "Slot has followers" do
        slot.add_follower(follower)
        slot.add_follower(follower2)
        expect(follower.is_following(slot)).to be(true)
        expect(follower.following.to_json).to include(slot.id.to_s)
        expect(follower.following_count).to be(1)
        expect(follower2.is_following(slot)).to be(true)
        expect(follower2.following.to_json).to include(slot.id.to_s)
        expect(follower2.following_count).to be(1)
      end
    end

    describe "User unfollows a slot" do
      it "User is subscribed to slot" do
        slot.add_follower(follower)
        expect(slot.is_followed_by(follower)).to be(true)
        expect(slot.followers).to include(follower.id.to_s)

        slot.remove_follower(follower)
        expect(slot.is_followed_by(follower)).to be(false)
        expect(slot.followers).not_to include(slot.id.to_s)
      end

      it "Slot has followers" do
        slot.add_follower(follower)
        expect(follower.is_following(slot)).to be(true)
        expect(follower.following.to_json).to include(slot.id.to_s)
        expect(follower.following_count).to be(1)

        slot.remove_follower(follower)
        expect(follower.is_following(slot)).to be(false)
        expect(follower.following.to_json).not_to include(slot.id.to_s)
        expect(follower.following_count).to be(0)
      end
    end
  end

  context "Group feeds", :redis do
    let(:group) { create(:group) }

    describe "User follows group" do
      it "User is subscribed to group" do
        group.add_follower(follower)
        group.add_follower(follower2)
        expect(group.is_followed_by(follower)).to be(true)
        expect(group.followers).to include(follower.id.to_s)
        expect(group.is_followed_by(follower2)).to be(true)
        expect(group.followers).to include(follower2.id.to_s)
        expect(group.follower_count).to be(2)
      end

      it "Group has followers" do
        group.add_follower(follower)
        group.add_follower(follower2)
        expect(follower.is_following(group)).to be(true)
        expect(follower.following.to_json).to include(group.id.to_s)
        expect(follower.following_count).to be(1)
        expect(follower2.is_following(group)).to be(true)
        expect(follower2.following.to_json).to include(group.id.to_s)
        expect(follower2.following_count).to be(1)
      end
    end

    describe "User unfollows a group" do
      it "User is subscribed to group" do
        group.add_follower(follower)
        expect(group.is_followed_by(follower)).to be(true)
        expect(group.followers).to include(follower.id.to_s)

        group.remove_follower(follower)
        expect(group.is_followed_by(follower)).to be(false)
        expect(group.followers).not_to include(group.id.to_s)
      end

      it "Group has followers" do
        group.add_follower(follower)
        expect(follower.is_following(group)).to be(true)
        expect(follower.following.to_json).to include(group.id.to_s)
        expect(follower.following_count).to be(1)

        group.remove_follower(follower)
        expect(follower.is_following(group)).to be(false)
        expect(follower.following.to_json).not_to include(group.id.to_s)
        expect(follower.following_count).to be(0)
      end
    end
  end
end
