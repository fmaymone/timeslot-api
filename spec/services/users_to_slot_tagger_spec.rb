require 'rails_helper'

RSpec.describe UsersToSlotTagger, type: :service do
  let(:tagger) do
    described_class.new(slot)
  end
  let(:slot) { create(:std_slot_public) }
  let(:users) { create_list(:user, 3) }
  let(:user_ids) { users.collect(&:id) }

  describe "tag users to slot", :focus do
    context "no existing passengership" do
      it "creates passengerships" do
        expect {
          tagger.tag(user_ids)
        }.to change(Passengership, :count).by users.size
        expect(slot.tagged_user_ids).to eq user_ids
      end

      it "passengerships have add_media_permission" do
        tagger.tag(user_ids)
        expect(Passengership.last.add_media_permission?).to be true
      end

      # it "sends a notification to the tagged users" do
      #   tagger.tag(user_ids)
      #   expect(Passengership.last.add_media_permission?).to be true
      # end
    end

    context "existing passengership" do
      let!(:passengership) {
        create(:passengership, slot: slot, user: users.first)
      }

      it "does only create missing passengerships" do
        expect {
          tagger.tag(user_ids)
        }.to change(Passengership, :count).by users.size-1
        expect(slot.tagged_user_ids).to eq user_ids
      end

      it "sets add_media_permission" do
        tagger.tag(user_ids)
        expect(Passengership.last.add_media_permission?).to be true
        passengership.reload
        expect(passengership.add_media_permission?).to be true
      end

      # it "sends a notification to the tagged users" do
      #   tagger.tag(user_ids)
      #   expect(Passengership.last.add_media_permission?).to be true
      # end
    end
  end
end
