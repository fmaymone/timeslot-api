require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:friendship) { build(:friendship) }

  subject { friendship }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:friend) }
  it { is_expected.to respond_to(:state) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:user).inverse_of(:friendships1) }
  it { is_expected.to belong_to(:friend).inverse_of(:friendships2) }

  it { is_expected.to be_valid }

  describe "when state is not present" do
    before { friendship.state = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when user is not present" do
    before { friendship.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when friend is not present" do
    before { friendship.friend = nil }
    it { is_expected.to_not be_valid }
  end
end
