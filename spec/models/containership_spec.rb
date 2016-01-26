require 'rails_helper'

RSpec.describe Containership, type: :model do
  let(:containership) { build(:containership) }

  subject { containership }

  it { is_expected.to respond_to(:slot) }
  it { is_expected.to respond_to(:group) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:slot).inverse_of(:containerships) }
  it { is_expected.to belong_to(:group).inverse_of(:containerships) }

  it { is_expected.to be_valid }

  describe "when group is not present" do
    before { containership.group = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when slot is not present" do
    before { containership.slot = nil }
    it { is_expected.to_not be_valid }
  end
end
