require 'rails_helper'

RSpec.describe BaseSlot, type: :model do
  let(:base_slot) { build(:base_slot) }

  subject { base_slot }

  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }
  it { is_expected.to belong_to(:meta_slot) }
  it { is_expected.to have_many(:notes).inverse_of(:base_slot) }

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
      expect(re_slot.startdate).to eq meta_slot.startdate
      expect(re_slot.title).to eq "Timeslot"
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

  describe :delete do
    let(:base_slot) { create(:base_slot, :with_media) }

    it "sets deleted_at on itself" do
      expect(base_slot.deleted_at?).to be false
      base_slot.delete
      expect(base_slot.deleted_at?).to be true
    end

    it "invalidates belonging media_items" do
      base_slot.delete
      expect(base_slot.media_items.first.deleted_at?).to be true
      expect(base_slot.media_items.last.deleted_at?).to be true
    end
  end
end
