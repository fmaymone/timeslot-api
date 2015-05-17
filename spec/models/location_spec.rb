require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { described_class.first }

  subject { location }

  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:longitude) }

  it { is_expected.to be_valid }
end
