require 'rails_helper'

RSpec.describe ReSlot, type: :model do
  let(:re_slot) { build(:re_slot) }

  subject { re_slot }

  it { is_expected.to respond_to(:predecessor) }
  it { is_expected.to respond_to(:predecessor_type) }
  it { is_expected.to respond_to(:slotter) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:startdate) }
  it { is_expected.to respond_to(:enddate) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to belong_to(:meta_slot) }
  it { is_expected.to belong_to(:predecessor) }
  it { is_expected.to belong_to(:slotter) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }

  it { is_expected.to be_valid }

  describe "when predecessor is not present" do
    before { re_slot.predecessor = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when predecessor_type is not present" do
    before { re_slot.predecessor_type = nil }
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
      expect(re_slot.startdate).to eq meta_slot.startdate
      expect(re_slot.title).to eq "Timeslot"
    end
  end
end
