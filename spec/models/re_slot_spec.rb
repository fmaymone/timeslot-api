require 'rails_helper'

RSpec.describe ReSlot, type: :model do
  let(:re_slot) { build(:re_slot) }

  subject { re_slot }

  it { is_expected.to respond_to(:predecessor) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:startdate) }
  it { is_expected.to respond_to(:enddate) }
  it { is_expected.to respond_to(:slot_setting) }
  it { is_expected.to belong_to(:slot_setting) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }

  it { is_expected.to be_valid }

  describe "when predecessor is not present" do
    before { re_slot.predecessor = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when slot_setting is not present" do
    before { re_slot.slot_setting = nil }
    it { is_expected.to_not be_valid }
  end

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot, title: "Timeslot") }
    let(:slot_setting) { create(:slot_setting, meta_slot: meta_slot) }
    let(:re_slot) { create(:re_slot, slot_setting: slot_setting) }

    it "contains startdate of the meta_slot" do
      expect(re_slot.startdate).to eq slot_setting.startdate
      expect(re_slot.title).to eq "Timeslot"
    end
  end

  describe "inheritance" do
    let!(:re_slot) { create(:re_slot, footest: "hola") }

    it "adds inherited columns to the base slot also" do
      base_slot_entry = BaseSlot.last
      re_slot_entry = ReSlot.last
      expect(base_slot_entry.footest).to eq "hola"
      expect(re_slot_entry.footest).to eq "hola"
      expect(re_slot_entry.id).to eq base_slot_entry.id
    end
  end
end
