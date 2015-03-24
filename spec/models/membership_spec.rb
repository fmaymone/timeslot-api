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
    let(:membership) { create(:membership, group: create(:group)) }

    it "returns true" do
      expect(membership.inactivate).to be true
    end

    it "set membership state to 'inactive'" do
      expect { membership.inactivate }.not_to change(membership, :state)
    end

    it "preserves the membership state" do
      expect {
        membership.delete
      }.to change(membership.user, :updated_at)
    end

    it "touches the group to mark a change" do
      expect { membership.inactivate }.to change(membership.group, :updated_at)
    end
  end

  describe :inactive? do
    let(:membership) { create(:membership, group: create(:group)) }

    it "returns true if membership state is 'inactive'" do
      membership.inactivate
      expect(membership.inactive?).to be true
    end

    it "returns false if membership is invalid" do
      membership.inactivate
      membership.state = '000'
      expect(membership.inactive?).to be false
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

  describe :leave do
    it "returns true" do
      expect(membership.leave).to be true
    end

    it "set membership state to 'left'" do
      membership.leave
      expect(membership.state).to eq "100"
    end
  end

  describe :left? do
    invalid_states = %w(111 001 000 110 011 101 010)

    it "returns true if membership state is 'left'" do
      membership.state = "100"
      expect(membership.left?).to be true
    end

    it "returns false if membership isn't 'left'" do
      invalid_states.each do |invalid_state|
        membership.state = invalid_state
        expect(membership.left?).to be false
      end
    end
  end

  describe :delete do
    let(:membership) { create(:membership, :active, user: create(:user)) }
    invalid_states = %w(111 001 100 110 011 101 010)

    it "sets deleted_at on the membership" do
      membership.delete
      expect(membership.deleted_at?).to be true
    end

    it "sets membership state to 000" do
      membership.delete
      expect(membership.state).to eq "000"
    end

    it "touches the user to mark a change" do
      expect { membership.delete }.to change(membership.user, :updated_at)
    end
  end

  describe :humanize do
    let(:membership) { create(:membership, :active, user: create(:user)) }
    let(:resultValues) { [ {'111' => 'active'}, {'011' => 'invited'},
        {'001' => 'refused'}, {'010' => 'kicked'}, {'100' => 'left'},
          {'000' => 'inactive'} ] }

    it "return membership state as a string" do
      resultValues.each do |res|
        membership.state = res.keys[0]
        result = membership.humanize
        expect(membership.humanize).to eq res.values[0]
      end
    end
  end
end
