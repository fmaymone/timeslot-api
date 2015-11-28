require 'rails_helper'

RSpec.describe GlobalSlot, type: :model do
  let(:global_slot) { build(:global_slot) }

  subject { global_slot }

  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:open_end) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to respond_to(:slot_type) }
  it { is_expected.to respond_to(:cuid) }
  it { is_expected.to respond_to(:duid) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:crawler_id) }
  it { is_expected.to belong_to(:meta_slot) }

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

  describe "create_slot" do
    let!(:meta_slot) { create(:meta_slot) }
    let(:user) { create(:user) }

    it "creates a new GlobalSlot" do
      skip 'no global slot create method yet'
      expect {
        described_class.create_slot(cuid: cuid, creator: user)
      }.to change(GlobalSlot, :count).by 1
    end
  end
end
