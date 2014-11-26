require 'rails_helper'

RSpec.describe BaseSlot, type: :model do
  let(:base_slot) { build(:base_slot) }

  subject { base_slot }

  it { is_expected.to respond_to(:footest) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:startdate) }
  it { is_expected.to respond_to(:enddate) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:creator) }
  it { is_expected.to respond_to(:media_items) }
  it { is_expected.to have_many(:media_items) }

  it { is_expected.to be_valid }
end
