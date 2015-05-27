require "rails_helper"

RSpec.describe MetaSlot, type: :model do
  let(:meta_slot) { build(:meta_slot) }

  subject { meta_slot }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:creator) }
  it { is_expected.to respond_to(:location_id) }
  it { is_expected.to respond_to(:ios_location_id) }
  it { is_expected.to respond_to(:location) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to have_many(:slots).inverse_of(:meta_slot) }
  it { is_expected.to belong_to(:creator).inverse_of(:created_slots) }
  it { is_expected.to belong_to(:ios_location).inverse_of(:meta_slot) }

  it { is_expected.to be_valid }

  describe "when title is not present" do
    before { meta_slot.title = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when title is too long" do
    before { meta_slot.title = "a" * 49 }
    it { is_expected.to_not be_valid }
  end

  describe "when start_date is not present" do
    before { meta_slot.start_date = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when end_date is not present" do
    before { meta_slot.end_date = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when creator is not present" do
    before { meta_slot.creator = nil }
    it { is_expected.to_not be_valid }
  end

  describe :unregister do
    let(:meta_slot) { create(:meta_slot) }

    it "deletes itself if no other slot references it" do
      meta_slot.unregister
      expect(meta_slot.deleted_at?).to be true
    end

    it "doesn't delete itself if another slot references it" do
      create(:std_slot, meta_slot: meta_slot)
      meta_slot.unregister
      expect(meta_slot.deleted_at?).to be false
    end
  end

  describe "delete" do
    let!(:meta_slot) { create(:meta_slot) }

    it "sets deleted_at on the slot" do
      expect { meta_slot.delete }.to change(meta_slot, :deleted_at)
    end

    it "can not be destroyed" do
      before_count = described_class.count

      expect(Rails.logger).to receive(:error)
      expect {
        meta_slot.destroy
      }.to raise_error
      expect(before_count).to eq described_class.all.size
    end
  end

  describe "find_or_add" do
    let(:user) { create(:user) }

    context "non existing metaslot" do
      let(:meta_params) { attributes_for(:meta_slot) }

      it "creates a new MetaSlot" do
        expect {
          described_class.find_or_add(meta_params.merge(creator: user))
        }.to change(MetaSlot, :count).by 1
      end

      describe "ios_location" do
        let(:ios_location) { attributes_for(:ios_location) }
        before(:each) { meta_params.merge!(ios_location: ios_location) }

        context "with new ios_location" do
          it "creates a new MetaSlot" do
            expect {
              described_class.find_or_add(meta_params.merge(creator: user))
            }.to change(MetaSlot, :count).by 1
          end

          it "creates a new IosLocation" do
            expect {
              described_class.find_or_add(meta_params.merge(creator: user))
            }.to change(IosLocation, :count).by 1
          end
        end

        context "with existing ios_location (auid)" do
          let(:ios_location) { attributes_for(:ios_location, auid: 123) }
          let!(:existing_ios_loc) {
            create(:ios_location, auid: ios_location[:auid]) }

          it "creates a new MetaSlot" do
            expect {
              described_class.find_or_add(meta_params.merge(creator: user))
            }.to change(MetaSlot, :count).by 1
          end

          it "doesn't create a new IosLocation" do
            expect {
              described_class.find_or_add(meta_params.merge(creator: user))
            }.not_to change(IosLocation, :count)
          end

          it "returns the new metaslot with the correct ios location" do
            result = described_class.find_or_add(meta_params.merge(creator: user))
            expect(result.class).to eq described_class
            expect(result.errors.messages.empty?).to be true
            expect(result.ios_location_id).to eq existing_ios_loc.id
          end
        end

        context "with existing ios_location (latitude/longitude)" do
          let(:ios_location) do
            attributes_for(:ios_location,
                           latitude: 52.527335,
                           longitude: 13.414259)
          end
          let!(:existing_ios_loc) do
            create(:ios_location,
                   latitude: ios_location[:latitude],
                   longitude: ios_location[:longitude])
          end

          it "creates a new MetaSlot" do
            expect {
              described_class.find_or_add(meta_params.merge(creator: user))
            }.to change(MetaSlot, :count).by 1
          end

          it "doesn't create a new IosLocation" do
            expect {
              described_class.find_or_add(meta_params.merge(creator: user))
            }.not_to change(IosLocation, :count)
          end

          it "returns the new metaslot with the correct ios location" do
            result = described_class.find_or_add(meta_params.merge(creator: user))
            expect(result.class).to eq described_class
            expect(result.errors.messages.empty?).to be true
            expect(result.ios_location_id).to eq existing_ios_loc.id
          end
        end
      end
    end

    context "existing metaslot" do
      let!(:meta_params) { { meta_slot_id: create(:meta_slot).id } }

      it "doesn't create a new MetaSlot" do
        expect {
          described_class.find_or_add(meta_params)
        }.not_to change(MetaSlot, :count)
      end
    end
  end
end
