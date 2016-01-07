require 'rails_helper'

RSpec.describe ReSlot, type: :model do
  let(:re_slot) { build(:re_slot) }

  subject { re_slot }

  it { is_expected.to respond_to(:predecessor) }
  it { is_expected.to respond_to(:slotter) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to belong_to(:meta_slot) }
  it { is_expected.to belong_to(:predecessor) }
  it { is_expected.to belong_to(:slotter) }
  it { is_expected.to belong_to(:parent) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }

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

  describe "when predecessor is not present" do
    before { re_slot.predecessor = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when slotter is not present" do
    before { re_slot.slotter = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when parent is not present" do
    before { re_slot.parent = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when meta_slot is not present" do
    before { re_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "unprivate scope" do
    let(:user) { create(:user) }
    let!(:privat_slot) { create(:re_slot_private, slotter: user) }
    let!(:friend_slot) { create(:re_slot_friends, slotter: user) }
    let!(:foaf_slot) { create(:re_slot_foaf, slotter: user) }
    # let!(:public_slot) { create(:re_slot_public, owner: user) }
    let!(:public_slot) { create(:re_slot, slotter: user) }

    it "returns all non-private slots" do
      result = user.re_slots.unprivate.ids

      expect(result).to include public_slot.id
      expect(result).to include friend_slot.id
      expect(result).to include foaf_slot.id
      expect(result).not_to include privat_slot.id
    end
  end

  describe "create_from_slot" do
    let(:pred) { create(:std_slot_public) }
    let(:user) { create(:user) }

    it "creates a new ReSlotPrivate" do
      expect {
        described_class.create_from_slot(predecessor: pred,
                                         slotter: user,
                                         visibility: 'private')
      }.to change(ReSlotPrivate, :count).by 1
    end

    it "creates a new ReSlotFriends" do
      expect {
        described_class.create_from_slot(predecessor: pred,
                                         slotter: user,
                                         visibility: 'friends')
      }.to change(ReSlotFriends, :count).by 1
    end

    it "creates a new ReSlotFoaf" do
      expect {
        described_class.create_from_slot(predecessor: pred,
                                         slotter: user,
                                         visibility: 'foaf')
      }.to change(ReSlotFoaf, :count).by 1
    end

    it "creates a new RelotPublic" do
      expect {
        described_class.create_from_slot(predecessor: pred,
                                         slotter: user,
                                         visibility: 'public')
      }.to change(ReSlotPublic, :count).by 1
    end

    context "existing reslot" do
      let!(:reslot) { create(:re_slot, slotter: user, predecessor: pred) }

      it "updates the visibility" do
        expect(reslot.visibility).to eq "public"

        described_class.create_from_slot(predecessor: pred,
                                           slotter: user,
                                           visibility: 'friends')
        reslot.reload
        expect(reslot.visibility).to eq "friends"
      end
    end
  end

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot, title: "Timeslot") }
    let(:re_slot) { create(:re_slot, meta_slot: meta_slot) }

    it "contains title of the meta_slot" do
      expect(re_slot.start_date).to eq meta_slot.start_date
      expect(re_slot.title).to eq "Timeslot"
    end
  end

  describe "parent attributes" do
    let(:std_slot) { create(:std_slot_public, :with_media, :with_notes) }
    let(:re_slot_1) { create(:re_slot, predecessor: std_slot,
                             meta_slot: std_slot.meta_slot, parent: std_slot) }
    let(:re_slot_2) { create(:re_slot, predecessor: re_slot_1,
                             meta_slot: std_slot.meta_slot, parent: std_slot) }

    it "contains the same media items and notes as the parent slot" do
      expect(re_slot_1.notes).to eq std_slot.notes
      expect(re_slot_1.media_items).to eq std_slot.media_items
      expect(re_slot_1.images).to eq std_slot.images
      expect(re_slot_1.audios).to eq std_slot.audios
      expect(re_slot_1.videos).to eq std_slot.videos
      expect(re_slot_2.notes).to eq std_slot.notes
      expect(re_slot_2.media_items).to eq std_slot.media_items
      expect(re_slot_2.images).to eq std_slot.images
      expect(re_slot_2.audios).to eq std_slot.audios
      expect(re_slot_2.videos).to eq std_slot.videos
    end
  end

  describe :re_slots_count do
    let(:parent) { create(:std_slot) }
    let!(:reslots) { create_list(:re_slot, 3, parent: parent) }

    it "reslot returns the number of reslots of the parent slot" do
      expect(reslots.first.re_slots_count).to eq 3
    end
  end

  describe :delete do
    let(:group_slot) { create(:group_slot) }
    let(:re_slot_1) { create(:re_slot, predecessor: group_slot,
                             meta_slot: group_slot.meta_slot) }
    let(:re_slot_2) { create(:re_slot, predecessor: re_slot_1,
                             meta_slot: group_slot.meta_slot) }
    let!(:re_slot_3) { create(:re_slot, predecessor: re_slot_2,
                              meta_slot: group_slot.meta_slot) }

    it "updates the successors predecessor" do
      # what happens if the original source of a reslot history gets deleted?
      re_slot_2.delete
      re_slot_3.reload
      expect(re_slot_3.predecessor.id).to eq re_slot_1.id
    end
  end
end
