require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) { build(:note) }

  subject { note }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:deleted_at) }
  it { is_expected.to respond_to(:creator_id) }
  it { is_expected.to belong_to(:slot).inverse_of(:notes) }
  it { is_expected.to belong_to(:creator).class_name(:User) }

  it { is_expected.to be_valid }

  describe "when Slot is not present" do
    before { note.slot = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when title is not present" do
    before { note.title = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when creator_id is missing" do
    before { note.creator_id = nil }
    it { is_expected.to_not be_valid }
  end

  describe :delete do
    it "sets deleted_at" do
      expect { note.delete }.to change(note, :deleted_at)
    end
  end
end
