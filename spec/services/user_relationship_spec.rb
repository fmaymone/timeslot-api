require 'rails_helper'

RSpec.describe UserRelationship, type: :service do
  describe "determines relationship between 2 users" do
    let(:user) { create(:user) }
    let(:friend) { create(:user) }
    let(:stranger) { create(:user) }
    let(:foaf) { create(:user) }

    context 'friends' do
      let!(:friendship) do
        create(:friendship, :established,
               user: user, friend: friend)
      end
      it "returns 'friend' if users are friends" do
        expect(described_class.call(user.id, friend.id)).to eq FRIEND
      end
    end

    context 'friend-of-a-friend' do
      let!(:friendships) do
        create(:friendship, :established,
               user: user, friend: friend)
        create(:friendship, :established,
               user: foaf, friend: friend)
      end
      it "returns 'foaf' if users have common friends" do
        expect(described_class.call(user.id, foaf.id)).to eq FOAF
      end
    end

    it "returns 'himself' if both uses are the same" do
      expect(described_class.call(user.id, user.id)).to eq ME
    end

    it "returns 'stranger' if users are not connected" do
      expect(described_class.call(user.id, stranger.id)).to eq STRANGER
    end

    it "returns 'visitor' if no user_a" do
      expect(described_class.call(nil, user.id)).to eq VISITOR
    end

    it "returns 'visitor' if no user_a" do
      expect(described_class.call(nil, user.id)).to eq VISITOR
    end

    it "raises error if both users are nil" do
      expect { described_class.call(nil, nil) }.to raise_error ArgumentError
    end
  end
end
