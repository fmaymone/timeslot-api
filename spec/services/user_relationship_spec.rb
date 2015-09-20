require 'spec_helper'

RSpec.describe UserRelationship, type: :service do
  describe "determines relationship between 2 users" do
    # before(:each) { DatabaseCleaner.start }
    # after(:each) { DatabaseCleaner.clean }

    let(:user) { FactoryGirl.create(:user) }
    let(:friend) { FactoryGirl.create(:user) }
    let(:stranger) { FactoryGirl.create(:user) }

    context 'friends' do
      let!(:friendship) { FactoryGirl.create(:friendship, :established,
                                             user: user, friend: friend)
      }
      it "returns 'friend' if users are friends" do
        expect(described_class.call(user.id, friend.id)).to eq 'friend'
      end
    end

    it "returns 'himself' if both uses are the same" do
      expect(described_class.call(user.id, user.id)).to eq 'himself'
    end

    it "returns 'stranger' if users are not connected" do
      expect(described_class.call(user.id, stranger.id)).to eq 'stranger'
    end

    it "returns 'stranger' if no user_a" do
      expect(described_class.call(nil, user.id)).to eq 'stranger'
    end

    it "returns 'stranger' if no user_a" do
      expect(described_class.call(nil, user.id)).to eq 'stranger'
    end

    it "returns 'stranger' if both users are nil" do
      expect(described_class.call(nil, nil)).to eq 'stranger'
    end
  end
end
