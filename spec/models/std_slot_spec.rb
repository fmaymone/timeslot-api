require 'rails_helper'

RSpec.describe StdSlot, type: :model do
  let(:std_slot) { build(:std_slot) }

  subject { std_slot }

  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to respond_to(:note) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:startdate) }
  it { is_expected.to respond_to(:enddate) }
  it { is_expected.to respond_to(:slot_setting) }
  it { is_expected.to belong_to(:slot_setting) }

  it { is_expected.to be_valid }

  describe "when SlotSetting is not present" do
    before { std_slot.slot_setting = nil }
    it { is_expected.to_not be_valid }
  end

  describe "inheritance" do
    let!(:std_slot) { create(:std_slot, footest: "hola") }

    it "adds inherited columns to the base slot also" do
      base_slot_entry = BaseSlot.last
      std_slot_entry = StdSlot.last
      expect(base_slot_entry.footest).to eq "hola"
      expect(std_slot_entry.footest).to eq "hola"
      expect(std_slot_entry.id).to eq base_slot_entry.id
    end
  end
end
