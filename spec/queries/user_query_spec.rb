require 'rails_helper'

RSpec.describe UserQuery::Relationship, type: :query do
  describe "common_friends" do
    let(:user) { create(:user) }
    let!(:stranger) { create(:user) }
    let!(:friends) do
      friends = create_list(:user, 3)
      friends.each do |friend|
        create(:friendship, :established, user: user, friend: friend)
      end
      friends
    end

    it "returns all friends of user" do
      friends_query = UserQuery::Relationship.new(user.id)
      friends = friends_query.my_friends.to_a

      expect(friends).to include friends.first
      expect(friends).to include friends.last
      expect(friends.size).to eq friends.size
      expect(friends.size).to eq 3
      expect(friends).not_to include stranger
    end
  end

  describe "common_friends" do
    let(:user) { create(:user) }
    let(:other) { create(:user) }
    let!(:common_friends) do
      friends = create_list(:user, 3)
      friends.each do |friend|
        create(:friendship, :established, user: user, friend: friend)
        create(:friendship, :established, user: other, friend: friend)
      end
      friends
    end
    let!(:friend_of_user) do
      users_friend = create(:user)
      create(:friendship, :established, user: user, friend: users_friend)
      users_friend
    end
    let!(:friend_of_other) do
      others_friend = create(:user)
      create(:friendship, :established, user: other, friend: others_friend)
      others_friend
    end
    let!(:friend_of_user_2) do
      users_friend = create(:user)
      create(:friendship, :established, user: user, friend: users_friend)
      create(:friendship, :rejected, user: other, friend: users_friend)
      users_friend
    end
    let!(:friend_of_other_2) do
      others_friend = create(:user)
      create(:friendship, :established, user: other, friend: others_friend)
      create(:friendship, user: user, friend: others_friend)
      others_friend
    end

    it "returns all common friends of 2 users" do
      friends_query = UserQuery::Relationship.new(user.id, other.id)
      friends = friends_query.common_friends.to_a

      expect(friends).to include common_friends.first
      expect(friends).to include common_friends.last
      expect(friends.size).to eq common_friends.size
      expect(friends.size).to eq 3
    end

    it "doesn't return users which are only friend with one of the users" do
      friends_query = UserQuery::Relationship.new(user.id, other.id)
      friends = friends_query.common_friends.to_a

      expect(friends).not_to include friend_of_user
      expect(friends).not_to include friend_of_other
      expect(friends).not_to include friend_of_user_2
      expect(friends).not_to include friend_of_other_2
    end
  end
end
