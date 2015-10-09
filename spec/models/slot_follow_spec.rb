# require 'rails_helper'
#
# RSpec.describe SlotChannel, :focus, type: :model do
#
#   #let(:slot) { create(:slot) }
#   #let(:user) { create(:user) }
#   let(:channel) { build(:slot_channel,
#                         slot: build(:std_slot_public),
#                         follower: build(:user)) }
#   subject { channel }
#
#   it { is_expected.to respond_to(:slot) }
#   it { is_expected.to respond_to(:follower) }
#   it { is_expected.to respond_to(:created_at) }
#   it { is_expected.to respond_to(:updated_at) }
#   it { is_expected.to respond_to(:deleted_at) }
#   #it { is_expected.to belong_to(:user) }
#   #it { is_expected.to belong_to(:slot).inverse_of(:channel) }
#
#   it { is_expected.to be_valid }
#
#   # describe "when user is not present" do
#   #   before { comment.user = nil }
#   #   it { is_expected.to_not be_valid }
#   # end
#   #
#   # describe "when slot is not present" do
#   #   before { comment.slot = nil }
#   #   it { is_expected.to_not be_valid }
#   # end
#   #
#   # describe "when content is not present" do
#   #   before { comment.content = "" }
#   #   it { is_expected.to_not be_valid }
#   # end
#   #
#   # describe :delete do
#   #   it "sets deleted_at" do
#   #     expect { comment.delete }.to change(comment, :deleted_at)
#   #   end
#   # end
# end
