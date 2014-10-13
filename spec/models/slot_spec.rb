require "rails_helper"

RSpec.describe Slot, type: :model do
  let(:slot) { build(:slot) }

  subject { slot }

  it { should respond_to(:title) }
  it { should respond_to(:startdate) }
  it { should respond_to(:enddate) }
  it { should respond_to(:note) }
  it { should respond_to(:visibility) }
  it { should respond_to(:alerts) }

  it { should be_valid }

  describe "when title is not present" do
    before { slot.title = "" }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { slot.title = "a" * 49 }
    it { should_not be_valid }
  end

  describe "when startdate is not present" do
    before { slot.startdate = "" }
    it { should_not be_valid }
  end

  describe "when enddate is not present" do
    before { slot.enddate = "" }
    it { should_not be_valid }
  end

  describe "when note is not present" do
    before { slot.note = nil }
    it { should be_valid }
  end

  describe "when note is too long" do
    before { slot.note = "a" * 501 }
    it { should_not be_valid }
  end

  describe "when visibility is not present" do
    before { slot.visibility = "" }
    it { should_not be_valid }
  end

  describe "when alerts is not present" do
    before { slot.alerts = "" }
    it { should_not be_valid }
  end
end
