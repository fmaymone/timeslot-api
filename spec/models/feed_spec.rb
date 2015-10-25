require 'rails_helper'

RSpec.describe Feed, :async, type: :model do
  let(:follower) { create(:user) }
  let(:follower2) { create(:user) }

  context "User feeds", :redis do
    # NOTE: 5 activities will be created by default on trait :with_feed
    let(:user) { create(:user, :with_feed) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User follows another user" do
      before(:each) do
        # Create relationships
        follower.follow(user)
        follower2.follow(user)

        # Perform activities (User)
        slot.create_comment(user, 'This is a test comment.')
        slot.create_like(user)
        # Perform activities (Follower)
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_like(follower)
        # Perform activities (Follower 2)
        slot.create_comment(follower2, 'This is a test comment.')
        slot.create_like(follower2)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        # 5 activities already exist on trait :feed
        expect(user_feed.count).to be(5 + 2) # +2 own activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2) # +2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2) # +2 public activities
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end

    context "User unfollows another user" do
      before(:each) do
        # NOTE: Old activities were not removed after unfollow!
        # Unfollow (removes relationship)
        follower.unfollow(user)
        follower2.unfollow(user)

        # Perform activities
        slot.create_comment(user, 'This is a test comment.')
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_comment(follower2, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(5 + 1) # +1 own activity

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(1) # +1 own activity

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(1) # +1 own activity
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # has no followings

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # has no followings
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Slot feeds", :redis do
    # NOTE: 5 activities will be created by default on trait :with_feed
    let(:user) { create(:user, :with_feed) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User follows a slot" do
      before(:each) do
        # Create relationships
        follower.follow(slot)
        follower2.follow(slot)

        # Perform activities (User)
        slot.create_comment(user, 'This is a test comment.')
        slot.create_like(user)
        # Perform activities (Follower)
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_like(follower)
        # Perform activities (Follower 2)
        slot.create_comment(follower2, 'This is a test comment.')
        slot.create_like(follower2)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        # 5 activities already exist on trait :feed
        expect(user_feed.count).to be(5 + 2) # +2 own activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2) # +2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2) # +2 public activities
        expect(news_feed_follower).not_to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end

    context "User unfollows a slot" do
      before(:each) do
        # NOTE: Old activities were not removed after unfollow!
        # Unfollow (removes relationship)
        follower.unfollow(slot)
        follower2.unfollow(slot)

        # Perform activities
        slot.create_comment(user, 'This is a test comment.')
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_comment(follower2, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        # 5 activities already exist on trait :feed
        expect(user_feed.count).to be(5 + 1) # +1 own activity

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(1) # +1 own activity

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(1) # +1 own activity
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # has no followings

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # has no followings
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Group feeds", :redis do
    # NOTE: 5 activities will be created by default on trait :with_feed
    let(:user) { create(:user, :with_feed) }
    let(:group_meta_slot) { create(:meta_slot, creator: user) }
    let(:group) { create(:group, owner: user) }
    let!(:group_slot) { create(:group_slot, meta_slot: group_meta_slot, group: group) }

    context "User follows a group" do
      before(:each) do
        # Create relationships
        follower.follow(group)
        follower2.follow(group)

        # Perform activities (User)
        group_slot.create_comment(user, 'This is a test comment.')
        group_slot.create_like(user)
        # Perform activities (Follower)
        group_slot.create_comment(follower, 'This is a test comment.')
        group_slot.create_like(follower)
        # Perform activities (Follower 2)
        group_slot.create_comment(follower2, 'This is a test comment.')
        group_slot.create_like(follower2)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        # 5 activities already exist on trait :feed
        expect(user_feed.count).to be(5 + 2 + 1) # +8 own activities (+1 create groupslot???)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2) # +2 public activities (+2 aggregated)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2) # +2 public activities (+2 aggregated)
        expect(news_feed_follower).not_to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end

    context "User unfollows a group" do
      before(:each) do
        # NOTE: Old activities were not removed after unfollow!
        # Unfollow (removes relationship)
        follower.unfollow(group)
        follower2.unfollow(group)

        # Perform activities
        group_slot.create_comment(user, 'This is a test comment.')
        group_slot.create_comment(follower, 'This is a test comment.')
        group_slot.create_comment(follower2, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        # 5 activities already exist on trait :feed
        expect(user_feed.count).to be(5 + 2) # +2 new activity

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(1) # +1 new activity

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(1) # +1 new activity
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # has no followings

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # has no followings
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Mixed feeds", :redis do
    # NOTE: 5 activities will be created by default on trait :with_feed
    let(:user) { create(:user, :with_feed) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }
    let(:group_meta_slot) { create(:meta_slot, creator: user) }
    let(:group) { create(:group, owner: user) }
    let!(:group_slot) { create(:group_slot, meta_slot: group_meta_slot, group: group) }

    context "User follows mixed type of targets" do
      before(:each) do
        # Create relationships (User-related)
        follower.follow(user)
        follower2.follow(user)
        # Create relationships (Slot-related)
        follower.follow(slot)
        follower2.follow(slot)
        # Create relationships (Group-related)
        follower.follow(group)
        follower2.follow(group)

        # Perform activities (User)
        slot.create_comment(user, 'This is a test comment.')
        slot.create_like(user)
        # Perform activities (Follower)
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_like(follower)
        # Perform activities (Follower 2)
        slot.create_comment(follower2, 'This is a test comment.')
        slot.create_like(follower2)
        # Perform activities (Group)
        group_slot.create_comment(follower, 'This is a test comment.')
        group_slot.create_like(follower)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        # 5 activities already exist on trait :feed
        expect(user_feed.count).to be(5 + 2 + 2) # +4 own activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(4) # +4 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2) # +2 public activities (+2 aggregated)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(4) # +4 public activities (+2 aggregated)
        expect(news_feed_follower).not_to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(6) # +6 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end

    context "User unfollows mixed type of targets" do
      before(:each) do
        # NOTE: Old activities were not removed after unfollow!
        # Unfollow (removes User-related relationship)
        follower.unfollow(user)
        follower2.unfollow(user)
        # Unfollow (removes Slot-related relationship)
        follower.unfollow(slot)
        follower2.unfollow(slot)
        # Unfollow (removes Group-related relationship)
        follower.unfollow(group)
        follower2.unfollow(group)
        # Unfollow (removes Group-related relationship)
        follower.unfollow(group)
        follower2.unfollow(group)

        # Perform activities
        slot.create_comment(user, 'This is a test comment.')
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_comment(follower2, 'This is a test comment.')
        group_slot.create_comment(follower, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        # 5 activities already exist on trait :feed
        expect(user_feed.count).to be(5 + 3) # +3 new activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 new activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(1) # +1 new activity
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # has no followings

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # has no followings
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(3) # +3 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end
end
