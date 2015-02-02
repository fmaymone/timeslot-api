require 'rails_helper'

RSpec.describe GroupSlot, type: :model do
  let(:group_slot) { build(:group_slot) }

  subject { group_slot }

  it { is_expected.to respond_to(:group) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to belong_to(:meta_slot) }
  it { is_expected.to belong_to(:group).inverse_of(:group_slots) }

  it { is_expected.to be_valid }

  describe "when group is not present" do
    before { group_slot.group = nil }
    it { is_expected.to_not be_valid }
  end

  describe "meta_slot attributes" do
    let(:meta_slot) { create(:meta_slot) }
    let(:group_slot) { create(:group_slot, meta_slot: meta_slot) }

    it "contains start_date of the meta_slot" do
      expect(group_slot.start_date).to eq meta_slot.start_date
    end
  end

  describe :delete do
    let(:group) { create(:group) }
    let(:group_slot) { create(:group_slot, group: group) }

    it "sets deleted_at" do
      expect { group_slot.delete }.to change(group_slot, :deleted_at)
    end

    it "notifies group about a change" do
      expect { group_slot.delete }.to change(group_slot.group, :updated_at)
    end
  end

  describe "create_with_meta" do
    let(:user) { create(:user) }
    let(:meta_param) { attributes_for(:meta_slot) }
    let(:group) { create(:group, owner: user) }
    let(:note_param) {
      [ActionController::Parameters.new(attributes_for(:note))] }
    let(:alert_param) { attributes_for(:slot_setting)[:alerts] }

    it "creates a new GroupSlot" do
      expect {
        described_class.create_with_meta(meta_param, group.id, user)
      }.to change(GroupSlot, :count).by 1
    end

    it "creates a new MetaSlot" do
      expect {
        described_class.create_with_meta(meta_param, group.id, user)
      }.to change(MetaSlot, :count).by 1
    end

    it "creates a new Note" do
      expect {
        described_class.create_with_meta(meta_param, group.id,
                                         note_param, user)
      }.to change(Note, :count).by 1
    end

    it "creates a new SlotSetting" do
      expect {
        described_class.create_with_meta(meta_param, group.id,
                                         note_param, alert_param, user)
      }.to change(SlotSetting, :count).by 1
    end

    context "existing metaslot" do
      let!(:meta_param) { { 'meta_slot_id' => create(:meta_slot).id } }

      it "doesn't create a new MetaSlot" do
        expect {
          described_class.create_with_meta(meta_param, group.id, user)
        }.not_to change(MetaSlot, :count)
      end
    end
  end
end
