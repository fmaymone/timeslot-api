require 'rails_helper'

RSpec.describe Slot, type: :model do
  before do
    @slot = build(:slot)
  end

  subject { @slot }

  it { should respond_to(:visibility) }
  it { should respond_to(:alerts) }
  # it { should respond_to(:reslots) }
  # it { should respond_to(:comments) }
  # it { should respond_to(:likes) }
  it { should respond_to(:baseslot) }
  it { should belong_to(:baseslot).inverse_of(:slots) }

  it { should be_valid }

  describe 'when baseslot is not present' do
    before { @slot.baseslot = nil }
    it { should_not be_valid }
  end

  describe 'when visibility is not present' do
    before { @slot.visibility = '' }
    it { should_not be_valid }
  end

  describe 'when alerts is not present' do
    before { @slot.alerts = '' }
    it { should_not be_valid }
  end

end
