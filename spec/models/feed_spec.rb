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
        expect(user_feed.first['data']['actor']['id']).to be(user.id)
        expect(user_feed.second['data']['target']['id']).to be(slot.id)
        expect(user_feed.second['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 own activities
        expect(user_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower.first['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower.first['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower.second['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower.second['data']['actor']['id']).to be(follower.id)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
        expect(user_feed_follower2.first['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2.first['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2.first['data']['actor']['id']).to be(follower2.id)
        expect(user_feed_follower2.second['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2.second['data']['actor']['id']).to be(follower2.id)
      end

      it "News Feed (aggregated public activities)" do
        # NOTE: this test also make use of the social context,
        # foreign activities are actually not shown in the news feed
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)
        expect(news_feed.first['data']['target']['id']).to be(slot.id)
        expect(news_feed.first['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed.first['data']['actor']['id']).to be(follower2.id)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activity
        expect(news_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower.first['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower.first['data']['actor']['id']).to be(user.id)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +1 public activity
        expect(news_feed_follower2.first['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower2.first['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower2.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower2.first['data']['actor']['id']).to be(user.id)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content
        expect(notification_feed.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed.first['data']['target']['likes']).to be(slot.likes.count)
        expect(notification_feed.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(notification_feed.first['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed.second['data']['target']['id']).to be(slot.id)
        expect(notification_feed.second['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed.third['data']['target']['id']).to be(slot.id)
        expect(notification_feed.third['data']['actor']['id']).to be(follower.id)
        expect(notification_feed.fourth['data']['target']['id']).to be(slot.id)
        expect(notification_feed.fourth['data']['actor']['id']).to be(follower.id)

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activities (notify commenters)
        expect(notification_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower.first['data']['target']['likes']).to be(slot.likes.count)
        expect(notification_feed_follower.first['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(notification_feed_follower.first['data']['actor']['id']).to be(follower2.id)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
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
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +0 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +0 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content (notify commenters)

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activities (notify commenters)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
      end
    end
  end

  context "Slot feeds", :redis do
    let!(:user) { create(:user) }
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
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +1 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content (+2 Likes, +2 Comments)

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activities

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # no foreign activities
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
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +0 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +0 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content (notify commenters)

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activity (notify commenters)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
      end
    end
  end

  context "Friend feeds", :redis do
    let!(:user) { create(:user) }
    let!(:friend) { create(:user) }
    let!(:foreign) { create(:user) }
    let!(:friendship) { create(:friendship, :established, user: user, friend: friend) }
    let!(:publicslot) { create(:std_slot_public, creator: user) }
    let!(:friendslot) { create(:std_slot_friends, creator: user) }
    let!(:foreignslot) { create(:std_slot_public, creator: foreign) }

    context "Users perform activities on a slot" do
      before(:each) do
        # Create relationships
        user.follow(friend)
        friend.follow(user)
        # Perform activities (User)
        publicslot.create_comment(user, 'This is a test comment.')
        publicslot.create_like(user)
        # Perform activities (Friend)
        friendslot.create_comment(friend, 'This is a test comment.')
        friendslot.create_like(friend)
        # Perform activities (Foreign User)
        publicslot.create_comment(foreign, 'This is a test comment.')
        publicslot.create_like(foreign)
        # Perform activities (Foreign Target)
        foreignslot.create_comment(user, 'This is a test comment.')
        foreignslot.create_like(user)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(4) # +4 own activities

        user_feed_friend = Feed.user_feed(friend.id).as_json
        expect(user_feed_friend.count).to be(2) # +2 own activities

        user_feed_foreign = Feed.user_feed(foreign.id).as_json
        expect(user_feed_foreign.count).to be(2) # +2 own activities
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(2) # +2 public activity (own activity)
        expect(news_feed.first['target']).to eq(publicslot.id.to_s)
        expect(news_feed.first['action']).to eq('like')
        expect(news_feed.first['data']['target']['id']).to be(publicslot.id)
        expect(news_feed.first['data']['actor']['id']).to be(foreign.id)
        expect(news_feed.second['target']).to eq(friendslot.id.to_s)
        expect(news_feed.second['action']).to eq('like')
        expect(news_feed.second['data']['target']['id']).to be(friendslot.id)
        expect(news_feed.second['data']['actor']['id']).to be(friend.id)

        news_feed_friend = Feed.news_feed(friend.id).as_json
        expect(news_feed_friend.count).to be(2) # +2 activities (+2 aggregated)
        expect(news_feed_friend[0]['target']).to eq(foreignslot.id.to_s)
        expect(news_feed_friend[0]['action']).to eq('like')
        expect(news_feed_friend[0]['data']['target']['id']).to be(foreignslot.id)
        expect(news_feed_friend[0]['data']['actor']['id']).to be(user.id)
        expect(news_feed_friend[1]['target']).to eq(publicslot.id.to_s)
        expect(news_feed_friend[1]['action']).to eq('like')
        expect(news_feed_friend[1]['data']['target']['id']).to be(publicslot.id)
        expect(news_feed_friend[1]['data']['actor']['id']).to be(user.id)

        news_feed_foreign = Feed.news_feed(foreign.id).as_json
        expect(news_feed_foreign.count).to be(1) # +1 activity (own activity)
        expect(news_feed_foreign.first['target']).to eq(foreignslot.id.to_s)
        expect(news_feed_foreign.first['action']).to eq('like')
        expect(news_feed_foreign.first['data']['target']['id']).to be(foreignslot.id)
        expect(news_feed_foreign.first['data']['actor']['id']).to be(user.id)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content

        notification_feed_friend = Feed.notification_feed(friend.id).as_json
        expect(notification_feed_friend.count).to be(0) # has no own content

        notification_feed_foreign = Feed.notification_feed(foreign.id).as_json
        expect(notification_feed_foreign.count).to be(2) # +2 friend activities to own content
        expect(notification_feed_foreign.first['target']).to eq(foreignslot.id.to_s)
        expect(notification_feed_foreign.first['action']).to eq('like')
        expect(notification_feed_foreign.first['data']['target']['id']).to be(foreignslot.id)
        expect(notification_feed_foreign.first['data']['actor']['id']).to be(user.id)
        expect(notification_feed_foreign.second['target']).to eq(foreignslot.id.to_s)
        expect(notification_feed_foreign.second['action']).to eq('comment')
        expect(notification_feed_foreign.second['data']['target']['id']).to be(foreignslot.id)
        expect(notification_feed_foreign.second['data']['actor']['id']).to be(user.id)
      end
    end

    context "Creator removes or unshare a slot" do
      before(:each) do
        # Perform activities
        publicslot.update_from_params(visibility: 'private')
        friendslot.delete
        foreignslot.delete
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(2) # +4-4 own activities + 1 delete activity + 1 unshare activity
        expect(user_feed.first['target']).to eq(friendslot.id.to_s)
        expect(user_feed.first['action']).to eq('delete')
        expect(user_feed.first['data']['target']['id']).to be(friendslot.id)
        expect(user_feed.first['data']['target']['deletedAt']).not_to be(nil)
        expect(user_feed.first['data']['actor']['id']).to be(user.id)
        expect(user_feed.second['target']).to eq(publicslot.id.to_s)
        expect(user_feed.second['action']).to eq('private')
        expect(user_feed.second['data']['target']['id']).to be(publicslot.id)
        expect(user_feed.second['data']['target']['deletedAt']).to be(nil)
        expect(user_feed.second['data']['actor']['id']).to be(user.id)

        user_feed_friend = Feed.user_feed(friend.id).as_json
        expect(user_feed_friend.count).to be(0) # +2-2 own activities

        user_feed_foreign = Feed.user_feed(foreign.id).as_json
        expect(user_feed_foreign.count).to be(1) # +2-2 own activities + 1 delete activity
        expect(user_feed_foreign.first['target']).to eq(foreignslot.id.to_s)
        expect(user_feed_foreign.first['action']).to eq('delete')
        expect(user_feed_foreign.first['data']['target']['id']).to be(foreignslot.id)
        expect(user_feed_foreign.first['data']['target']['deletedAt']).not_to be(nil)
        expect(user_feed_foreign.first['data']['actor']['id']).to be(foreign.id)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_friend = Feed.news_feed(friend.id).as_json
        expect(news_feed_friend.count).to be(0) # +2-2 public activities

        news_feed_foreign = Feed.news_feed(foreign.id).as_json
        expect(news_feed_foreign.count).to be(0) # has no followings
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +4-4 foreign activities to own content

        notification_feed_friend = Feed.notification_feed(friend.id).as_json
        expect(notification_feed_friend.count).to be(0) # has no own content

        notification_feed_foreign = Feed.notification_feed(foreign.id).as_json
        expect(notification_feed_foreign.count).to be(0) # +2-2 foreign activities to own content
      end
    end
  end

  context "Passengership & Reslot feeds", :redis do
    let(:user) { create(:user) }
    let(:follower) { create(:user) }
    let(:reslotter) { create(:user) }
    let(:slot) { create(:std_slot_public, creator: user) }

    context "User adds a user to a slot or reslot as slot (passengership)" do
      before(:each) do
        # Perform activities
        UsersToSlotTagger.new(slot).tag([follower.id], user)
        UsersToSlotTagger.new(slot).tag([reslotter.id], reslotter)

        # Perform activities (User)
        slot.create_comment(user, 'This is a test comment.')
        slot.create_like(user)
        # Perform activities (Follower)
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_like(follower)
        # Perform activities (Reslotter)
        slot.create_comment(reslotter, 'This is a test comment.')
        slot.create_like(reslotter)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(3) # +3 own activities (+1 tagged user)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 own activities

        user_feed_reslotter = Feed.user_feed(reslotter.id).as_json
        expect(user_feed_reslotter.count).to be(3) # +3 own activities (+1 user tagging)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activities (+2 aggregated)

        news_feed_reslotter = Feed.news_feed(reslotter.id).as_json
        expect(news_feed_reslotter.count).to be(1) # +1 public activities (+2 aggregated)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(5) # +5 foreign activities to own content (+2 likes, +2 comments, +1 user tagging)

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(2) # +2 foreign activity (+1 comment, +1 user tagging)

        notification_feed_reslotter = Feed.news_feed(reslotter.id).as_json
        expect(notification_feed_reslotter.count).to be(1) # +1 foreign activity (+1 user tagging)
      end
    end

    context "User removes the passengership/reslot" do
      before(:each) do
        # NOTE: Old activities were not removed after unfollow!
        # Remove relationship
        follower.passengerships.each(&:delete)
        reslotter.passengerships.each(&:delete)

        # Perform activities
        slot.create_comment(user, 'This is a test comment.')
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_comment(reslotter, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +2 new activity

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(1) # +1 new activity

        user_feed_reslotter = Feed.user_feed(reslotter.id).as_json
        expect(user_feed_reslotter.count).to be(1) # +1 new activity
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +0 public activities

        news_feed_reslotter = Feed.news_feed(reslotter.id).as_json
        expect(news_feed_reslotter.count).to be(0) # +0 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activities (forward to commenters)

        notification_feed_reslotter = Feed.news_feed(reslotter.id).as_json
        expect(notification_feed_reslotter.count).to be(0) # has no own content
      end
    end
  end

  context "Containership feeds", :redis do
    let(:user) { create(:user) }
    let(:creator) { create(:user) }
    let(:slot) { create(:std_slot_public, creator: creator) }
    let(:group) { create(:group, owner: user) }

    context "User adds a slot to a slotgroup (containership)" do
      before(:each) do
        # Create relationships
        SlotsetManager.new(current_user: creator).add!(slot, group)

        # Perform activities (User)
        slot.create_comment(user, 'This is a test comment.')
        slot.create_like(user)
        # Perform activities (Follower)
        slot.create_comment(creator, 'This is a test comment.')
        slot.create_like(creator)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(2) # +2 own activities

        user_feed_follower = Feed.user_feed(creator.id).as_json
        expect(user_feed_follower.count).to be(3) # +3 own activities (+1 group tagging)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # +0 public activities

        news_feed_follower = Feed.news_feed(creator.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activity (own activity)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(1) # +1 foreign activity (notify commenters)

        notification_feed_follower = Feed.notification_feed(creator.id).as_json
        expect(notification_feed_follower.count).to be(2) # +2 foreign activities to own content
      end
    end

    context "User unfollows a group" do
      before(:each) do
        # NOTE: Old activities were not removed after unfollow!
        # Remove relationship
        slot.containerships.each(&:delete)

        # Perform activities
        slot.create_comment(user, 'This is a test comment.')
        slot.create_comment(creator, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +2 new activity

        user_feed_follower = Feed.user_feed(creator.id).as_json
        expect(user_feed_follower.count).to be(1) # +1 new activity
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # +0 public activities

        news_feed_follower = Feed.news_feed(creator.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activity (own activity)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(1) # +1 foreign activity (notify commenters)

        notification_feed_follower = Feed.notification_feed(creator.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activities to own content
      end
    end
  end

  context "Membership feeds", :redis do
    let(:user) { create(:user) }
    let(:slot) { create(:std_slot_public, creator: user) }
    let(:group) { create(:group, owner: user) }
    let!(:containership) { create(:containership, slot: slot, group: group) }

    context "User follows a group (membership)" do
      before(:each) do
        # Create relationships
        group.invite_users([follower.id, follower2.id], user)

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
        expect(user_feed.count).to be(4) # +4 own activities (+2 users tagged into group)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(2) # +2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(2) # +2 public activities (+3 aggregated, notify commenters)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2) # +2 public activities (+3 aggregated, notify commenters)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(2) # +2 foreign activity (+1 added to a group)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(1) # +1 added to a group
      end
    end

    context "User unfollows a group" do
      before(:each) do
        # NOTE: Old activities were not removed after unfollow!
        # Remove relationship
        group.kick_member([follower.id, follower2.id])

        # Perform activities
        slot.create_comment(user, 'This is a test comment.')
        slot.create_comment(follower, 'This is a test comment.')
        slot.create_comment(follower2, 'This is a test comment.')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +2 new activity

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(1) # +1 new activity

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(1) # +1 new activity
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activity (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +0 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +0 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content (notify commenters)

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 public activity (notify commenters)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
      end
    end
  end

  context "Mixed feeds & Aggregation", :redis do
    let!(:user) { create(:user) }
    let!(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }
    let!(:group_meta_slot) { create(:meta_slot, creator: user) }
    let!(:group) { create(:group, owner: user) }
    let!(:group_slot) { create(:std_slot_public, creator: user) }
    let!(:containership) { create(:containership, slot: group_slot, group: group) }

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
        expect(user_feed.count).to be(2) # +2 own activities
        expect(user_feed[0]['data']['target']['id']).to be(slot.id)
        expect(user_feed[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed[0]['data']['actor']['id']).to be(user.id)
        expect(user_feed[1]['data']['target']['id']).to be(slot.id)
        expect(user_feed[1]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed[1]['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(4) # +4 own activities
        expect(user_feed_follower[0]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        expect(user_feed_follower[0]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[1]['data']['target']['id']).to be(group_slot.id)
        expect(user_feed_follower[1]['data']['target']['likes']).to be(group_slot.likes.count)
        expect(user_feed_follower[1]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        expect(user_feed_follower[1]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[2]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower[2]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower[2]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower[2]['data']['actor']['id']).to be(follower.id)
        expect(user_feed_follower[3]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower[3]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower[3]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower[3]['data']['actor']['id']).to be(follower.id)

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(2) # +2 own activities
        expect(user_feed_follower2[0]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2[0]['data']['actor']['id']).to be(follower2.id)
        expect(user_feed_follower2[1]['data']['target']['id']).to be(slot.id)
        expect(user_feed_follower2[1]['data']['target']['likes']).to be(slot.likes.count)
        expect(user_feed_follower2[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(user_feed_follower2[1]['data']['actor']['id']).to be(follower2.id)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(2) # +2 public activities (own activity)
        expect(news_feed[0]['data']['target']['id']).to be(group_slot.id)
        expect(news_feed[0]['data']['target']['likes']).to be(group_slot.likes.count)
        expect(news_feed[0]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        expect(news_feed[0]['data']['actor']['id']).to be(follower.id)
        expect(news_feed[1]['data']['target']['id']).to be(slot.id)
        expect(news_feed[1]['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed[1]['data']['actor']['id']).to be(follower2.id)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activity (+1 aggregated)
        expect(news_feed_follower[0]['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower[0]['data']['actor']['id']).to be(follower2.id)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(2) # +2 public activities (+1 aggregated)
        expect(news_feed_follower2[0]['data']['target']['id']).to be(group_slot.id)
        expect(news_feed_follower2[0]['data']['target']['likes']).to be(group_slot.likes.count)
        expect(news_feed_follower2[0]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        expect(news_feed_follower2[0]['data']['actor']['id']).to be(follower.id)
        expect(news_feed_follower2[1]['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower2[1]['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower2[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower2[1]['data']['actor']['id']).to be(follower.id)

        # Test whats happened if last actor is current user (do action on own slot)
        slot.create_like(follower)
        slot.create_comment(follower, 'This is a test comment.')
        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activity
        expect(news_feed_follower[0]['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(news_feed_follower[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(news_feed_follower[0]['data']['actor']['id']).to be(follower2.id)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(6) # +6 foreign activities to own content
        expect(notification_feed[0]['data']['target']['id']).to be(group_slot.id)
        expect(notification_feed[0]['data']['target']['likes']).to be(group_slot.likes.count)
        expect(notification_feed[0]['data']['target']['commentsCounter']).to be(group_slot.comments.count)
        expect(notification_feed[0]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[1]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[2]['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed[3]['data']['actor']['id']).to be(follower2.id)
        expect(notification_feed[4]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[5]['data']['actor']['id']).to be(follower.id)
        expect(notification_feed[5]['data']['target']['id']).to be(slot.id)
        expect(notification_feed[5]['data']['target']['likes']).to be(slot.likes.count)
        expect(notification_feed[5]['data']['target']['commentsCounter']).to be(slot.comments.count)

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activities (notify commenters)
        expect(notification_feed_follower[0]['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower[0]['data']['target']['likes']).to be(slot.likes.count)
        expect(notification_feed_follower[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        expect(notification_feed_follower[0]['data']['actor']['id']).to be(follower2.id)
        # expect(notification_feed_follower[1]['data']['target']['id']).to be(slot.id)
        # expect(notification_feed_follower[1]['data']['target']['likes']).to be(slot.likes.count)
        # expect(notification_feed_follower[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        # expect(notification_feed_follower[1]['data']['actor']['id']).to be(user.id)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # +0 foreign activities
        # expect(notification_feed_follower2[0]['data']['target']['id']).to be(slot.id)
        # expect(notification_feed_follower2[0]['data']['target']['likes']).to be(slot.likes.count)
        # expect(notification_feed_follower2[0]['data']['target']['commentsCounter']).to be(slot.comments.count)
        # expect(notification_feed_follower2[0]['data']['actor']['id']).to be(follower.id)
        # expect(notification_feed_follower2[1]['data']['target']['id']).to be(slot.id)
        # expect(notification_feed_follower2[1]['data']['target']['likes']).to be(slot.likes.count)
        # expect(notification_feed_follower2[1]['data']['target']['commentsCounter']).to be(slot.comments.count)
        # expect(notification_feed_follower2[1]['data']['actor']['id']).to be(user.id)
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
        expect(user_feed_follower.count).to be(2) # +2 new activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(1) # +1 new activity
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(2) # +2 public activities (own activity, notify commenters)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +0 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +0 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(3) # +3 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activity (notify commenters)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
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
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activities (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +2-1 public activities (from user)

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +2-1 public activities (from user)
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(4) # +4 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 foreign activities (notify commenters)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # +0 foreign activities
      end
    end

    context "User delete a slot" do
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

        # Delete Target (Activity Target)
        slot.delete
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +2-2+1 own activities + 1 deletion activity
        expect(user_feed.first['target']).to eq(slot.id.to_s)
        expect(user_feed.first['action']).to eq('delete')
        expect(user_feed.first['data']['target']['id']).to be(slot.id)
        expect(user_feed.first['data']['target']['deletedAt']).not_to be(nil)
        expect(user_feed.first['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(0) # +2-2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(0) # +2-2 own activities
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +2-2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +2-2 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +4-4 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # + 1 deletion activity
        expect(notification_feed_follower.first['target']).to eq(slot.id.to_s)
        expect(notification_feed_follower.first['action']).to eq('delete')
        expect(notification_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower.first['data']['target']['deletedAt']).not_to be(nil)
        expect(notification_feed_follower.first['data']['actor']['id']).to be(user.id)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(1) # + 1 deletion activity
        expect(notification_feed_follower2.first['target']).to eq(slot.id.to_s)
        expect(notification_feed_follower2.first['action']).to eq('delete')
        expect(notification_feed_follower2.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower2.first['data']['target']['deletedAt']).not_to be(nil)
        expect(notification_feed_follower2.first['data']['actor']['id']).to be(user.id)
      end
    end
  end

  context "Delete Activities (Visibility Change Slot)", :redis do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User change visibility of a slot" do
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

        # Change Visibility
        slot.update_from_params(visibility: 'private')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +2-2 own activities + 1 unshare activity
        expect(user_feed.first['target']).to eq(slot.id.to_s)
        expect(user_feed.first['action']).to eq('private')
        expect(user_feed.first['data']['target']['id']).to be(slot.id)
        expect(user_feed.first['data']['target']['deletedAt']).to be(nil)
        expect(user_feed.first['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(0) # +2-2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(0) # +2-2 own activities
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +2-2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +2-2 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +4-4 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # + 1 unshare activity
        expect(notification_feed_follower.first['target']).to eq(slot.id.to_s)
        expect(notification_feed_follower.first['action']).to eq('private')
        expect(notification_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower.first['data']['target']['deletedAt']).to be(nil)
        expect(notification_feed_follower.first['data']['actor']['id']).to be(user.id)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(1) # + 1 unshare activity
        expect(notification_feed_follower2.first['target']).to eq(slot.id.to_s)
        expect(notification_feed_follower2.first['action']).to eq('private')
        expect(notification_feed_follower2.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower2.first['data']['target']['deletedAt']).to be(nil)
        expect(notification_feed_follower2.first['data']['actor']['id']).to be(user.id)
      end
    end
  end

  context "Delete Activities (Visibility Change Parent Slot)", :redis do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }
    # let!(:reslot_1) { create(:re_slot, predecessor: slot, parent: slot, slotter: follower) }
    # NOTE: test reslots from 2nd generation
    # let!(:reslot_2) { create(:re_slot, predecessor: reslot_1, parent: slot, slotter: follower2) }

    context "User change visibility of a slot" do
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

        # Change Visibility
        slot.update_from_params(visibility: 'private')
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +2-2 own activities +1 unshare activity
        expect(user_feed.first['target']).to eq(slot.id.to_s)
        expect(user_feed.first['action']).to eq('private')
        expect(user_feed.first['data']['target']['id']).to be(slot.id)
        expect(user_feed.first['data']['target']['deletedAt']).to be(nil)
        expect(user_feed.first['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(0) # +2-2 own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(0) # +2-2 own activities
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +2-2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +2-2 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +6-6 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # + 1 unshare activity
        expect(notification_feed_follower.first['target']).to eq(slot.id.to_s)
        expect(notification_feed_follower.first['action']).to eq('private')
        expect(notification_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower.first['data']['target']['deletedAt']).to be(nil)
        expect(notification_feed_follower.first['data']['actor']['id']).to be(user.id)

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(1) # + 1 unshare activity
        expect(notification_feed_follower2.first['target']).to eq(slot.id.to_s)
        expect(notification_feed_follower2.first['action']).to eq('private')
        expect(notification_feed_follower2.first['data']['target']['id']).to be(slot.id)
        expect(notification_feed_follower2.first['data']['target']['deletedAt']).to be(nil)
        expect(notification_feed_follower2.first['data']['actor']['id']).to be(user.id)
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
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # +2-2 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # +2-2 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # +3-3 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
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
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(1) # +1 public activities (own activity)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +2-1 public activities

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(1) # +2-1 public activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(2) # +2 foreign activities to own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(0) # has no own content

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(0) # has no own content
      end
    end
  end

  context "Activity forwardings", :redis do
    let(:user) { create(:user, username: 'User') }
    let(:friend) { create(:user, username: 'Friend') }

    context "Forward friend requests" do
      before(:each) do
        # Perform activity: request friendship
        user.initiate_friendship(friend.id)
      end

      after(:each) do
        # FIX: Remove friendship state to prevent affecting other tests
        friend.friendship(user.id).reject
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +1 friendship offered
        expect(user_feed.first['type']).to eq('User')
        expect(user_feed.first['action']).to eq('request')
        expect(user_feed.first['data']['target']['id']).to be(friend.id)
        expect(user_feed.first['data']['target']['friendshipState']).to eq('pending active')
        expect(user_feed.first['data']['actor']['id']).to be(user.id)
        expect(user_feed.first['data']['actor']['friendshipState']).to eq('pending passive')
        expect(user_feed.first['message']).to eq(I18n.t('user_request_me_singular',
                                                 {ACTOR: user.username,
                                                  USER: friend.username}))

        user_feed_friend = Feed.user_feed(friend.id).as_json
        expect(user_feed_friend.count).to be(0) # has no related activities
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no related activities

        news_feed_friend = Feed.news_feed(friend.id).as_json
        expect(news_feed_friend.count).to be(0) # has no related activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # has no related activities

        notification_feed_friend = Feed.notification_feed(friend.id).as_json
        expect(notification_feed_friend.count).to be(1) # +1 friendship offered
        expect(notification_feed_friend.first['type']).to eq('User')
        expect(notification_feed_friend.first['action']).to eq('request')
        expect(notification_feed_friend.first['data']['target']['id']).to be(friend.id)
        expect(notification_feed_friend.first['data']['target']['friendshipState']).to eq('pending active')
        expect(notification_feed_friend.first['data']['actor']['id']).to be(user.id)
        expect(notification_feed_friend.first['data']['actor']['friendshipState']).to eq('pending passive')
        expect(notification_feed_friend.first['message']).to eq(I18n.t('user_request_notify_singular',
                                                                {ACTOR: user.username,
                                                                 USER: friend.username}))
      end
    end

    context "Forward accepted friend requests" do
      before(:each) do
        # Perform activity: request friendship
        friend.initiate_friendship(user.id)
        # Perform activity: accept requested friendship
        user.friendship(friend.id).accept
      end

      after(:each) do
        # FIX: Remove friendship state to prevent affecting other tests
        user.friendship(friend.id).reject
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +1 friendship accepted
        expect(user_feed.first['message']).to eq(I18n.t('user_friendship_me_singular',
                                                        {ACTOR: user.username,
                                                         USER: friend.username}))

        user_feed_friend = Feed.user_feed(friend.id).as_json
        expect(user_feed_friend.count).to be(0) # has no related activities (request activity was removed after accept)
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no related activities

        news_feed_friend = Feed.news_feed(friend.id).as_json
        expect(news_feed_friend.count).to be(0) # has no related activities
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(1) # +1 friendship established
        expect(notification_feed.first['type']).to eq('User')
        expect(notification_feed.first['action']).to eq('accept')
        expect(notification_feed.first['data']['target']['id']).to be(friend.id)
        expect(notification_feed.first['data']['target']['friendshipState']).to eq('friend')
        expect(notification_feed.first['data']['actor']['id']).to be(user.id)
        expect(notification_feed.first['data']['actor']['friendshipState']).to eq('friend')
        expect(notification_feed.first['message']).to eq(I18n.t('user_accept_notify_singular',
                                                         {ACTOR: user.username,
                                                          USER: friend.username}))

        notification_feed_friend = Feed.notification_feed(friend.id).as_json
        expect(notification_feed_friend.count).to be(1) # +1 friendship established
        expect(notification_feed_friend.first['type']).to eq('User')
        expect(notification_feed_friend.first['action']).to eq('friendship')
        expect(notification_feed_friend.first['data']['target']['id']).to be(friend.id)
        expect(notification_feed_friend.first['data']['target']['friendshipState']).to eq('friend')
        expect(notification_feed_friend.first['data']['actor']['id']).to be(user.id)
        expect(notification_feed_friend.first['data']['actor']['friendshipState']).to eq('friend')
        expect(notification_feed_friend.first['message']).to eq(I18n.t('user_friendship_notify_singular',
                                                                {ACTOR: user.username,
                                                                 USER: friend.username}))
      end
    end

    context "Forward user tagging" do
      let!(:slot) { create(:std_slot_public, creator: user) }

      before(:each) do
        # Perform activity: tag users to a slot
        UsersToSlotTagger.new(slot).tag([follower.id, follower2.id], user)
      end

      it "User Feed (me activities)" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(2) # +2 own activities (2 users tagged)
        expect(user_feed.first['target']).to eq(slot.id.to_s)
        expect(user_feed.first['action']).to eq('tagged')
        expect(user_feed.first['data']['target']['id']).to be(slot.id)
        expect(user_feed.first['data']['actor']['id']).to be(user.id)
        expect(user_feed.second['target']).to eq(slot.id.to_s)
        expect(user_feed.second['action']).to eq('tagged')
        expect(user_feed.second['data']['target']['id']).to be(slot.id)
        expect(user_feed.second['data']['actor']['id']).to be(user.id)

        user_feed_follower = Feed.user_feed(follower.id).as_json
        expect(user_feed_follower.count).to be(0) # has no own activities

        user_feed_follower2 = Feed.user_feed(follower2.id).as_json
        expect(user_feed_follower2.count).to be(0) # has no own activities
      end

      it "News Feed (aggregated public activities)" do
        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # has no followings

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(0) # has no followings

        news_feed_follower2 = Feed.news_feed(follower2.id).as_json
        expect(news_feed_follower2.count).to be(0) # has no followings
      end

      it "Notification Feed (activities to own content)" do
        notification_feed = Feed.notification_feed(user.id).as_json
        expect(notification_feed.count).to be(0) # has no own content

        notification_feed_follower = Feed.notification_feed(follower.id).as_json
        expect(notification_feed_follower.count).to be(1) # +1 tagged from a user

        notification_feed_follower2 = Feed.notification_feed(follower2.id).as_json
        expect(notification_feed_follower2.count).to be(1) # +1 tagged from a user
      end
    end
  end

  context "Update Shared Objects", :redis do
    let(:user) { create(:user, :with_email, :with_password, picture: 'user.jpg') }
    let(:meta_slot) { create(:meta_slot, creator: user) }
    let!(:slot) { create(:std_slot_public, meta_slot: meta_slot) }

    context "User follows a slot" do
      before(:each) do
        # Create relationships
        follower.follow(slot)
        # Perform activities
        slot.create_like(user)
        # Modify shared object (Slot)
        slot.update_from_params(meta: { title: 'New Title' })
        # Modify shared object (User)
        user.update(picture: 'test.jpg') and Feed.update_shared_objects([user])
      end

      it "Feeds retrieved updates from shared objects" do
        user_feed = Feed.user_feed(user.id).as_json
        expect(user_feed.count).to be(1) # +1 own activities
        expect(user_feed.first['type']).to eq('Slot')
        expect(user_feed.first['action']).to eq('like')
        expect(user_feed.first['data']['target']['id']).to be(slot.id)
        expect(user_feed.first['data']['actor']['id']).to be(user.id)
        expect(user_feed.first['data']['actor']['image']).to eq('test.jpg')
        expect(user_feed.first['data']['target']['title']).to eq('New Title')
        expect(user_feed.first['data']['target']['likes']).to eq(1)
        expect(user_feed.first['data']['target']['likerIds']).to include(user.id)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.count).to be(1) # +1 public activity
        expect(news_feed_follower.first['type']).to eq('Slot')
        expect(news_feed_follower.first['action']).to eq('like')
        expect(news_feed_follower.first['data']['target']['id']).to be(slot.id)
        expect(news_feed_follower.first['data']['actor']['id']).to be(user.id)
        expect(news_feed_follower.first['data']['actor']['image']).to eq('test.jpg')
        expect(news_feed_follower.first['data']['target']['title']).to eq('New Title')
        expect(news_feed_follower.first['data']['target']['likes']).to eq(1)
        expect(news_feed_follower.first['data']['target']['likerIds']).to include(user.id)

        news_feed = Feed.news_feed(user.id).as_json
        expect(news_feed.count).to be(0) # +1 public activities

        expect(Feed.notification_feed(user.id).as_json.count).to be(0)
        expect(Feed.user_feed(follower.id).as_json.count).to be(0)
        expect(Feed.notification_feed(follower.id).as_json.count).to be(0)
      end

      it "Feeds retrieved updates from shared objects also if not affected" do
        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.first['data']['target']['likes']).to eq(1)
        expect(news_feed_follower.first['data']['target']['likerIds']).to include(user.id)

        slot.create_like(follower)

        news_feed_follower = Feed.news_feed(follower.id).as_json
        expect(news_feed_follower.first['data']['target']['likes']).to eq(2)
        expect(news_feed_follower.first['data']['target']['likerIds']).to include(user.id, follower.id)
      end
    end
  end
end
