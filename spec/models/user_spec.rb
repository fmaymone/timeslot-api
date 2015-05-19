require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  subject { user }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:auth_token) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:created_slots) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:std_slots) }
  it { is_expected.to respond_to(:re_slots) }
  it { is_expected.to respond_to(:location_name) }
  it { is_expected.to respond_to(:device_token) }
  it { is_expected.to have_many(:images) }
  it { is_expected.to have_many(:created_slots).inverse_of(:creator) }
  it { is_expected.to have_many(:own_groups).inverse_of(:owner) }
  it { is_expected.to have_many(:memberships).inverse_of(:user) }
  it { is_expected.to have_many(:groups).through(:memberships) }
  it { is_expected.to have_many(:slot_settings).inverse_of(:user) }
  it { is_expected.to have_many(:std_slots).inverse_of(:owner) }
  it { is_expected.to have_many(:re_slots).inverse_of(:slotter) }
  it { is_expected.to have_many(:group_slots).through(:groups) }
  it { is_expected.to have_many(:initiated_friendships).inverse_of(:user) }
  it { is_expected.to have_many(:received_friendships).inverse_of(:friend) }

  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { user.username = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do
    before { user.username = "a" * 51 }
    it { is_expected.to_not be_valid }
  end

  describe "when email is not present" do
    before { user.email = nil }
    it { is_expected.to be_valid }
  end

  describe "when email is too long" do
    before { user.email = "user@".concat("a" * 254).concat(".com")  }
    it { should_not be_valid }
  end

  describe "when email format is valid" do
    it "will be valid" do
      addresses = %w([user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn])
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  describe "when email format is invalid" do
    it "will be invalid" do
      addresses = %w([user@foo,com user_at_foo.org example.user@foo.
                     @barbaz.com foo@.com])
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before { user.email = 'kw@ts.com' }
    it "won't be valid" do
      user.save
      user_with_same_email = user.dup
      user_with_same_email.email = user.email.upcase
      user_with_same_email.save

      expect(user_with_same_email).not_to be_valid
    end
  end

  describe "when phone number is already taken" do
    before { user.phone = '12345678' }
    it "won't be valid" do
      user.save
      user_with_same_phone = user.dup
      user_with_same_phone.save

      expect(user_with_same_phone).not_to be_valid
    end
  end

  describe "authentication params" do
    context "valid params" do
      let(:new_user) { build(:user, :with_email, :with_password) }

      it "succeeds if password is long enough" do
        expect(new_user.save).to be true
        expect(new_user.errors.empty?).to be true
      end

      it "saves an encrypted password for the user" do
        new_user.save
        expect(new_user.password_digest.present?).to be true
      end

      it "generates an auth_token for the user" do
        new_user.save
        expect(new_user.auth_token.present?).to be true
      end

      it "succeeds if password missing" do
        user.password = nil
        expect(user.save).to be true
      end
    end

    context "invalid params" do
      let(:invalid_user) { build(:user) }

      it "fails if password too short" do
        invalid_user.password = "han"
        expect(invalid_user.save).to be false
      end

      it "fails if password too long" do
        invalid_user.password = 'n' * 73
        expect(invalid_user.save).to be false
      end
    end
  end

  describe :active_slots do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot, title: "Timeslot") }

    context "user has std_slot with the specified meta_slot" do
      let!(:std_slot) {
        create(:std_slot_private, meta_slot: meta_slot, owner: user) }

      it "returns std_slot" do
        expect(user.active_slots(meta_slot)).to include std_slot
      end
    end

    context "user has re_slot with the specified meta_slot" do
      let!(:re_slot) { create(:re_slot, meta_slot: meta_slot, slotter: user) }

      it "returns reslot" do
        expect(user.active_slots(meta_slot)).to include re_slot
      end
    end

    context "user has group_slot with the specified meta_slot" do
      let(:group) { create(:group) }
      let!(:membership) { create(:membership, user: user, group: group) }
      let!(:group_slot) {
        create(:group_slot, meta_slot: meta_slot, group: group)
      }
      it "returns group_slot" do
        expect(user.active_slots(meta_slot)).to include group_slot
      end
    end

    context "user has no representation of the specified meta_slot" do
      it "returns empty array" do
        expect(user.active_slots(meta_slot).empty?).to be true
      end
    end

    context "user has deleted std_slot with the specified meta_slot" do
      let!(:std_slot) {
        create(:std_slot_private, :deleted, meta_slot: meta_slot, owner: user)
      }
      it "returns empty array" do
        expect(user.active_slots(meta_slot).empty?).to be true
      end
    end
  end

  describe :shared_group_slots do
    let(:user) { create(:user) }
    let(:bob) { create(:user) }

    let!(:slot_1) { create(:group_slot) }
    let!(:slot_2) { create(:group_slot) }
    let!(:slot_3) { create(:group_slot) }

    let!(:memberships) {
      create(:membership, :active, group: slot_1.group, user: user)
      create(:membership, :active, group: slot_1.group, user: bob)
      create(:membership, :active, group: slot_2.group, user: user)
      create(:membership, :active, group: slot_2.group, user: bob)
      create(:membership, :active, group: slot_3.group, user: bob)
    }

    it "returns slots from common groups but not from other groups" do
      result = user.shared_group_slots(bob)
      expect(result).to include slot_1
      expect(result).not_to include slot_3
    end
  end

  describe :update_alerts do
    let(:slot) { create(:std_slot_friends, owner: user) }

    describe "no existing SlotSetting" do
      it "returns the SlotSetting object" do
        expect(user.update_alerts(slot, '1100110011')).to eq SlotSetting.last
      end

      it "it creates a new slot_setting object" do
        expect {
          user.update_alerts(slot, '0101010101')
        }.to change(SlotSetting, :count).by 1
      end

      it "doesn't create a new slot_setting if alerts eq users default alerts" do
        user.update(default_own_friendslot_alerts: '1110011110')
        expect {
          user.update_alerts(slot, '1110011110')
        }.not_to change(SlotSetting, :count)
      end

      context "group_slot" do
        let(:slot) { create(:group_slot) }
        let!(:membership) { create(:membership, :active, group: slot.group,
                                   user: user, default_alerts: '1110011110') }
        before { user.update(default_group_alerts: '0000000010') }

        it "doesn't create a new slot_setting if alerts eq group default alerts" do
          expect {
            user.update_alerts(slot, '1110011110')
          }.not_to change(SlotSetting, :count)
        end

        it "creates a new slot_setting if alerts eq default group alerts " \
           "but not the default membership alerts" do
          expect {
            user.update_alerts(slot, '0000000010')
          }.to change(SlotSetting, :count).by 1
        end
      end
    end

    describe "existing SlotSetting" do
      let!(:slot_setting) {
        create(:slot_setting, meta_slot: slot.meta_slot, user: user)
      }
      let(:new_alert) { '1010101010' }

      it "updates alerts" do
        user.update_alerts(slot, new_alert)
        slot_setting.reload
        expect(slot_setting.alerts).to eq(new_alert)
      end

      it "doesn't create a new slot_setting" do
        expect {
          user.update_alerts(slot, '1010101010')
        }.not_to change(SlotSetting, :count)
      end
    end
  end

  describe :alerts do
    context "private StdSlot" do
      let(:std_slot) { create(:std_slot_private, owner: user) }
      before { user.update(default_private_alerts: '0000000010') }

      describe "existing default alert for user" do
        it "returns the default private alerts for private slot" do
          expect(user.alerts(std_slot)).to eq user.default_private_alerts
          expect(user.alerts(std_slot)).to eq '0000000010'
        end
      end

      describe "existing slot_setting" do
        let!(:slot_setting) {
          create(:slot_setting, user: user, meta_slot: std_slot.meta_slot,
                 alerts: '0000011111') }

        it "returns the alarm for a specific slot representation" do
          expect(user.alerts(std_slot)).to eq slot_setting.alerts
        end
      end
    end

    context "own friend StdSlot" do
      let(:std_slot) { create(:std_slot_friends, owner: user) }
      before { user.update(default_own_friendslot_alerts: '1010101010') }

      describe "existing default alert for user" do
        it "returns the default own friendslot alerts for friendslots" do
          expect(user.alerts(std_slot)).to eq user.default_own_friendslot_alerts
        end
      end

      describe "existing slot_setting" do
        let!(:slot_setting) {
          create(:slot_setting, user: user, meta_slot: std_slot.meta_slot,
                 alerts: '0000011111') }

        it "returns the alarm for a specific slot representation" do
          expect(user.alerts(std_slot)).to eq slot_setting.alerts
        end
      end
    end

    context "groupSlot" do
      let(:slot) { create(:group_slot) }
      let!(:membership) {
        create(:membership, :active, group: slot.group, user: user) }

      context "existing alerts" do
        let(:new_alert) { '1010101010' }
        before { user.update(default_group_alerts: new_alert) }

        describe "existing default alert for group" do
          it "returns the group default alert for this user" do
            membership.update(default_alerts: '1110011110')
            expect(user.alerts(slot)).to eq membership.default_alerts
          end
        end

        describe "existing default group alert for user but not for membership" do
          it "returns the users default group alert" do
            expect(user.alerts(slot)).to eq new_alert
          end
        end

        describe "existing slot_setting" do
          let!(:slot_setting) {
            create(:slot_setting, user: user, meta_slot: slot.meta_slot,
                   alerts: '0000011111') }

          it "returns the alarm for a specific slot representation" do
            expect(user.alerts(slot)).to eq slot_setting.alerts
          end
        end
      end

      describe "no alerts set" do
        it "returns 0000000000" do
          expect(user.alerts(slot)).to eq '0000000000'
        end
      end
    end

    context "several slot representations" do
      let(:std_slot) { create(:std_slot_friends, owner: user) }
      let!(:group_slot) { create(:group_slot, meta_slot: std_slot.meta_slot) }
      let!(:membership) {
        create(:membership, :active, group: group_slot.group, user: user) }
      before {
        user.update(default_own_friendslot_alerts: '0000000111')
        user.update(default_group_alerts: '1110000000')
      }

      it "merges the default alerts" do
        expect(user.alerts(std_slot)).to eq '1110000111'
      end
    end
  end

  describe :groups do
    let(:user) { create(:user, :with_3_groups) }
    it "returns the groups where user is a member" do
      expect(user.groups.size).to eq 3
    end
  end

  describe :own_groups do
    let(:user) { create(:user, :with_3_own_groups) }
    it "returns the users own groups" do
      expect(user.own_groups.size).to eq 3
    end
  end

  describe :invited? do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    describe "membership exists" do
      let!(:membership) { create(:membership, user: user, group: group) }

      describe "state invited" do
        it "return true" do
          membership.invite
          expect(user.invited? group.id).to be true
        end
      end

      describe "state not invited" do
        it "return false if kicked" do
          membership.kick
          expect(user.invited? group.id).to be false
        end

        it "return false if refused" do
          membership.refuse
          expect(user.invited? group.id).to be false
        end

        it "return false if active" do
          membership.activate
          expect(user.invited? group.id).to be false
        end

        it "return false if inactive" do
          membership.inactivate
          expect(user.invited? group.id).to be false
        end
      end
    end

    describe "membership doesn't exists" do
      it "return false" do
        expect(user.invited? group.id).to be false
      end
    end
  end

  describe :active_member? do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    describe "membership exists" do
      let!(:membership) { create(:membership, user: user, group: group) }

      describe "state active" do
        it "return true" do
          membership.activate
          expect(user.active_member? group.id).to be true
        end
      end

      describe "state not active" do
        it "return false if kicked" do
          membership.kick
          expect(user.active_member? group.id).to be false
        end

        it "return false if refused" do
          membership.refuse
          expect(user.active_member? group.id).to be false
        end

        it "return false if inactive" do
          membership.inactivate
          expect(user.active_member? group.id).to be false
        end

        it "return false if invite" do
          membership.invite
          expect(user.active_member? group.id).to be false
        end
      end
    end

    describe "membership doesn't exists" do
      it "return false" do
        expect(user.active_member? group.id).to be false
      end
    end
  end

  describe :owner? do
    let(:user) { create(:user) }

    describe "user is group owner" do
      let(:group) { create(:group, owner: user) }

      it "return true" do
        expect(user.owner? group).to be true
      end
    end

    describe "user not owner" do
      let(:group) { create(:group) }

      it "return false" do
        expect(user.owner? group).to be false
      end
    end
  end

  describe :get_membership do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    describe "membership exists" do
      let!(:membership) { create(:membership, user: user, group: group) }

      it "return membership" do
        expect(user.get_membership group.id).to eq membership
      end
    end

    describe "no existing membership" do
      it "return nil" do
        expect(user.get_membership group.id).to be nil
      end
    end
  end

  describe :friends do
    let(:john) { create(:user, username: "John") }
    let!(:friendships_A) { create_list(:friendship, 2, :established, user: john) }
    let!(:friendships_B) { create_list(:friendship, 3, :established, friend: john) }

    it "returns all friends" do
      expect(john.friends.size).to eq 5
    end
  end

  describe :friendship do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let!(:friendship_1) {
      create(:friendship, :established, user: john, friend: mary) }
    let!(:friendship_2) {
      create(:friendship, :established, user: alice, friend: john) }

    it "returns the friendship object for the given user" do
      expect(john.friendship(mary)).to eq friendship_1
      expect(john.friendship(alice)).to eq friendship_2
    end

    it "returns nil if no connection" do
      expect(alice.friendship(mary)).to be nil
    end
  end

  describe :friend_with? do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let!(:friendship_1) {
      create(:friendship, :established, user: john, friend: mary) }
    let!(:friendship_2) {
      create(:friendship, :rejected, user: alice, friend: john) }

    it "returns true if the given user has an established friendship" do
      expect(john.friend_with? mary).to be true
    end

    it "returns false if the given user has no established friendship" do
      expect(alice.friend_with? mary).not_to be true
    end

    it "returns false if the given user has rejected friendship" do
      expect(alice.friend_with? john).not_to be true
    end
  end

  describe :offered_friendship do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let(:bob) { create(:user, username: "Bob") }
    let!(:friendship_1) {
      create(:friendship, user: user, friend: mary) }
    let!(:friendship_2) {
      create(:friendship, user: john, friend: user) }
    let!(:friendship_3) {
      create(:friendship, :established, user: alice, friend: user) }
    let!(:friendship_4) {
      create(:friendship, :established, user: user, friend: bob) }

    it "returns the friendship object if a friendship was offered" \
       " to the current user by to other user" do
      expect(user.offered_friendship(john)).to eq friendship_2
    end

    it "returns nil if no friendship was offered" \
       " to the current user by to other user" do
      expect(user.offered_friendship(mary)).to be nil
      expect(user.offered_friendship(alice)).to be nil
      expect(user.offered_friendship(bob)).to be nil
    end
  end

  describe "friendship associations" do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let(:bob) { create(:user, username: "Bob") }
    let(:charlie) { create(:user, username: "Charlie") }
    let(:eve) { create(:user, username: "Eve") }
    let!(:friendship_1) {
      create(:friendship, :established, user: user, friend: mary) }
    let!(:friendship_2) {
      create(:friendship, :established, user: alice, friend: user) }
    let!(:friendship_3) {
      create(:friendship, user: user, friend: john) }
    let!(:friendship_4) {
      create(:friendship, user: bob, friend: user) }
    let!(:friendship_5) {
      create(:friendship, :established, user: bob, friend: alice) }
    let!(:friendship_6) {
      create(:friendship, user: mary, friend: john) }
    let!(:friendship_7) {
      create(:friendship, :deleted, user: mary, friend: alice) }
    let!(:friendship_8) {
      create(:friendship, :established, :deleted, user: john, friend: bob) }
    let!(:friendship_9) {
      create(:friendship, :established, :deleted, user: user, friend: charlie) }
    let!(:friendship_10) {
      create(:friendship, :deleted, user: eve, friend: user) }

    context :initiated_friendships do
      it "contains all friendships initiated by current user" do
        expect(user.initiated_friendships).to include friendship_1
        expect(user.initiated_friendships).to include friendship_3
        expect(user.initiated_friendships).to include friendship_9
        expect(user.initiated_friendships).not_to include friendship_2
        expect(user.initiated_friendships).not_to include friendship_4
        expect(user.initiated_friendships).not_to include friendship_5
        expect(user.initiated_friendships).not_to include friendship_6
        expect(user.initiated_friendships).not_to include friendship_7
        expect(user.initiated_friendships).not_to include friendship_8
        expect(user.initiated_friendships).not_to include friendship_10
      end
    end

    context :received_friendships do
      it "contains all friendships that current user received by other users" do
        expect(user.received_friendships).to include friendship_2
        expect(user.received_friendships).to include friendship_4
        expect(user.received_friendships).to include friendship_10
        expect(user.received_friendships).not_to include friendship_1
        expect(user.received_friendships).not_to include friendship_3
        expect(user.received_friendships).not_to include friendship_5
        expect(user.received_friendships).not_to include friendship_6
        expect(user.received_friendships).not_to include friendship_7
        expect(user.received_friendships).not_to include friendship_8
        expect(user.received_friendships).not_to include friendship_9
      end
    end

    context :friendships do
      it "contains all active (not deleted) friendships" do
        expect(user.friendships).to include friendship_1
        expect(user.friendships).to include friendship_2
        expect(user.friendships).to include friendship_3
        expect(user.friendships).to include friendship_4
        expect(user.friendships).not_to include friendship_5
        expect(user.friendships).not_to include friendship_6
        expect(user.friendships).not_to include friendship_7
        expect(user.friendships).not_to include friendship_8
        expect(user.friendships).not_to include friendship_9
        expect(user.friendships).not_to include friendship_10
      end
    end

    context :friends_by_request do
      it "contains all friends where current user" \
         " requested friendship and the friend accepted" do
        expect(user.friends_by_request).to include mary
        expect(user.friends_by_request).not_to include john
        expect(user.friends_by_request).not_to include alice
        expect(user.friends_by_request).not_to include bob
        expect(user.friends_by_request).not_to include charlie
        expect(user.friends_by_request).not_to include eve
      end
    end

    context :friends_by_offer do
      it "contains all friends where the friendship was initiated by the" \
         " other user and current user accepted" do
        expect(user.friends_by_offer).to include alice
        expect(user.friends_by_offer).not_to include john
        expect(user.friends_by_offer).not_to include mary
        expect(user.friends_by_offer).not_to include bob
        expect(user.friends_by_offer).not_to include charlie
        expect(user.friends_by_offer).not_to include eve
      end
    end
  end

  describe "auditing", :commit do
    let!(:user) { create(:user) }

    it "logs instance changes" do
      expect(Rails.logger).to receive(:info).once

      new_name = "name_#{user.id}"
      user.update(username: new_name)

      expect(user.username).to eq new_name
    end
  end

  describe "prevent removing from db" do
    let!(:user) { create(:user) }

    it "can not be deleted" do
      before_count = described_class.count

      expect(Rails.logger).to receive(:error)
      expect {
        user.delete
      }.to raise_error
      expect(before_count).to eq described_class.all.size
    end

    it "can not be destroyed" do
      before_count = described_class.count

      expect(Rails.logger).to receive(:error)
      expect {
        user.destroy
      }.to raise_error
      expect(before_count).to eq described_class.all.size
    end
  end

  describe "create_with_image" do
    let(:user_params) { attributes_for(:user, password: 'something') }

    context "valid params" do
      it "creates a new user" do
        expect {
          User.create_with_image(user_params)
        }.to change(User, :count).by 1
      end

      it "sets the default role for the user" do
        User.create_with_image(user_params)
        expect(User.last.role).to eq "basic"
        expect(User.last.basic?).to be true
        expect(User.last.webview?).to be false
      end

      it "sets an image if provided" do
        user_params.merge!("public_id" => 'foobar')
        expect {
          User.create_with_image(user_params)
        }.to change(MediaItem, :count).by 1
        expect(User.last.image.public_id).to eq user_params["public_id"]
      end
    end

    context "invalid params" do
      it "doesn't create a new user if username is nil" do
        user_params[:username] = nil
        expect {
          User.create_with_image(user_params)
        }.not_to change(User, :count)
      end

      it "creates a new user even if mediaitems public_id is nil" do
        user_params.merge!("public_id" => nil)

        expect {
          User.create_with_image(user_params)
        }.to change(User, :count).by 1
      end

      it "doesn't create a new mediaitem if public_id is nil" do
        user_params.merge!("public_id" => nil)

        expect {
          User.create_with_image(user_params)
        }.not_to change(MediaItem, :count)
      end
    end
  end

  describe "sign_in" do
    let(:user) { create(:user, :with_email, :with_password) }

    context "with email" do
      it "returns the user" do
        expect(
          User.sign_in(email: user.email, password: user.password)
        ).to eq user
      end
    end

    context "with phone" do
      let(:user) { create(:user, :with_phone, :with_password) }

      it "returns the user" do
        expect(
          User.sign_in(phone: user.phone, password: user.password)
        ).to eq user
      end
    end

    context "invalid params" do
      it "returns false if invalid password" do
        expect(
          User.sign_in(email: user.email, password: 'marzipan')
        ).to be false
      end

      it "returns nil if invalid email" do
        expect(
          User.sign_in(email: 'marzipan', password: user.password)
        ).to be nil
      end
    end
  end

  describe :reset_password do
    let!(:user) { create(:user, password: 'timeslot') }

    context "valid params" do
      it "resets the password" do
        initial_pwd_digest = user.password_digest
        user.reset_password
        expect(initial_pwd_digest).not_to eq user.password_digest
      end

      it "resets the authToken" do
        initial_auth_token = user.auth_token
        user.reset_password
        expect(initial_auth_token).not_to eq user.auth_token
      end

      it "sends an email to the user" do
        skip 'needs mailer'
      end
    end
  end

  describe "prepare_for_slot_deletion" do
    let(:slot) { create(:std_slot_private, owner: user) }
    let!(:slot_setting) {
      create(:slot_setting, meta_slot: slot.meta_slot, user: user) }

    it "sets deleted_at if user has no representation of meta_slot" do
      user.prepare_for_slot_deletion slot
      slot_setting.reload
      expect(slot_setting.deleted_at?).to be true
    end

    describe "user has a representation of meta_slot" do
      let!(:std_slot) {
        create(:std_slot_private, meta_slot: slot.meta_slot, owner: user) }

      it "doesn't set deleted_at" do
        user.prepare_for_slot_deletion slot
        slot_setting.reload
        expect(slot_setting.deleted_at?).to be false
      end
    end
  end
end
