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

  describe :activate do
    it "returns true" do
      expect(membership.activate).to be true
    end

    it "set membership state to 'active'" do
      membership.activate
      expect(membership.state).to eq "111"
    end
  end

  describe :active? do
    invalid_states = %w(000 001 100 110 011 101 010)

    it "returns true if membership state is 'active'" do
      membership.state = "111"
      expect(membership.active?).to be true
    end

    it "returns false if membership isn't 'active'" do
      invalid_states.each do |invalid_state|
        membership.state = invalid_state
        expect(membership.active?).to be false
      end
    end
  end

  describe :inactivate do
    it "returns true" do
      expect(membership.inactivate).to be true
    end

    it "set membership state to 'inactive'" do
      membership.inactivate
      expect(membership.state).to eq "000"
    end
  end

  describe :inactive? do
    invalid_states = %w(111 001 100 110 011 101 010)

    it "returns true if membership state is 'inactive'" do
      membership.state = "000"
      expect(membership.inactive?).to be true
    end

    it "returns false if membership isn't 'inactive'" do
      invalid_states.each do |invalid_state|
        membership.state = invalid_state
        expect(membership.inactive?).to be false
      end
    end
  end

  describe :invite do
    it "returns true" do
      expect(membership.invite).to be true
    end

    it "set membership state to 'invited'" do
      membership.invite
      expect(membership.state).to eq "011"
    end
  end

  describe :invited? do
    invalid_states = %w(000 001 010 100 110 101 111)

    it "returns true if state is 'invited'" do
      membership.state = '011'
      expect(membership.invited?).to be true
    end

    it "returns false if membership state isn't 'invited'" do
      invalid_states.each do |invalid_state|
        membership.state = invalid_state
        expect(membership.invited?).to be false
      end
    end
  end

  describe :refuse do
    it "returns true" do
      expect(membership.refuse).to be true
    end

    it "set membership state to 'refused'" do
      membership.refuse
      expect(membership.state).to eq "001"
    end
  end

  describe :refused? do
    invalid_states = %w(000 011 010 100 110 101 111)

    it "returns true if state is 'refused'" do
      membership.state = '001'
      expect(membership.refused?).to be true
    end

    it "returns false if membership state isn't 'refused'" do
      invalid_states.each do |invalid_state|
        membership.state = invalid_state
        expect(membership.refused?).to be false
      end
    end
  end

  describe :kick do
    it "returns true" do
      expect(membership.kick).to be true
    end

    it "set membership state to 'kicked'" do
      membership.kick
      expect(membership.state).to eq "010"
    end
  end

  describe :kicked? do
    invalid_states = %w(000 001 100 011 110 101 111)

    it "returns true if state is 'kicked'" do
      membership.state = '010'
      expect(membership.kicked?).to be true
    end

    it "returns false if membership state isn't 'kicked'" do
      invalid_states.each do |invalid_state|
        membership.state = invalid_state
        expect(membership.kicked?).to be false
      end
    end
  end
end
