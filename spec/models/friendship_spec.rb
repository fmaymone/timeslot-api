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

  describe "prevent duplicates" do
    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let!(:existing_friendship) {
      create(:friendship, user: john, friend: mary)
    }
    it "doesn't add duplicate friendships" do
      expect {
        Friendship.create(user: mary, friend: john)
      }.to raise_error Friendship::DuplicateEntry
    end
  end

  describe :delete do
    let(:friendship) { create(:friendship, friend: create(:user)) }

    it "preserves the friendship state" do
      expect { friendship.delete }.not_to change(friendship, :state)
    end

    it "notifies the friend about a change" do
      expect { friendship.delete }.to change(friendship.friend, :updated_at)
    end
  end

  describe :undelete do
    let(:friendship) {
      create(:friendship, friend: create(:user, deleted_at: Time.zone.now))
    }
    it "only undeletes friendships to active friends" do
      expect { friendship.undelete }.not_to change(friendship, :deleted_at)
    end
  end
end
