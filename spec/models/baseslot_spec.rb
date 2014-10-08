require 'rails_helper'

RSpec.describe Baseslot, type: :model do
  before do
    @baseslot = build(:baseslot)
  end

  subject { @baseslot }

  it { should respond_to(:title) }
  it { should respond_to(:startdate) }
  it { should respond_to(:enddate) }
  it { should respond_to(:slots) }
  it { should have_many(:slots).inverse_of(:baseslot) }

  it { should be_valid }

  describe 'when title is not present' do
    before { @baseslot.title = '' }
    it { should_not be_valid }
  end

  describe 'when title is too long' do
    before { @baseslot.title = 'a' * 49 }
    it { should_not be_valid }
  end

  describe 'when startdate is not present' do
    before { @baseslot.startdate = '' }
    it { should_not be_valid }
  end

  describe 'when enddate is not present' do
    before { @baseslot.enddate = '' }
    it { should_not be_valid }
  end

end
