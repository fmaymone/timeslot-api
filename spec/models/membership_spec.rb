require 'rails_helper'

RSpec.describe Membership, type: :model do
  let(:membership) { build(:membership) }

  subject { membership }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:group) }
  it { is_expected.to respond_to(:notifications) }
  it { is_expected.to respond_to(:state) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:user).inverse_of(:memberships) }
  it { is_expected.to belong_to(:group).inverse_of(:memberships) }

  it { is_expected.to be_valid }

  describe "when state is not present" do
    before { membership.state = "" }
    it { is_expected.to_not be_valid }
  end

  describe "when user is not present" do
    before { membership.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when group is not present" do
    before { membership.group = nil }
    it { is_expected.to_not be_valid }
  end
end
