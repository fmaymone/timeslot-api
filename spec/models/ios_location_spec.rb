require 'rails_helper'

RSpec.describe IosLocation, type: :model do
  let(:ios_location) { build(:ios_location) }

  subject { ios_location }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:street) }
  it { is_expected.to respond_to(:city) }
  it { is_expected.to respond_to(:postcode) }
  it { is_expected.to respond_to(:country) }
  it { is_expected.to respond_to(:latitude) }
  it { is_expected.to respond_to(:longitude) }
  it { is_expected.to respond_to(:auid) }
  it { is_expected.to respond_to(:private_location) }
  it { is_expected.to have_one(:meta_slot) }
  it { is_expected.to belong_to(:creator) }

  it { is_expected.to be_valid }

  describe "when creator is not present" do
    before { ios_location.creator = nil }
    it { is_expected.to_not be_valid }
  end
end
