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
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to belong_to(:owner).inverse_of(:std_slots) }
  it { is_expected.to belong_to(:meta_slot) }

  it { is_expected.to be_valid }

  describe "when MetaSlot is not present" do
    before { std_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe :alerts do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot) }
    let!(:slot_setting) {
      create(:slot_setting, user: user, meta_slot: meta_slot, alerts: '0000011111') }
    let(:std_slot) { create(:std_slot, owner: user, meta_slot: meta_slot) }

    it "returns the alarm for a specific slot representation" do
      expect(std_slot.alerts(user)).to eq slot_setting.alerts
    end
  end
end
