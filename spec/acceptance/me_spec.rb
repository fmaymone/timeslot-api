require 'documentation_helper'

resource "Me" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password, :with_device) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

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

  # TODO: remove duplication in user acceptance spec
  shared_context "current user response fields" do
    include_context "default user response fields"

    response_field :email, "Email of user (max. 255 characters)"
    response_field :phone, "Phone number of user (max. 35 characters)"
    response_field :lang, "Language code (ISO 639-1)"
    response_field :publicUrl, "Public URL for user on Timeslot (max. 255 chars)"
    response_field :slotDefaultDuration, "Default Slot Duration in seconds"
    response_field :slotDefaultTypeId, "Default Slot Type - WIP"
    response_field :slotDefaultLocationId, "Default Slot Location ID - WIP"
    response_field :defaultPrivateAlerts,
                   "Default alerts for private slots of this user"
    response_field :defaultOwnFriendslotAlerts,
                   "Default alerts for the friendslots of this user"
    response_field :defaultOwnPublicAlerts,
                   "Default alerts for the public slots of this user"
    response_field :defaultFriendsFriendslotAlerts,
                   "Default alerts for the friendslots from friends of this user"
    response_field :defaultFriendsPublicAlerts,
                   "Default alerts for the public slots from friends of this user"
    response_field :defaultReslotAlerts,
                   "Default alerts for the reslots of this user"
    response_field :defaultGroupAlerts,
                   "Default alerts for all groupslots of this user" \
                   " where no specific alert is set. Groupslots" \
                   " may also have their own default alerts per group"
    response_field :friendships, "all connections to other users"
    response_field :memberships, "all connections to groups"
    response_field :devices, "all devices from user"
  end

  delete "/v1/me" do
    header "Authorization", :auth_header

    include_context "current user response fields"

    example "Delete current user", document: :v1 do
      explanation "Sets 'deletedAt' attr for user who is logged in" \
                  "Doesn't delete anything.\n\n" \
                  "returns user data"
      do_request

      current_user.reload
      expect(current_user.deleted_at).not_to be nil
      expect(response_status).to eq(200)
    end
  end
end
