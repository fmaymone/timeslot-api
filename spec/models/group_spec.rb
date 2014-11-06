require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }

  subject { group }

  it { is_expected.to respond_to(:owner) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:subs_can_post) }
  it { is_expected.to respond_to(:subs_can_invite) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:owner).inverse_of(:own_groups) }
  it { is_expected.to have_one(:image) }
  it { is_expected.to have_many(:members).through(:memberships) }
  it { is_expected.to have_many(:memberships).inverse_of(:group) }

  it { is_expected.to be_valid }

  describe "when owner is not present" do
    before { group.owner = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when name is not present" do
    before { group.name = "" }
    it { is_expected.to_not be_valid }
  end
end
