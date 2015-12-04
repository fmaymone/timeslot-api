require 'rails_helper'

RSpec.describe Feed, :activity, :async, type: :model do
  let(:follower) { create(:user) }
  let(:follower2) { create(:user) }

  context "User feeds", :redis do
    let(:user) { create(:user) }
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
        expect(user_feed.count).to be(2) # +2 own activities
        expect(user_feed.first['data']['target']['id']).to be(slot.id)
        expect(user_feed.first['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed.first['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed.first['data']['actor']['id']).to be(user.id)
        expect(user_feed.second['data']['target']['id']).to be(slot.id)
        expect(user_feed.second['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 own activities
        expect(user_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower.first['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower.first['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower.first['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower.second['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower.second['data']['actor']['id']).to be(follower.id)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
        expect(user_feed_follower2.first['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2.first['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2.first['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower2.first['data']['actor']['id']).to be(follower2.id)
        expect(user_feed_follower2.second['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2.second['data']['actor']['id']).to be(follower2.id)

        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activities
        expect(news_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower.first['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower.first['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(news_feed_follower.first['data']['actor']['id']).to be(user.id)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +1 public activities
        expect(news_feed_follower2.first['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower2.first['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower2.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower2.first['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(news_feed_follower2.first['data']['actor']['id']).to be(user.id)

        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content
        expect(notification_feed.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed.first['data']['target']['likes']).to be(slot.likes.count)
        expect(notification_feed.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(notification_feed.first['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(notification_feed.first['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed.second['data']['target']['id']).to be(slot.id)
        expect(notification_feed.second['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed.third['data']['target']['id']).to be(slot.id)
        expect(notification_feed.third['data']['actor']['id']).to be(follower.id)
        expect(notification_feed.fourth['data']['target']['id']).to be(slot.id)
        expect(notification_feed.fourth['data']['actor']['id']).to be(follower.id)

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
        expect(user_feed.count).to be(1) # +1 own activity

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
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Slot feeds", :redis do
    let(:user) { create(:user) }
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
        expect(user_feed.count).to be(2) # +2 own activities

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
        expect(news_feed_follower.count).to be(1) # +1 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +1 public activities
        expect(news_feed_follower).not_to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content

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
        expect(user_feed.count).to be(1) # +1 own activity

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
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Group feeds", :redis do
    # TODO: check why no activity is created in the feed trait for
    # creation of std_slot_public
    let(:user) { create(:user) }
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
        expect(user_feed.count).to be(2) # +2 own activities

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
        expect(news_feed_follower.count).to be(1) # +1 public activities (+2 aggregated)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +1 public activities (+2 aggregated)
        expect(news_feed_follower).not_to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content

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
        expect(user_feed.count).to be(1) # +2 new activity

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
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Mixed feeds & Aggregation", :redis do
    let!(:user) { create(:user) }
    let!(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }
    let!(:group_meta_slot) { create(:meta_slot, creator: user) }
    let!(:group) { create(:group, owner: user) }
    let!(:group_slot) { create(:group_slot, meta_slot: group_meta_slot, group: group) }
    let!(:reslot_1) { create(:re_slot, predecessor: slot, parent: slot, slotter: follower) }
    let!(:reslot_2) { create(:re_slot, predecessor: reslot_1, parent: slot, slotter: follower2) }

    context "User follows mixed type of targets" do
      before(:each) do
        # Create relationships (User-related)
        follower.follow(user)
        follower2.follow(user)
        # Create relationships (Slot-related)
        follower.follow(slot)
        follower2.follow(slot)
        # Create relationships (ReSlot-related, Crossed)
        follower2.follow(reslot_1)
        user.follow(reslot_2)
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

        # Perform activities (ReSlot 1)
        reslot_1.create_like(user)
        reslot_1.create_comment(user, 'This is a test comment.')
        reslot_1.create_like(follower)
        reslot_1.create_comment(follower, 'This is a test comment.')
        reslot_1.create_like(follower2)
        reslot_1.create_comment(follower2, 'This is a test comment.')

        # Perform activities (ReSlot 2)
        reslot_2.create_like(user)
        reslot_2.create_comment(user, 'This is a test comment.')
        reslot_2.create_like(follower)
        reslot_2.create_comment(follower, 'This is a test comment.')
        reslot_2.create_like(follower2)
        reslot_2.create_comment(follower2, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(4) # +4 own activities
        expect(user_feed[0]['data']['target']['id']).to be(slot.id)
        expect(user_feed[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed[0]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed[0]['data']['actor']['id']).to be(user.id)
        expect(user_feed[1]['data']['target']['id']).to be(slot.id)
        expect(user_feed[1]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed[1]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed[1]['data']['actor']['id']).to be(user.id)
        expect(user_feed[2]['data']['target']['id']).to be(slot.id)
        expect(user_feed[2]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed[2]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed[2]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed[2]['data']['actor']['id']).to be(user.id)
        expect(user_feed[3]['data']['target']['id']).to be(slot.id)
        expect(user_feed[3]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed[3]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed[3]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed[3]['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(7) # +7 own activities
        expect(user_feed_follower[0]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower[0]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower[0]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[1]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower[1]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower[1]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower[1]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[2]['data']['target']['id']).to be(group_slot.id)
        expect(user_feed_follower[2]['data']['target']['likes']).to be(group_slot.likes.count)
        expect(user_feed_follower[2]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        #expect(user_feed_follower[2]['data']['target']['reslotsCounter']).to be(group_slot.reslots.count)
        expect(user_feed_follower[2]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[3]['data']['target']['id']).to be(group_slot.id)
        expect(user_feed_follower[3]['data']['target']['likes']).to be(group_slot.likes.count)
        expect(user_feed_follower[3]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        #expect(user_feed_follower[3]['data']['target']['reslotsCounter']).to be(group_slot.reslots.count)
        expect(user_feed_follower[3]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[4]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower[4]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower[4]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower[4]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower[4]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[5]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower[5]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower[5]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower[5]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower[5]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[6]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower[6]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower[6]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower[6]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower[6]['data']['actor']['id']).to be(follower.id)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(5) # +5 own activities
        expect(user_feed_follower2[0]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2[0]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower2[0]['data']['actor']['id']).to be(follower2.id)
        expect(user_feed_follower2[1]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2[1]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2[1]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower2[1]['data']['actor']['id']).to be(follower2.id)
        expect(user_feed_follower2[2]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2[2]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2[2]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2[2]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower2[2]['data']['actor']['id']).to be(follower2.id)
        expect(user_feed_follower2[3]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2[3]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2[3]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2[3]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower2[3]['data']['actor']['id']).to be(follower2.id)
        expect(user_feed_follower2[4]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2[4]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2[4]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2[4]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(user_feed_follower2[4]['data']['actor']['id']).to be(follower2.id)

        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activities (+1 aggregated)
        expect(news_feed_follower[0]['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower[0]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(news_feed_follower[0]['data']['actor']['id']).to be(follower2.id)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2) # +2 public activities (+1 aggregated)
        expect(news_feed_follower2[0]['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower2[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower2[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower2[0]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(news_feed_follower2[0]['data']['actor']['id']).to be(follower.id)
        expect(news_feed_follower2[1]['data']['target']['id']).to be(group_slot.id)
        expect(news_feed_follower2[1]['data']['target']['likes']).to be(group_slot.likes.count)
        expect(news_feed_follower2[1]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        #expect(news_feed_follower2[1]['data']['target']['reslotsCounter']).to be(group_slot.reslots.count)
        expect(news_feed_follower2[1]['data']['actor']['id']).to be(follower.id)

        expect(news_feed_follower).not_to eq(news_feed_follower2)

        # Test whats happened if last actor is current user (do action on own slot)
        reslot_1.create_like(follower)
        reslot_1.create_comment(follower, 'This is a test comment.')
        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activities (+1 aggregated)
        expect(news_feed_follower[0]['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower[0]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(news_feed_follower[0]['data']['actor']['id']).to be(follower2.id)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(12) # +12 foreign activities to own content
        expect(notification_feed[0]['data']['target']['id']).to be(slot.id)
        expect(notification_feed[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(notification_feed[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(notification_feed[0]['data']['target']['reslotsCounter']).to be(slot.reslots.count)
        expect(notification_feed[0]['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed[1]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[2]['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed[3]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[4]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[5]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[6]['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed[7]['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed[8]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[9]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[10]['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed[11]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[11]['data']['target']['id']).to be(slot.id)
        expect(notification_feed[11]['data']['target']['likes']).to be(slot.likes.count)
        expect(notification_feed[11]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(notification_feed[11]['data']['target']['reslotsCounter']).to be(slot.reslots.count)

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
        # Unfollow (removes Reslot-related relationship)
        follower.unfollow(slot)
        follower2.unfollow(reslot_1)
        user.unfollow(reslot_2)
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
        expect(user_feed.count).to be(1) # +1 new activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(3) # +3 new activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 new activity
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activity (reslot)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # has no followings
        expect(news_feed_follower).not_to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(5) # +5 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Delete Activities (Object Delete)", :redis do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User delete the account" do
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

        # Delete User (Activity Actor)
        follower.inactivate
        follower2.inactivate
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(2) # +2 own activities

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
        expect(news_feed_follower.count).to be(1) # +2-1 public activities (from user)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +2-1 public activities (from user)
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end

    context "User delete a slot" do
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

        # Delete Target (Activity Target)
        slot.delete
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(0) # +2-2 own activities

        # TODO: test activity notifications for delete actions
        # expect(user_feed[0]['activity']).to be('delete')
        # expect(user_feed[0]['data']['target']['id']).to be(slot.id)
        # expect(user_feed_follower[0]['activity']).to be('delete')
        # expect(user_feed_follower[0]['data']['target']['id']).to be(slot.id)
        # expect(user_feed_follower2[0]['activity']).to be('delete')
        # expect(user_feed_follower2[0]['data']['target']['id']).to be(slot.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(0) # +2-2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(0) # +2-2 own activities
        expect(user_feed_follower).to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +2-2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +2-2 public activities
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +4-4 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Delete Activities (Visibility Change)", :redis do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User change visibility of a slot" do
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

        # Change Visibility
        slot.update_from_params(visibility: 'private')
        slot.reload
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(0) # +2-2 own activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(0) # +2-2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(0) # +2-2 own activities
        expect(user_feed_follower).to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +2-2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +2-2 public activities
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +4-4 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Delete Activities (Remove Activity)", :redis do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User delete an activity" do
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

        # Delete/Remove Activities
        slot.destroy_like(user)
        slot.destroy_like(follower)
        slot.destroy_like(follower2)
        slot.comments.each(&:delete)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(0) # +2-2 own activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(0) # +2-2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(0) # +2-2 own activities
        expect(user_feed_follower).to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +2-2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +2-2 public activities
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +3-3 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end

  context "Re-Activate Activities (e.g. ReLike)", :redis do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User delete an activity" do
      before(:each) do
        # Create relationships
        follower.follow(user)
        follower2.follow(user)

        # Perform activities
        slot.create_like(user)
        slot.create_like(follower)
        slot.create_like(follower2)

        # Remove Activities
        slot.destroy_like(user)
        slot.destroy_like(follower)
        slot.destroy_like(follower2)

        # Re-Perform activities
        slot.create_like(user)
        slot.create_like(follower)
        slot.create_like(follower2)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +1 own activities

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(1) # +1 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(1) # +1 own activities
        expect(user_feed_follower).not_to eq(user_feed_follower2)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +2-1 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +2-1 public activities
        expect(news_feed_follower).to eq(news_feed_follower2)
      end

      it "Notification Feed (activities to own contents)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
        expect(notification_feed_follower).to eq(notification_feed_follower2)
      end
    end
  end
end
