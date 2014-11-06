require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  subject { user }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to have_one(:image) }
  it { is_expected.to have_many(:own_groups).inverse_of(:owner) }
  it { is_expected.to have_many(:memberships).inverse_of(:user) }
  it { is_expected.to have_many(:groups).through(:memberships) }

  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { user.username = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do
    before { user.username = "a" * 21 }
    it { is_expected.to_not be_valid }
  end

  describe "auditing", :commit do
    let(:user) { create(:user) }

    it "logs instance changes" do
      # twice: once for creation, once for change
      expect(Rails.logger).to receive(:info).twice

      new_name = "name_#{user.id}"
      user.update(username: new_name)

      expect(user.username).to eq new_name
    end
  end
end
