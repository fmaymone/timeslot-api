require 'rails_helper'

RSpec.describe UserFollow, type: :model do

  let(:user) { create(:user) }
  let(:follower) { create(:user) }
  let(:group) { create(:group) }
  let(:slot) { create(:std_slot_public) }

  # describe "when user is not present" do
  #   before { device.user = nil }
  #   it { is_expected.to_not be_valid }
  # end
  #
  # describe "when system is not present" do
  #   before { device.system = nil }
  #   it { is_expected.to_not be_valid }
  # end
  #
  # describe "when version is not present" do
  #   before { device.version = nil }
  #   it { is_expected.to_not be_valid }
  # end
  #
  # describe "when device_id is not present" do
  #   before { device.device_id = nil }
  #   it { is_expected.to_not be_valid }
  # end

  describe "User follows another user", :focus, :redis do
    user.add_follower(follower)

    it "User is subscribed" do
      expect(user.is_followed_by(follower)).to be true
      expect(user.followers).to include(follower)
    end

    it "User has followers" do
      expect(follower.is_following(user)).to be true
      expect(user.following).to include(follower)
      expect(user.following_count).to be(2)
    end
  end

  describe "User unfollows another user", :focus, :redis do

    it "User is subscribed" do
      user.add_follower(follower)
      expect(user.is_followed_by(follower)).to be true
      expect(user.followers).to include(follower)

      user.remove_follower(follower)
      expect(user.is_followed_by(follower)).to be false
      expect(user.followers).not_to include(follower)
    end

    it "User has followers" do
      user.add_follower(follower)
      expect(follower.is_following(user)).to be true
      expect(user.following).to include(follower)
      expect(user.following_count).to be(1)

      user.remove_follower(follower)
      expect(follower.is_following(user)).to be false
      expect(user.following).not_to include(follower)
      expect(user.following_count).to be(0)
    end
  end
end
