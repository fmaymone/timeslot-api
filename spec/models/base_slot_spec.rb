require 'rails_helper'

RSpec.describe BaseSlot, type: :model do
  let(:base_slot) { build(:slot) }

  subject { base_slot }

  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to respond_to(:images) }
  it { is_expected.to respond_to(:audios) }
  it { is_expected.to respond_to(:videos) }
  it { is_expected.to belong_to(:meta_slot).inverse_of(:slots) }
  it { is_expected.to have_many(:containerships).inverse_of(:slot) }
  it { is_expected.to have_many(:slot_groups).inverse_of(:slots) }
  it { is_expected.to have_many(:passengerships).inverse_of(:slot) }
  it { is_expected.to have_many(:my_calendar_users)
                       .inverse_of(:my_calendar_slots) }
  it { is_expected.to have_many(:media_items) }
  it { is_expected.to have_many(:notes).inverse_of(:slot) }
  it { is_expected.to have_many(:likes).inverse_of(:slot) }
  it { is_expected.to have_many(:comments).inverse_of(:slot) }
  it { is_expected.to have_many(:re_slots).inverse_of(:parent) }

  it { is_expected.to respond_to(:followers) }
  it { is_expected.to respond_to(:followings) }
  it { is_expected.to respond_to(:follow) }
  it { is_expected.to respond_to(:unfollow) }
  it { is_expected.to respond_to(:add_follower) }
  it { is_expected.to respond_to(:remove_follower) }
  it { is_expected.to respond_to(:follows?) }
  it { is_expected.to respond_to(:following?) }
  it { is_expected.to respond_to(:followed_by?) }
  it { is_expected.to respond_to(:followers_count) }
  it { is_expected.to respond_to(:followings_count) }

  it { is_expected.to be_valid }

  describe "when MetaSlot is not present" do
    before { base_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot, title: "Timeslot") }
    let(:std_slot) { create(:std_slot, meta_slot: meta_slot) }

    it "contains title of the meta_slot" do
      expect(std_slot.start_date).to eq meta_slot.start_date
      expect(std_slot.title).to eq "Timeslot"
    end
  end

  describe "create_slot" do
    let(:meta_param) { attributes_for(:meta_slot) }
    let(:group) { create(:group) }
    let(:note_param) {{ title: 'Lee Hazlewood', content: 'The Girls in Paris' }}
    let(:alert_param) { attributes_for(:slot_setting)[:alerts] }
    let(:user) { create(:user) }

    it "creates a new StdSlot" do
      expect {
        described_class.create_slot(meta: meta_param, visibility: 'friends',
                                    user: user)
      }.to change(StdSlot.unscoped, :count).by 1
    end

    it "creates a new MetaSlot" do
      expect {
        described_class.create_slot(meta: meta_param, visibility: 'friends',
                                    user: user)
      }.to change(MetaSlot, :count).by 1
    end

    it "creates a new Note" do
      expect {
        described_class.create_slot(meta: meta_param, visibility: 'public',
                                    notes: [note_param], user: user)
      }.to change(Note, :count).by 1
    end

    it "creates a new SlotSetting" do
      expect {
        described_class.create_slot(meta: meta_param, visibility: 'private',
                                    alerts: alert_param, user: user)
      }.to change(SlotSetting, :count).by 1
    end

    context "existing metaslot" do
      let!(:meta_param) { { meta_slot_id: create(:meta_slot).id } }

      it "doesn't create a new MetaSlot" do
        expect {
          described_class.create_slot(meta: meta_param, visibility: 'friends',
                                      user: user)
        }.not_to change(MetaSlot, :count)
      end
    end
  end

  describe :delete do
    let(:slot) { create(:std_slot_private) }

    it "sets deleted_at on itself" do
      expect(slot.deleted_at?).to be false
      slot.delete
      expect(slot.deleted_at?).to be true
    end

    context "media", :vcr do
      let(:slot) { create(:std_slot_private, :with_media) }

      it "invalidates belonging media_items" do
        slot.delete
        expect(slot.media_items.first.deleted_at?).to be true
        expect(slot.media_items.last.deleted_at?).to be true
      end
    end

    context "notes" do
      let(:slot) { create(:std_slot_private, :with_notes) }

      it "deletes belonging notes" do
        slot.delete
        expect(slot.notes.first.deleted_at?).to be true
        expect(slot.notes.last.deleted_at?).to be true
      end
    end

    context "likes" do
      let(:slot) { build(:std_slot_private, :with_likes) }
      let!(:like) { create(:like, slot: slot) }

      it "deletes belonging likes" do
        slot.delete
        like.reload
        slot.reload
        expect(like.deleted_at?).to be true
        expect(slot.likes).to be_empty
      end
    end

    context "containerships" do
      let!(:containership) { create(:containership, slot: slot) }

      it "deletes the slot from all slotGroups where it is contained" do
        slot.delete
        containership.reload
        expect(containership.deleted_at?).to be true
        expect(slot.containerships.first.deleted_at?).to be true
      end
    end
  end

  describe :images do
    let(:std_slot) { create(:std_slot) }
    let!(:media) {
      create_list :slot_image, 3, mediable: std_slot
      create_list :audio, 2, mediable: std_slot
      create_list :video, 2, mediable: std_slot
    }
    it "returns all slot media items of type image" do
      expect(std_slot.media_items.length).to eq 7
      expect(std_slot.images.length).to eq 3
    end
  end

  describe :get do
    let(:std_slot) { create(:std_slot_private) }

    it "returns the specific slot representation" do
      result = BaseSlot.get(std_slot.id)
      expect(result.class).to eq std_slot.class
      expect(result.class).to eq StdSlotPrivate
    end

    it "fails with ActiveRecord::RecordNotFound if invalid ID" do
      expect { BaseSlot.get('foo') }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe :add_media do
    let(:user) { create(:user) }
    let(:std_slot) { create(:std_slot) }
    let(:new_video) { attributes_for(:video) }

    it "adds a new media item to the slot" do
      std_slot.add_media(new_video, user.id)
      std_slot.reload
      expect(std_slot.videos.length).to eq 1
      expect(std_slot.videos.first['creator_id']).to eq(user.id)
      expect(*std_slot.errors.messages.any?).to be false
    end

    it "doesn't add an invalid item" do
      new_video["public_id"] = ''
      std_slot.add_media(new_video, user.id)
      std_slot.reload
      expect(std_slot.videos.length).to eq 0
      expect(*std_slot.errors.messages.any?).to be true
      expect(std_slot.errors.messages).to have_key :video
      expect(*std_slot.errors.messages[:video]).to have_key :public_id
      expect(*std_slot.errors.messages[:video][0][:public_id]).to include "blank"
    end
  end

  describe :add_to_group do
    let(:std_slot) { create(:std_slot_public) }
    let(:group) { create(:group) }

    it "creates a new containership" do
      expect {
        std_slot.add_to_group(group)
      }.to change(Containership, :count).by 1
    end

    it "adds the slot to a given group" do
      std_slot.add_to_group(group)
      expect(group.slots).to include std_slot
    end

    it "adds the group to the given slot" do
      std_slot.add_to_group(group)
      expect(std_slot.slot_groups).to include group
    end

    context "existing deleted containership" do
      let(:containership) { create(:containership, slot: std_slot, group: group,
                                   deleted_at: Time.zone.now) }

      it "unsets deleted at" do
        expect(containership.deleted_at?).to be true
        std_slot.add_to_group(group)
        containership.reload
        expect(containership.deleted_at?).to be false
      end
    end
  end

  describe :remove_from_group do
    let(:std_slot) { create(:std_slot_public) }
    let(:group) { create(:group) }
    let!(:containership) {
      create(:containership, slot: std_slot, group: group) }

    it "doesn't remove the containership from the database" do
      expect {
        std_slot.remove_from_group(group)
      }.not_to change(Containership, :count)
    end

    it "sets deleted_at on the containership" do
      expect(containership.deleted_at?).to be false
      std_slot.remove_from_group(group)
      containership.reload
      expect(containership.deleted_at?).to be true
    end

    it "removes the slot from the given group" do
      expect(group.slots).to include std_slot
      std_slot.remove_from_group(group)
      expect(group.slots).not_to include std_slot
    end

    it "removes the group from the given slot" do
      expect(std_slot.slot_groups).to include group
      std_slot.remove_from_group(group)
      expect(std_slot.slot_groups).not_to include group
    end

    context "slotgroup does not contain slot" do
      let(:other_slot) { create(:std_slot_public) }

      it "does nothing, is idempotent" do
        expect(group.slots).not_to include other_slot
        expect {
          other_slot.remove_from_group(group)
        }.not_to raise_error
      end
    end

    context "existing deleted containership" do
      let(:containership) { create(:containership, slot: std_slot, group: group,
                                   deleted_at: Time.zone.now) }

      it "does nothing, is idempotent" do
        expect(containership.deleted_at?).to be true
        std_slot.remove_from_group(group)
        containership.reload
        expect(containership.deleted_at?).to be true
      end
    end
  end

  describe :create_like do
    let(:std_slot) { create(:std_slot) }
    let(:user) { create(:user) }

    it "creates a like if none exists" do
      expect {
        std_slot.create_like user
      }.to change(Like, :count).by 1
    end

    context "existing like" do
      let!(:like) { create(:like, user: user, slot: std_slot) }

      it "doesn't create a new like" do
        expect { std_slot.create_like user }.not_to change(Like, :count)
      end

      it "unsets deleted_at (re-like smt previously unliked)" do
        like.update(deleted_at: Time.zone.now)
        std_slot.create_like user
        like.reload
        expect(like.deleted_at?).to be false
      end
    end
  end

  describe :destroy_like do
    let(:std_slot) { create(:std_slot) }
    let(:user) { create(:user) }

    context "existing like" do
      let!(:like) { create(:like, user: user, slot: std_slot) }

      it "sets deleted_at on the like" do
        std_slot.destroy_like user
        like.reload
        expect(like.deleted_at?).to be true
      end
    end
  end

  describe :create_comment, :aws, :async do
    let(:creator) { create(:user) }
    let(:user) { create(:user) }
    let(:std_slot) { create(:std_slot, creator: creator) }
    let!(:device) { create(:device, :with_endpoint, user: creator) }

    it "adds a new comment to the slot" do
      expect {
        std_slot.create_comment(user, "some content for the comment")
      }.to change(Comment, :count).by 1
    end

    context "invalid params" do
      it "doesn't add a new comment to the slot" do
        expect {
          std_slot.create_comment(user, "")
        }.not_to change(Comment, :count)
      end

      it "returns the error" do
        std_slot.create_comment(user, "")
        expect(std_slot.errors.messages).to have_key :comment
        expect(std_slot.errors.messages[:comment].first.messages)
          .to have_key :content
      end
    end

    context "notifications" do
      it "notifies the slot owner if a new comment was made" do
        expect(Device).to receive(:notify_all).with(
                            [std_slot.creator_id], anything)
        std_slot.create_comment(user, 'some content for the comment')
      end

      context "existing comments" do
        let!(:existing_comments) { create_list(:comment, 3, slot: std_slot) }
        let(:commenters) { existing_comments.collect(&:user_id) }

        it "notifies previous commenters if a new comment was made" do
          expect(Device).to receive(:notify_all).with(
                              [std_slot.creator_id] + commenters, anything)
          std_slot.create_comment(user, 'some content for the comment')
        end
      end

      context "existing likes" do
        let!(:existing_likes) { create_list(:like, 3, slot: std_slot) }
        let(:likers) { existing_likes.collect(&:user_id) }

        it "notifies the slot likers if a new comment was made" do
          expect(Device).to receive(:notify_all).with(
                              [std_slot.creator_id] + likers, anything)
          std_slot.create_comment(user, 'some content for the comment')
        end

        context "existing comments and likes" do
          let!(:existing_comments) { create_list(:comment, 3, slot: std_slot) }
          let(:commenters) { existing_comments.collect(&:user_id) }
          let!(:existing_likes) { create_list(:like, 3, slot: std_slot) }
          let(:likers) { existing_likes.collect(&:user_id) }
          let!(:liking_commenter) { create(:like, slot: std_slot,
                                          user: existing_comments.first.user) }

          it "notifies the commenters and likers if a new comment was made" do
            expect(Device).to receive(:notify_all).with(
                                [std_slot.creator_id] + commenters + likers,
                                anything)
            std_slot.create_comment(user, 'some content for the comment')
          end

          it "doesn't notify a commenter/liker twice" do
            notified_ids = [std_slot.creator_id] + commenters + likers
            notified_ids << liking_commenter.user_id
            expect(Device).not_to receive(:notify_all).with(
                                    notified_ids, anything)
            std_slot.create_comment(user, 'some content for the comment')
          end
        end
      end
    end
  end

  describe :comments_with_details do
    let(:std_slot) { create(:std_slot_friends, :with_comments) }
    let(:user) { create(:user) }

    it "returns all comments for the slot" do
      comments = std_slot.comments_with_details
      expect(comments.size).to eq 3
      expect(comments).to include(*std_slot.comments)
    end
  end

  describe 'paging_cursor' do
    let(:std_slot) { create(:std_slot_public) }
    let!(:encoded_slot) { std_slot.as_paging_cursor }

    it "returns the correct pagination data" do
      result = described_class.from_paging_cursor(encoded_slot)
      expect(result[:id]).to eq std_slot.id
      expect(result[:startdate])
        .to eq std_slot.start_date.strftime('%Y-%m-%d %H:%M:%S.%N')
      expect(result[:enddate])
        .to eq std_slot.end_date.strftime('%Y-%m-%d %H:%M:%S.%N')
    end

    it "notifies airbrake if start_date of slot has changed" do
      std_slot.update(start_date: std_slot.start_date.yesterday.noon)
      expect(Airbrake).to receive(:notify)
      described_class.from_paging_cursor(encoded_slot)
    end

    it "notifies airbrake if end_date of slot has changed" do
      std_slot.update(end_date: std_slot.end_date.tomorrow.midnight)
      expect(Airbrake).to receive(:notify)
      described_class.from_paging_cursor(encoded_slot)
    end

    it "raises error if cursor string invalid" do
      std_slot.update(end_date: std_slot.end_date.tomorrow.midnight)
      expect {
        described_class.from_paging_cursor('something_wrong')
      }.to raise_error ApplicationController::PaginationError
    end

    it "raises error if cursor contains invalid slot.id" do
      std_slot.update(end_date: std_slot.end_date.tomorrow.midnight)
      expect {
        described_class.from_paging_cursor(encoded_slot.slice(2, 8))
      }.to raise_error ApplicationController::PaginationError
    end
  end
end
