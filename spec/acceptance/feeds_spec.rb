require 'documentation_helper'

resource "Feeds", :activity, :async do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:owner) { create(:user, username: 'User 54') }
  let(:actor) { create(:user, username: 'User 53') }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  shared_context "default slot response fields" do
    response_field :id, "ID of the slot"
    response_field :title, "Title of the slot"
    response_field :startDate, "Startdate of the slot"
    response_field :endDate, "Enddate of the slot"
    response_field :openEnd, "OpenEnd Boolean Flag"
    response_field :createdAt, "Creation of slot"
    response_field :updatedAt, "Last update of slot"
    response_field :deletedAt, "Delete date of slot or nil"
    response_field :location, "Location data for the slot"
    response_field :creator, "User who created the slot"
    response_field :settings,
                   "Only included if it's a slot of the current User " \
                   "(created-/friend-/re-/groupslot),\n\n" \
                   "contains User specific settings for this slot (alerts)"
    response_field :visibility, "Visibiltiy of the slot"
    response_field :notes, "Notes on the slot"
    response_field :likes, "Likes for the slot"
    response_field :commentsCounter, "Number of comments on the slot"
    response_field :reslotsCounter, "Number of reslots for this slot"
    response_field :shareUrl, "Share URL for this slot, nil if not yet shared"
    response_field :images, "Images for the slot"
    response_field :audios, "Audio recordings for the slot"
    response_field :videos, "Videos recordings for the slot"
  end

  shared_context "default user response fields" do
    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"
    response_field :location, "Home location of user"
    response_field :push, "Send push Notifications (true/false)"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"
    response_field :slotCount, "Number of slots for this user"
    response_field :reslotCount, "Number of reslots for this user"
    response_field :friendsCount, "Number of friends for this user"
  end

  get "/v1/feed/user", :redis do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :limit, "Maximum count of items which are included in the result"
    parameter :offset, "The offset value how many result items should be skipped " \
                         "before the limits start counting (or use cursor instead)"
    parameter :cursor, "The ID of the activity to start loading from (not included) " \
                         "(or use offset instead)"

    describe "Get the users activity feed" do
      include_context "default slot response fields"
      include_context "default user response fields"

      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253,
                               title: 'Slot title 21', creator: owner) }
      let(:slot) { create(:std_slot_public, :with_media,
                          meta_slot: meta_slot) }
      let(:message) { I18n.t('slot_comment_me_singular', TITLE: slot.title) }

      example "Get the feed of the current users activities", document: :v1 do

        # Create a relationship
        #current_user.add_follower(owner)
        # Perform an activity
        slot.create_comment(current_user, 'This is a test comment.')

        do_request
        expect(response_status).to eq(200)
        expect(json.length).to be(1)

        activity = json.first
        expect(activity).to have_key("id")
        expect(activity).to have_key("type")
        expect(activity).to have_key("activity")
        expect(activity).to have_key("object")
        expect(activity).to have_key("target")
        expect(activity).to have_key("foreign")
        expect(activity).to have_key("message")
        expect(activity).to have_key("data")
        expect(activity).to have_key("actors")
        expect(activity).not_to have_key("actor")

        expect(activity['message']).to eq(message)
        expect(activity['activity']).to eq("comment")
        expect(activity['actors'].first.to_i).to eq(current_user.id)
        expect(activity['object'].to_i).to eq(slot.comments.last.id)
        expect(activity['target'].to_i).to eq(slot.id)
        expect(activity['foreign'].to_i).to eq(slot.creator.id)
        expect(activity['type']).to eq("Slot")
      end
    end
  end

  get "/v1/feed/news", :redis do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :style, "Style of the news activity feed ('flat' or 'aggregated')"
    parameter :limit, "Maximum count of items which are included in the result"
    parameter :offset, "The offset value how many result items should be skipped " \
                         "before the limits start counting (or use cursor instead)"
    parameter :cursor, "The ID of the activity to start loading from (not included) " \
                         "(or use offset instead)"

    describe "Get an aggregated activity feed" do
      include_context "default slot response fields"
      include_context "default user response fields"

      let(:user) { create(:user) }
      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253,
                               title: 'Slot title 22', creator: user) }
      let(:slot) { create(:std_slot_public, :with_media,
                          meta_slot: meta_slot) }
      let(:message) { I18n.t('slot_comment_activity_singular',
                             USER: actor.username, TITLE: slot.title) }

      example "Get the feed of public activities (aggregated)", document: :v1 do
        #explanation "some extra activity fields are included"

        # Create a relationship
        slot.add_follower(current_user) #actor.add_follower(current_user)
        # Perform an activity
        slot.create_comment(actor, 'This is another test comment.')

        do_request
        expect(response_status).to eq(200)
        expect(json.length).to be(1)

        activity = json.first
        expect(activity).to have_key("id")
        expect(activity).to have_key("activity")
        expect(activity).to have_key("activityCount")
        expect(activity).to have_key("group")
        expect(activity).to have_key("type")
        expect(activity).to have_key("target")
        expect(activity).to have_key("foreign")
        expect(activity).to have_key("actors")
        expect(activity).to have_key("object")
        expect(activity).to have_key("target")
        expect(activity).to have_key("message")
        expect(activity).to have_key("data")
        expect(activity['data']).to have_key("target")
        expect(activity['data']).to have_key("actor")

        activity_slot = activity['data']["target"]
        expect(activity_slot).to have_key("id")
        expect(activity_slot).to have_key("title")
        expect(activity_slot).to have_key("startDate")
        expect(activity_slot).to have_key("endDate")
        expect(activity_slot).to have_key("location")
        expect(activity_slot).to have_key("creator")
        expect(activity_slot).to have_key("settings")
        expect(activity_slot).to have_key("createdAt")
        expect(activity_slot).to have_key("updatedAt")
        expect(activity_slot).to have_key("deletedAt")
        expect(activity_slot).to have_key("notes")
        expect(activity_slot).to have_key("likes")
        expect(activity_slot).to have_key("commentsCounter")
        expect(activity_slot).to have_key("reslotsCounter")
        expect(activity_slot).to have_key("shareUrl")
        expect(activity_slot).to have_key("visibility")
        expect(activity_slot).to have_key("media")
        expect(activity_slot['creator']).to have_key("username")
        expect(activity_slot['media'].length).to eq(slot.media_items.length)
        expect(activity_slot['title']).to eq(slot.title)

        activity_user = activity['data']['actor']
        expect(activity_user).to have_key("id")
        expect(activity_user).to have_key("username")
        expect(activity_user).to have_key("image")
        expect(activity_user).to have_key("friendsCount")
        expect(activity_user).to have_key("reslotCount")
        expect(activity_user).to have_key("slotCount")
        expect(activity_user['username']).to eq(actor.username)

        expect(activity['message']).to eq(message)
        expect(activity['activity']).to eq("comment")
        expect(activity['actors']).to eq([actor.id])
        expect(activity['object'].to_i).to eq(slot.comments.last.id)
        expect(activity['target'].to_i).to eq(slot.id)
        expect(activity['foreign'].to_i).to eq(slot.creator.id)
        expect(activity['type']).to eq("Slot")
      end
    end
  end

  get "/v1/feed/notification", :redis do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :limit, "Maximum count of items which are included in the result"
    parameter :offset, "The offset value how many result items should be skipped " \
                         "before the limits start counting (or use cursor instead)"
    parameter :cursor, "The ID of the activity to start loading from (not included) " \
                         "(or use offset instead)"

    describe "The notification feed includes all In-App-Notifications " \
             "(only activities on content which the user owns, filter out own user activities)" do
      include_context "default slot response fields"
      include_context "default user response fields"

      let(:meta_slot) { create(:meta_slot, location_id: 200_719_253,
                               title: 'Slot title 23', creator: current_user) }
      let(:slot) { create(:std_slot_public, :with_media,
                          meta_slot: meta_slot) }
      let(:message) { I18n.t('slot_comment_notify_singular',
                             USER: actor.username, TITLE: slot.title) }

      example "Get the feed of the current user notifications", document: :v1 do
        #explanation "some extra activity fields are included"

        # Create a relationship
        actor.add_follower(current_user)
        # Perform an activity
        slot.create_comment(actor, 'This is another test comment.')

        do_request
        expect(response_status).to eq(200)
        expect(json.length).to be(1)

        activity = json.first
        expect(activity).to have_key("id")
        expect(activity).to have_key("activity")
        expect(activity).to have_key("type")
        expect(activity).to have_key("target")
        expect(activity).to have_key("foreign")
        expect(activity).to have_key("object")
        expect(activity).to have_key("target")
        expect(activity).to have_key("message")
        expect(activity).to have_key("data")
        expect(activity).to have_key("actors")
        expect(activity).not_to have_key("actor")

        expect(activity['message']).to eq(message)
        expect(activity['activity']).to eq("comment")
        expect(activity['actors'].first.to_i).to eq(actor.id)
        expect(activity['object'].to_i).to eq(slot.comments.last.id)
        expect(activity['target'].to_i).to eq(slot.id)
        expect(activity['foreign'].to_i).to eq(slot.creator.id)
        expect(activity['type']).to eq("Slot")
      end
    end
  end
end
