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

  describe "create_with_meta" do
    let(:meta_param) { attributes_for(:meta_slot) }
    let(:std_param) { attributes_for(:std_slot) }
    let(:note_param) {
      [ActionController::Parameters.new(attributes_for(:note))] }
    let(:alert_param) { attributes_for(:slot_setting)[:alerts] }
    let(:user) { create(:user) }

    it "creates a new StdSlot" do
      expect {
        described_class.create_with_meta(meta_param, std_param, user)
      }.to change(StdSlot, :count).by 1
    end

    it "creates a new MetaSlot" do
      expect {
        described_class.create_with_meta(meta_param, std_param, user)
      }.to change(MetaSlot, :count).by 1
    end

    it "creates a new Note" do
      expect {
        described_class.create_with_meta(meta_param, std_param, note_param, user)
      }.to change(Note, :count).by 1
    end

    it "creates a new SlotSetting" do
      expect {
        described_class.create_with_meta(meta_param, std_param, note_param,
                                         alert_param, user)
      }.to change(SlotSetting, :count).by 1
    end

    context "existing metaslot" do
      let!(:meta_param) { { 'meta_slot_id' => create(:meta_slot).id } }

      it "doesn't create a new MetaSlot" do
        expect {
          described_class.create_with_meta(meta_param, std_param, user)
        }.not_to change(MetaSlot, :count)
      end
    end
  end

  describe :delete do
    let(:slot) { create(:std_slot, :with_media, :with_notes) }

    it "sets deleted_at on itself" do
      expect(slot.deleted_at?).to be false
      slot.delete
      expect(slot.deleted_at?).to be true
    end

    it "invalidates belonging media_items" do
      slot.delete
      expect(slot.media_items.first.deleted_at?).to be true
      expect(slot.media_items.last.deleted_at?).to be true
    end

    it "deletes belonging notes" do
      slot.delete
      expect(slot.notes.first.deleted_at?).to be true
      expect(slot.notes.last.deleted_at?).to be true
    end
  end
end
