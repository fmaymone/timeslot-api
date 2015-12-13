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
  end
end
