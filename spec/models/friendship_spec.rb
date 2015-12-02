require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:friendship) { build(:friendship) }

  subject { friendship }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:friend) }
  it { is_expected.to respond_to(:state) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:user).inverse_of(:initiated_friendships) }
  it { is_expected.to belong_to(:friend).inverse_of(:received_friendships) }

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

  describe "prevent friendship with itself" do
    let(:john) { create(:user, username: "John") }

    it "doesn't add friendship with itself" do
      expect {
        Friendship.create(user: john, friend: john)
      }.to raise_error Friendship::DuplicateEntry
    end
  end

  describe :inactivate do
    let(:friendship) { create(:friendship, friend: create(:user)) }

    it "preserves the friendship state" do
      expect { friendship.inactivate }.not_to change(friendship, :state)
    end

    it "notifies the friend about a change" do
      expect { friendship.inactivate }.to change(friendship.friend, :updated_at)
    end
  end

  describe :activate do
    let(:friendship) {
      create(:friendship, friend: create(:user, deleted_at: Time.zone.now))
    }
    it "only undeletes friendships to active friends" do
      expect { friendship.activate }.not_to change(friendship, :deleted_at)
    end
  end

  describe :humanize do
    let(:friendship) {
      create(:friendship, :established, friend: create(:user)) }
    let(:resultValues) {
      [{'00' => 'pending'}, {'11' => 'friend'}, {'01' => 'stranger'}] }

    it "maps friendship state to string or nil" do
      resultValues.each do |res|
        friendship.state = res.keys[0]
        expect(friendship.humanize).to eq res.values[0]
      end
    end

    context "pending" do
      let(:initiator) { create(:user, username: "Initiator") }
      let(:receiver) { create(:user, username: "Receiver") }
      let(:friendship) {
        create(:friendship, user: initiator, friend: receiver) }

      it "returns pending active' for the initiator" do
        expect(friendship.state).to eq OFFERED
        expect(friendship.humanize(initiator)).to eq 'pending active'
      end

      it "returns pending passive' for the receiver" do
        expect(friendship.state).to eq OFFERED
        expect(friendship.humanize(receiver)).to eq 'pending passive'
      end
    end
  end
end
