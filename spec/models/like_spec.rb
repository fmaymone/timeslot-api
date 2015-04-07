require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { build(:like) }

  subject { like }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:slot) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:slot).inverse_of(:likes) }

  it { is_expected.to be_valid }

  describe "when user is not present" do
    before { like.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when slot is not present" do
    before { like.slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe :delete do
    it "sets deleted_at" do
      expect { like.delete }.to change(like, :deleted_at)
    end
  end
end
