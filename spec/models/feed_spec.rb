require 'rails_helper'

RSpec.describe Feed, :focus, type: :model do
  let(:follower) { create(:user) }
  let(:follower2) { create(:user) }

  context "User feeds", :redis do
    let(:user) { create(:user, :with_email, :with_password, :with_feed) }
    let(:slot) { create(:std_slot_public, owner: user) }

    before(:each) do
      # Create relationships
      user.add_follower(follower)
      user.add_follower(follower2)
      follower.add_follower(follower2)
      # Perform activities
      slot.create_comment(user, 'This is a test comment.')
      slot.create_like(user)
      slot.create_comment(follower, 'This is a test comment.')
      slot.create_like(follower)
      slot.create_comment(follower2, 'This is a test comment.')
      slot.create_like(follower2)
    end

    describe "User follows another user" do
      it "User is subscribed" do

        # user feeds
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(6)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2)

        # news feeds
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2)

        # notification feeds
        notification_feed = Feed.news_feed(user.id).as_json
        expect(notification_feed.count).to be(0)

        notification_feed_follower = Feed.news_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(2)

        notification_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(2)
      end
    end

    describe "User unfollows another user" do
      it "User is subscribed" do
        user.remove_follower(follower)
        user.remove_follower(follower2)

        # user feeds
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(6)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2)

        # news feeds
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2)

        # notification feeds
        notification_feed = Feed.news_feed(user.id).as_json
        expect(notification_feed.count).to be(0)

        notification_feed_follower = Feed.news_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0)

        notification_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(2)
      end
    end
  end

  context "Slot feeds", :redis do
    let(:user) { create(:user, :with_email, :with_password, :with_feed) }
    let(:slot) { create(:std_slot_public, owner: user) }

    before(:each) do
      # Create relationships
      slot.add_follower(follower)
      slot.add_follower(follower2)
      follower.add_follower(follower2)
      # Perform activities
      slot.create_comment(user, 'This is a test comment.')
      slot.create_like(user)
      slot.create_comment(follower, 'This is a test comment.')
      slot.create_like(follower)
      slot.create_comment(follower2, 'This is a test comment.')
      slot.create_like(follower2)
    end

    describe "User follows a slot" do
      it "User is subscribed to a slot" do

        # user feeds
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(6)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2)

        # news feeds
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2)

        # notification feeds
        notification_feed = Feed.news_feed(user.id).as_json
        expect(notification_feed.count).to be(0)

        notification_feed_follower = Feed.news_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(2)

        notification_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(2)
      end
    end

    describe "User unfollows a slot" do
      it "User is subscribed to a slot" do
        slot.remove_follower(follower)
        slot.remove_follower(follower2)

        # user feeds
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(6)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2)

        # news feeds
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2)

        # notification feeds
        notification_feed = Feed.news_feed(user.id).as_json
        expect(notification_feed.count).to be(0)

        notification_feed_follower = Feed.news_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(2)

        notification_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(2)
      end
    end
  end
end
