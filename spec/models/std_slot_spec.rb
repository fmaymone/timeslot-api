require 'rails_helper'

RSpec.describe StdSlot, type: :model do
  let(:std_slot) { build(:std_slot) }

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
  it { is_expected.to belong_to(:owner).inverse_of(:std_slots) }
  it { is_expected.to belong_to(:meta_slot) }

  it { is_expected.to be_valid }

  describe "when MetaSlot is not present" do
    before { std_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
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
      expect(meta_slot.errors.messages).to have_key(:visibility)
      expect(meta_slot.errors.messages[:visibility][0]).to eq("invalid slot visibility")
    end

    it "does not create a new StdSlot if visibility is empty" do
      expect {
        described_class.create_slot(meta_slot: meta_slot, visibility: '',
                                    user: user)
      }.not_to change(StdSlotPublic, :count)
      expect(meta_slot.errors.messages).to have_key(:visibility)
      expect(meta_slot.errors.messages[:visibility][0]).to eq("invalid slot visibility")
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

  describe :delete do
    let(:slot) { create(:std_slot) }

    it "sets deleted_at on itself" do
      expect(slot.deleted_at?).to be false
      slot.delete
      expect(slot.deleted_at?).to be true
    end

    context "media" do
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
      let(:slot) { create(:std_slot_private, :with_likes) }

      it "deletes belonging likes" do
        slot.delete
        expect(slot.likes.first.deleted_at?).to be true
        expect(slot.likes.last.deleted_at?).to be true
      end
    end
  end
end
