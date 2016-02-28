require 'rails_helper'

RSpec.describe GlobalSlot, type: :model do
  let(:global_slot) { build(:global_slot) }

  subject { global_slot }

  it { is_expected.to respond_to(:slot_type) }
  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:open_end) }
  it { is_expected.to respond_to(:muid) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:images) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:meta_slot) }
  it { is_expected.to have_many(:media_items) }

  it { is_expected.to respond_to(:followers) }
  it { is_expected.to respond_to(:followings) }
  it { is_expected.to respond_to(:follow) }
  it { is_expected.to respond_to(:unfollow) }
  it { is_expected.to respond_to(:add_follower) }
  it { is_expected.to respond_to(:remove_follower) }
  it { is_expected.to respond_to(:follows?) }
  it { is_expected.to respond_to(:following?) }
  it { is_expected.to respond_to(:followed_by?) }
  it { is_expected.to respond_to(:followers_count) }
  it { is_expected.to respond_to(:followings_count) }

  it { is_expected.to be_valid }

  describe "when MetaSlot is not present" do
    before { global_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "visibility" do
    it "has public visibility" do
      expect(described_class.visibility).to eq 'public'
    end
  end

  # describe :re_slots do
  #   let(:parent) { build(:global_slot) }
  #   let!(:reslots) { build_stubbed_list(:re_slot, 3, parent: parent) }

  #   it "returns an array of the reslots of this slot" do
  #     res = parent.re_slots
  #     expect(res.size).to be 3
  #     expect(res).to include reslots.first
  #   end
  # end

  describe "create_slot", :seed do
    let(:user) { User.find_by(role: 2, username: 'dfb.de') }
    let(:meta_params) { attributes_for(:meta_slot) }
    let(:muid) { "e8fa3c76-75ac-852b-c81d-9c02b5f27c05" }

    context "mandatory fields" do
      it "creates a new GlobalSlot" do
        expect {
          described_class.create_slot(meta: meta_params, muid: muid, user: user)
        }.to change(GlobalSlot, :count).by 1
        expect(GlobalSlot.last.creator).to eq user
      end
    end

    context "additional information", :vcr do
      let(:meta_params) { attributes_for(:meta_slot, :with_candy_location) }
      let(:url) { 'http://irgendwas.com' }
      let(:image) {
        {
          public_id: "http://assets.dfb.de/public/uploads/c46d542ef57d003",
          media_type: 'image'
        }}
      let(:description) {
        { title: 'Description',
          content: "Champions League, 2015/2016, Gruppe A" }
      }

      it "creates a new GlobalSlot with url and location_muid" do
        global_slot = described_class.create_slot(meta: meta_params,
                                                  muid: muid,
                                                  url: url,
                                                  user: user)
        expect(GlobalSlot.count).to eq 1
        expect(global_slot.url).to eq url
        expect(global_slot.location_uid).not_to be nil
      end

      it "creates a new GlobalSlot with a note with the description" do
        global_slot = described_class.create_slot(meta: meta_params,
                                                  muid: muid,
                                                  notes: [description],
                                                  user: user)
        expect(global_slot.notes).not_to be_empty
        note = global_slot.notes.first
        expect(note.title).to eq 'Description'
        expect(note.content).to eq description[:content]
        expect(note.creator).to eq user
      end

      it "creates a new GlobalSlot with an imag" do
        global_slot = described_class.create_slot(meta: meta_params,
                                                  muid: muid,
                                                  media: [image],
                                                  user: user)
        expect(global_slot.images).not_to be_empty
        image = global_slot.images.first
        expect(image.public_id).to eq image[:public_id]
        expect(image.creator).to eq user
      end
    end
  end

  describe "find_or_create", :seed do
    context "existing global slot" do
      let!(:global_slot) { create(:global_slot) }

      it "doesn't create a new global slot" do
        expect {
          described_class.find_or_create(global_slot.muid)
        }.not_to change(GlobalSlot, :count)
      end

      it "returns the global slot" do
        result = described_class.find_or_create(global_slot.muid)
        expect(result).to be_an_instance_of GlobalSlot
      end
    end

    context "missing global slot, valid 'muid'", :vcr do
      context "valid 'muid'" do
        let(:muid) { attributes_for(:global_slot)[:muid] }

        it "creates a new global slot" do
          expect {
            described_class.find_or_create(muid)
          }.to change(GlobalSlot, :count).by 1
        end

        it "returns the global slot" do
          result = described_class.find_or_create(muid)
          expect(result).to be_an_instance_of GlobalSlot
        end
      end

      context "unknown muid" do
        let(:unknown_muid) { '238a69a4-271c-f5cb-e60e-48952d805855' }

        it "raises NotFound error if uuid is not found" do
          expect {
            described_class.find_or_create(unknown_muid)
          }.to raise_error ActiveRecord::RecordNotFound
        end
      end

      context "invalid muid" do
        let(:invalid_muid) { 'foo-bar-muid' }

        it "raises error if uuid format is invalid" do
          expect {
            described_class.find_or_create(invalid_muid)
          }.to raise_error TSErrors::DataTeamServiceError
        end
      end
    end
  end
end
