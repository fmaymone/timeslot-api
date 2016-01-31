require 'rails_helper'

RSpec.describe Passengership, type: :model do
  let(:passengership) { build(:passengership) }

  subject { passengership }

  it { is_expected.to respond_to(:slot) }
  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to belong_to(:slot).inverse_of(:passengerships) }
  it { is_expected.to belong_to(:user).inverse_of(:passengerships) }

  it { is_expected.to be_valid }

  describe "when user is not present" do
    before { passengership.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when slot is not present" do
    before { passengership.slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "delete" do
    let(:passengership) { create(:passengership) }

    it "sets deleted_at on the passengership" do
      subject.delete
      expect(subject.deleted_at?).to be true
    end

    it "touches the slot of the deleted passengership" do
      expect {
        subject.delete
      }.to change(subject.slot, :updated_at)
    end

    it "touches the user of the deleted passengership" do
      expect {
        subject.delete
      }.to change(subject.user, :updated_at)
    end
  end
end
