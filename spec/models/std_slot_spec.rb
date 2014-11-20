require 'rails_helper'

RSpec.describe StdSlot, type: :model do
  let(:std_slot) { build(:std_slot) }

  subject { std_slot }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to respond_to(:note) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to belong_to(:user).inverse_of(:std_slots) }

  it { is_expected.to be_valid }

  describe "when user is not present" do
    before { std_slot.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when metaslot is not present" do
    before { std_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end
end
