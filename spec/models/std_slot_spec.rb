require 'rails_helper'

RSpec.describe StdSlot, type: :model do
  let(:std_slot) { build(:std_slot_public) }

  subject { std_slot }

  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:open_end) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to respond_to(:slot_type) }
  it { is_expected.to respond_to(:likes) }
  it { is_expected.to respond_to(:comments) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to belong_to(:owner).inverse_of(:std_slots) }
  it { is_expected.to belong_to(:meta_slot) }
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
    before { std_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "unprivate scope" do
    let(:user) { create(:user) }
    let!(:privat_slot) { create(:std_slot_private, owner: user) }
    let!(:friend_slot) { create(:std_slot_friends, owner: user) }
    let!(:foaf_slot) { create(:std_slot_foaf, owner: user) }
    let!(:public_slot) { create(:std_slot_public, owner: user) }

    it "returns all non-private slots" do
      result = user.std_slots.unprivate.ids

      expect(result).to include public_slot.id
      expect(result).to include friend_slot.id
      expect(result).to include foaf_slot.id
      expect(result).not_to include privat_slot.id
    end
  end

  describe "create_slot" do
    let!(:meta_slot) { create(:meta_slot) }
    let(:user) { create(:user) }

    it "creates a new StdSlotPrivate" do
      expect {
        described_class.create_slot(meta_slot: meta_slot, visibility: 'private',
                                    user: user)
      }.to change(StdSlotPrivate, :count).by 1
    end

    it "creates a new StdSlotFriends" do
      expect {
        described_class.create_slot(meta_slot: meta_slot, visibility: 'friends',
                                    user: user)
      }.to change(StdSlotFriends, :count).by 1
    end

    it "creates a new StdSlotFoaf (visibility friend-of-a-friend)" do
      expect {
        described_class.create_slot(meta_slot: meta_slot,
                                    visibility: 'foaf',
                                    user: user)
      }.to change(StdSlotFoaf, :count).by 1
    end

    it "creates a new StdSlotPublic" do
      expect {
        described_class.create_slot(meta_slot: meta_slot, visibility: 'public',
                                    user: user)
      }.to change(StdSlotPublic, :count).by 1
    end

    it "does not create a new StdSlot if visibility is invalid" do
      expect {
        described_class.create_slot(meta_slot: meta_slot, visibility: 'unknown',
                                    user: user)
      }.not_to change(StdSlotPublic, :count)
    end

    it "does not create a new StdSlot if visibility is empty" do
      expect {
        described_class.create_slot(meta_slot: meta_slot, visibility: '',
                                    user: user)
      }.not_to change(StdSlotPublic, :count)
    end
  end

  describe :update do
    let(:slot) { create(:std_slot, :with_ios_location) }
    let(:new_location) { { ios_location: { locality: 'chicago' } } }

    context "same location" do
      it "updates the location of a slot" do
        expect {
          slot.update(new_location)
        }.to change(slot.meta_slot, :ios_location)
        expect(slot.ios_location.locality).to eq 'chicago'
      end
    end

    context "same location" do
      let(:new_location) do
        { ios_location: { latitude: slot.ios_location.latitude,
                          longitude: slot.ios_location.longitude } }
      end

      it "doesn't update the location of a slot if same lat/long" do
        expect {
          slot.update(new_location)
        }.not_to change(slot.meta_slot, :ios_location)
      end
    end
  end

  describe :reslots do
    let(:parent) { create(:std_slot_friends) }
    let!(:reslots) { create_list(:re_slot, 3, parent: parent) }

    it "returns an array of the reslots of this slot" do
      res = parent.re_slots
      expect(res.size).to be 3
      expect(res).to include reslots.first
    end
  end

  describe :re_slots_count do
    let(:parent) { create(:std_slot_foaf) }
    let!(:reslots) { create_list(:re_slot, 3, parent: parent) }

    it "returns the number of reslots for this slot" do
      expect(parent.re_slots_count).to eq 3
    end

    it "ignores deleted reslots" do
      ReSlot.last.delete
      parent.reload
      expect(parent.re_slots_count).to eq 2
    end
  end
end
