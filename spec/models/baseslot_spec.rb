require 'rails_helper'

RSpec.describe Baseslot, :type => :model do
  before do
    @baseslot = build(:baseslot)
  end

  subject { @baseslot }

  it { should respond_to(:title) }
  it { should respond_to(:startdate) }
  it { should respond_to(:enddate) }

  it { should be_valid }
end
