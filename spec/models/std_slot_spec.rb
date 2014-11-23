require 'rails_helper'

RSpec.describe StdSlot, type: :model do
  let(:std_slot) { build(:std_slot) }

  subject { std_slot }

  it { is_expected.to respond_to(:visibility) }
  it { is_expected.to respond_to(:note) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:startdate) }
  it { is_expected.to respond_to(:meta_slot) }
  it { is_expected.to belong_to(:meta_slot) }

  it { is_expected.to be_valid }

  describe "when metaslot is not present" do
    before { std_slot.meta_slot = nil }
    it { is_expected.to_not be_valid }
  end
end
