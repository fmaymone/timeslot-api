require 'spec_helper'

RSpec.describe UserRelationship, type: :service do
  describe "determines relationship between 2 users" do
    let(:user) { FactoryGirl.create(:user) }
    let(:friend) { FactoryGirl.create(:user) }
    let(:stranger) { FactoryGirl.create(:user) }
    let(:foaf) { FactoryGirl.create(:user) }

    context 'friends' do
      let!(:friendship) { FactoryGirl.create(:friendship, :established,
                                             user: user, friend: friend)
      }
      it "returns 'friend' if users are friends" do
        expect(described_class.call(user.id, friend.id)).to eq FRIEND
      end
    end

    context 'friend-of-a-friend' do
      let!(:friendships) {
        FactoryGirl.create(:friendship, :established,
                           user: user, friend: friend)
        FactoryGirl.create(:friendship, :established,
                           user: foaf, friend: friend)
      }
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
