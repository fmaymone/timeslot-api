require 'rails_helper'

RSpec.describe Slot, type: :model do
  before do
    @slot = build(:slot)
  end

  subject { @slot }

  it { should respond_to(:visibility) }
  it { should respond_to(:alerts) }
  it { should respond_to(:baseslot) }
  # it { should respond_to(:reslots) }
  # it { should respond_to(:comments) }
  # it { should respond_to(:likes) }

  it { should be_valid }

end
