require 'documentation_helper'
require 'acceptance/shared_contexts'

resource "Feeds", :activity, :async do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user) }
  let(:owner) { create(:user) }
  let(:actor) { create(:user) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

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

      let(:meta_slot) { create(:meta_slot,
                               title: 'Slot title 21', creator: owner) }
      let(:slot) { create(:std_slot_public, :with_media, :with_ios_location,
                          meta_slot: meta_slot) }
      let(:message) { I18n.t('slot_comment_me_singular', TITLE: slot.title) }

      example "Get the feed of the current users activities", document: :v1 do
        # Perform an activity
        slot.create_comment(current_user, 'This is a test comment.')

        do_request
        expect(response_status).to eq(200)
        expect(json.length).to be(1)

        activity = json.first
        expect(activity).to have_key("id")
        expect(activity).to have_key("type")
        expect(activity).to have_key("action")
        expect(activity).to have_key("target")
        expect(activity).to have_key("message")
        expect(activity).to have_key("data")
        expect(activity).to have_key("actors")
        expect(activity).not_to have_key("actor")

        expect(activity['message']).to eq(message)
        expect(activity['action']).to eq("comment")
        expect(activity['actors'].first.to_i).to eq(current_user.id)
        expect(activity['target'].to_i).to eq(slot.id)
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
      let(:meta_slot) {
        create(:meta_slot, title: 'Slot title 22', creator: user) }
      let(:slot) { create(:std_slot_public, :with_media, :with_ios_location,
                          meta_slot: meta_slot) }
      let(:message) { I18n.t('slot_comment_activity_singular',
                             USER: actor.username, TITLE: slot.title) }

      example "Get the feed of social related activities (aggregated)", document: :v1 do
        # Create a relationship
        current_user.follow(slot)
        # Perform an activity
        slot.create_comment(actor, 'This is another test comment.')

        do_request
        expect(response_status).to eq(200)
        expect(json.length).to be(1)

        activity = json.first
        expect(activity).to have_key("id")
        expect(activity).to have_key("action")
        expect(activity).to have_key("activityCount")
        expect(activity).to have_key("type")
        expect(activity).to have_key("target")
        expect(activity).to have_key("actors")
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
        expect(activity['action']).to eq("comment")
        expect(activity['actors']).to eq([actor.id])
        expect(activity['target'].to_i).to eq(slot.id)
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

      let(:meta_slot) {
        create(:meta_slot, title: 'Slot title 23', creator: current_user) }
      let(:slot) { create(:std_slot_public, :with_media, :with_ios_location,
                          meta_slot: meta_slot) }
      let(:message) { I18n.t('slot_comment_notify_singular',
                             USER: actor.username, TITLE: slot.title) }

      example "Get the feed of the current user notifications", document: :v1 do
        # Perform an activity
        slot.create_comment(actor, 'This is another test comment.')

        do_request
        expect(response_status).to eq(200)
        expect(json.length).to be(1)

        activity = json.first
        expect(activity).to have_key("id")
        expect(activity).to have_key("action")
        expect(activity).to have_key("type")
        expect(activity).to have_key("target")
        expect(activity).to have_key("message")
        expect(activity).to have_key("data")
        expect(activity).to have_key("actors")
        expect(activity).not_to have_key("actor")

        expect(activity['message']).to eq(message)
        expect(activity['action']).to eq("comment")
        expect(activity['actors'].first.to_i).to eq(actor.id)
        expect(activity['target'].to_i).to eq(slot.id)
        expect(activity['type']).to eq("Slot")
      end
    end
  end
end
