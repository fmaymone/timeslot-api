require 'rails_helper'

RSpec.describe Connect, type: :model do
  context "with database seeds", :seed do
    let(:connect) { build(:connect, provider: Provider.first) }

    subject { connect }

    it { is_expected.to respond_to(:social_id) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:provider) }

    it { is_expected.to be_valid }

    describe "when user is not present" do
      before { connect.user = nil }
      it { is_expected.to_not be_valid }
    end

    describe "when provider is not present" do
      before { connect.provider = nil }
      it { is_expected.to_not be_valid }
    end
  end
end
