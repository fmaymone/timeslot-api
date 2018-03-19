require 'rails_helper'

RSpec.describe HighFive, type: :model do
  let(:high_five) { build(:high_five) }

  subject { like }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:slot) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:slot).inverse_of(:high_fives) }

  it { is_expected.to be_valid }

  describe "when user is not present" do
    before { high_five.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when slot is not present" do
    before { high_five.slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe :delete do
    it "sets deleted_at" do
      expect { high_five.delete }.to change(high_five, :deleted_at)
    end
  end
end
