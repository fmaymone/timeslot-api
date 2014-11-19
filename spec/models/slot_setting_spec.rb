require 'rails_helper'

RSpec.describe SlotSetting, type: :model do
  let(:slot_setting) { create(:slot_setting) }

  subject { slot_setting }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to respond_to(:alerts) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:user).inverse_of(:slot_settings) }
  it { is_expected.to belong_to(:meta_slot).inverse_of(:slot_settings) }

  it { is_expected.to be_valid }

  describe "when user is not present" do
    before { slot_setting.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when meta_slot is not present" do
    before { slot_setting.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "exists only once per user <> slot" do
    let(:user) { create(:user) }
    let(:meta_slot) { create(:meta_slot) }
    let!(:existing_slot_setting) {
      create(:slot_setting, user: user, meta_slot: meta_slot) }
    let(:duplicate_slot_setting) {
      build(:slot_setting, user: user, meta_slot: meta_slot) }

    it "can not be saved" do
      expect {
        duplicate_slot_setting.save
      }.to raise_error
    end
  end
end
