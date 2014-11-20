require 'rails_helper'

RSpec.describe BaseSlot, type: :model do
  let(:base_slot) { build(:base_slot) }

  subject { base_slot }

  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }
  it { is_expected.to belong_to(:meta_slot).inverse_of(:base_slot) }

  it { is_expected.to be_valid }

  describe "when meta_slot is not present" do
    before { base_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end
end
