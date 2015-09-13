require 'rails_helper'

RSpec.describe Comment, type: :model do
    let(:comment) { build(:comment) }

    subject { comment }

    it { is_expected.to respond_to(:slot) }
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
    it { is_expected.to respond_to(:deleted_at) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:slot).inverse_of(:comments) }

    it { is_expected.to be_valid }

    describe "when user is not present" do
      before { comment.user = nil }
      it { is_expected.to_not be_valid }
    end

    describe "when slot is not present" do
      before { comment.slot = nil }
      it { is_expected.to_not be_valid }
    end

    describe "when content is not present" do
      before { comment.content = "" }
      it { is_expected.to_not be_valid }
    end

    describe :delete do
      it "sets deleted_at" do
        expect { comment.delete }.to change(comment, :deleted_at)
      end
    end
  end
