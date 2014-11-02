require 'rails_helper'

RSpec.describe MembershipState, type: :model do
  let(:membership_state) { build(:membership_state) }

  subject { membership_state }

  it { is_expected.to respond_to(:membership) }
  it { is_expected.to respond_to(:state) }
  it { should belong_to(:membership).inverse_of(:membership_states) }

  it { is_expected.to be_valid }

  describe "when membership is not present" do
    before { membership_state.membership = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when state is not present" do
    before { membership_state.state = "" }
    it { is_expected.to_not be_valid }
  end
end
