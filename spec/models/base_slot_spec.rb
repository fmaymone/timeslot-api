require 'rails_helper'

RSpec.describe BaseSlot, type: :model do
  let(:base_slot) { build(:slot) }

  subject { base_slot }

  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to respond_to(:photos) }
  it { is_expected.to respond_to(:voices) }
  it { is_expected.to respond_to(:videos) }
  it { is_expected.to have_many(:media_items) }
  it { is_expected.to belong_to(:meta_slot).inverse_of(:slots) }
  it { is_expected.to belong_to(:shared_by) }
  it { is_expected.to have_many(:notes).inverse_of(:slot) }
  it { is_expected.to have_many(:likes).inverse_of(:slot) }

  it { is_expected.to be_valid }

  describe "when MetaSlot is not present" do
    before { base_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot, title: "Timeslot") }
    let(:slot_setting) { create(:slot_setting, meta_slot: meta_slot) }
    let(:re_slot) { create(:re_slot, meta_slot: meta_slot) }

    it "contains title of the meta_slot" do
      expect(re_slot.start_date).to eq meta_slot.start_date
      expect(re_slot.title).to eq "Timeslot"
    end
  end

  describe :photos do
    let(:std_slot) { create(:std_slot) }
    let!(:media) {
      create_list :slot_image, 3, mediable: std_slot
      create_list :voice, 2, mediable: std_slot
      create_list :video, 2, mediable: std_slot
    }
    it "returns all slot media items of type image" do
      expect(std_slot.media_items.length).to eq 7
      expect(std_slot.photos.length).to eq 3
    end
  end

  describe :get do
    let(:std_slot) { create(:std_slot) }

    it "returns the specific slot representation" do
      result = BaseSlot.get(std_slot.id)
      expect(result.class).to eq StdSlot
    end

    it "fails with ActiveRecord::RecordNotFound if invalid ID" do
      expect { BaseSlot.get('foo') }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe :get_many do
    let(:std_slots) { create_list(:std_slot, 3) }
    let(:group_slots) { create_list(:group_slot, 2) }
    let(:other_slots) { create_list(:std_slot, 2) }

    it "returns a list of specific slots" do
      a = []
      [std_slots, group_slots].each {
        |slots| a << slots.collect(&:id)
      }
      result = BaseSlot.get_many(a.flatten)
      expect(result).to include(*std_slots)
      expect(result).to include(*group_slots)
      expect(result).not_to include(*other_slots)
    end
  end

  describe :add_media do
    let(:std_slot) { create(:std_slot) }
    let(:new_video) { attributes_for(:video) }

    it "adds a new media item to the slot" do
      std_slot.add_media(new_video)
      std_slot.reload
      expect(std_slot.videos.length).to eq 1
      expect(*std_slot.errors.messages.any?).to be false
    end

    it "doesn't add an invalid item" do
      new_video["public_id"] = ''
      std_slot.add_media(new_video)
      std_slot.reload
      expect(std_slot.videos.length).to eq 0
      expect(*std_slot.errors.messages.any?).to be true
      expect(std_slot.errors.messages).to have_key :video
      expect(*std_slot.errors.messages[:video]).to have_key :public_id
      expect(*std_slot.errors.messages[:video][0][:public_id]).to include "blank"
    end
  end

  describe :set_share_id do
    let(:std_slot) { create(:std_slot) }
    let(:user) { create(:user) }

    it "adds a share url to the slot" do
      std_slot.set_share_id(user)
      std_slot.reload
      expect(std_slot.share_id?).to be true
    end

    it "adds shared_by to the slot" do
      std_slot.set_share_id(user)
      std_slot.reload
      expect(std_slot.shared_by).to eq user
    end

    context "existing share url" do
      let(:std_slot) { create(:std_slot, share_id: '12345678') }

      it "doesn't overwrite an existing share url" do
        std_slot.set_share_id(user)
        std_slot.reload
        expect(std_slot.share_id).to eq '12345678'
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
end
