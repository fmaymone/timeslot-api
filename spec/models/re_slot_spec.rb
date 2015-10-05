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
  it { is_expected.to belong_to(:meta_slot) }
  it { is_expected.to belong_to(:predecessor) }
  it { is_expected.to belong_to(:slotter) }
  it { is_expected.to belong_to(:parent) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }

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

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot, title: "Timeslot") }
    let(:slot_setting) { create(:slot_setting, meta_slot: meta_slot) }
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

  describe :reslot_count do
    let(:parent) { create(:std_slot) }
    let!(:reslots) { create_list(:re_slot, 3, parent: parent) }

    it "reslot returns the number of reslots of the parent slot" do
      expect(reslots.first.reslot_count).to eq 3
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
