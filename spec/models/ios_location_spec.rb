require 'rails_helper'

RSpec.describe IosLocation, type: :model do
  let(:ios_location) { build(:ios_location) }

  subject { ios_location }

  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:uuid) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.not_to respond_to(:street) }
  it { is_expected.to respond_to(:thoroughfare) }
  it { is_expected.to respond_to(:sub_thoroughfare) }
  it { is_expected.to respond_to(:locality) }
  it { is_expected.to respond_to(:sub_locality) }
  it { is_expected.to respond_to(:administrative_area) }
  it { is_expected.to respond_to(:sub_administrative_area) }
  it { is_expected.to respond_to(:postal_code) }
  it { is_expected.to respond_to(:country) }
  it { is_expected.to respond_to(:iso_country_code) }
  it { is_expected.to respond_to(:in_land_water) }
  it { is_expected.to respond_to(:ocean) }
  it { is_expected.to respond_to(:areas_of_interest) }
  it { is_expected.to respond_to(:latitude) }
  it { is_expected.to respond_to(:longitude) }
  it { is_expected.to respond_to(:private_location) }
  it { is_expected.to belong_to(:creator) }

  it { is_expected.to be_valid }

  describe "when creator is not present" do
    before { ios_location.creator = nil }
    it { is_expected.to_not be_valid }
  end
end
