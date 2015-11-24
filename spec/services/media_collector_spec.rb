require 'rails_helper'

RSpec.describe MediaCollector, type: :service do
  describe "collect all media_items the current_user is allowed to see" do
    let(:collector) do
      described_class.new(current_user: current_user, other_user: target_user)
    end
    let(:current_user) { create(:user) }
    let(:target_user) { create(:user) }

    let!(:slot_public) {
      create(:std_slot_public, :with_media,
             owner: target_user, creator: target_user) }
    let!(:slot_foaf) {
      create(:std_slot_foaf, :with_media,
             owner: target_user, creator: target_user) }
    let!(:slot_friend) {
      create(:std_slot_friends, :with_media,
             owner: target_user, creator: target_user) }
    let!(:slot_private) {
      create(:std_slot_private, :with_media,
             owner: target_user, creator: target_user) }

    context "for ME" do
      let(:target_user) { current_user }

      it "returns all media items of the current_user" do
        result = collector.retrieve
        expect(result.length).to eq(24)
        expect(result).to include slot_public.media_items.first
        expect(result).to include slot_foaf.media_items.first
        expect(result).to include slot_friend.media_items.first
        expect(result).to include slot_private.media_items.first
      end
    end

    context "for FRIEND" do
      let!(:friend) do
        create(:friendship, :established,
               user: current_user, friend: target_user)
        target_user
      end

      it "returns all friend-, foaf-and public-visible media items of friend" do
        result = collector.retrieve
        expect(result.length).to eq(18)
        expect(result).to include slot_public.media_items.first
        expect(result).to include slot_foaf.media_items.first
        expect(result).to include slot_friend.media_items.first
        expect(result).not_to include slot_private.media_items.first
      end

      describe "if friendship ends" do
        it "returns no friend-related media items anymore" do
          result = collector.retrieve
          expect(result.length).to eq(18)
          expect(result).to include slot_friend.media_items.first
          expect(result).to include slot_foaf.media_items.first

          current_user.remove_friends([friend.id])
          result = collector.retrieve
          expect(result.length).to eq(6)
          expect(result).not_to include slot_friend.media_items.first
          expect(result).not_to include slot_foaf.media_items.first
        end
      end

      describe "if friendship was rejected" do
        it "returns no friend-related media items anymore" do
          result = collector.retrieve
          expect(result.length).to eq(18)
          expect(result).to include slot_friend.media_items.first
          expect(result).to include slot_foaf.media_items.first

          current_user.friendship(friend.id).reject
          result = collector.retrieve
          expect(result.length).to eq(6)
          expect(result).not_to include slot_friend.media_items.first
          expect(result).not_to include slot_foaf.media_items.first
        end
      end
    end

    context "for FOAF" do
      let(:friend) { create(:user) }
      let!(:foaf) do
        create(:friendship, :established, user: current_user, friend: friend)
        create(:friendship, :established, user: target_user, friend: friend)
      end

      it "returns all foaf- and public-visible media items of foaf" do
        result = collector.retrieve
        expect(result.length).to eq(12)
        expect(result).to include slot_public.media_items.first
        expect(result).to include slot_foaf.media_items.first
        expect(result).not_to include slot_friend.media_items.first
        expect(result).not_to include slot_private.media_items.first
      end

      describe "if one friendship ends" do
        it "returns no foaf-related media items anymore" do
          result = collector.retrieve
          expect(result.length).to eq(12)
          expect(result).to include slot_foaf.media_items.first

          current_user.remove_friends([friend.id])
          result = collector.retrieve
          expect(result.length).to eq(6)
          expect(result).not_to include slot_foaf.media_items.first
        end
      end

      describe "if one friendship was rejected" do
        it "returns no foaf-related media items anymore" do
          result = collector.retrieve
          expect(result.length).to eq(12)
          expect(result).to include slot_foaf.media_items.first

          current_user.friendship(friend.id).reject
          result = collector.retrieve
          expect(result.length).to eq(6)
          expect(result).not_to include slot_foaf.media_items.first
        end
      end
    end

    context "common/shared group" do
      let!(:group_slot) {
        create(:group_slot, :with_media, creator: target_user) }
      let!(:group_slot_from_third) {
        create(:group_slot, :with_media, group: group_slot.group) }
      let!(:memberships) do
        [create(:membership, :active,
                group: group_slot.group, user: current_user),
         create(:membership, :active,
                group: group_slot.group, user: target_user)]
      end

      it "returns all media items which the other user has added to" \
         " a common group" do
        result = collector.retrieve
        expect(result).to include group_slot.media_items.first
        expect(result.length).to eq(12)
      end

      it "doesn't return media items which another user has added to" \
         " the common group" do
        result = collector.retrieve
        expect(result).not_to include group_slot_from_third.media_items.first
        expect(result.length).to eq(12)
      end

      describe "user has left group" do
        it "doesn't return media_items from this group anymore" do
          result = collector.retrieve
          expect(result.length).to eq(12)
          expect(result).to include group_slot.media_items.first

          current_user.leave_group(group_slot.group.id)
          result = collector.retrieve
          expect(result.length).to eq(6)
          expect(result).not_to include group_slot.media_items.first
        end
      end

      describe "membership inactive" do
        it "doesn't return media_items from this group anymore" do
          result = collector.retrieve
          expect(result.length).to eq(12)
          expect(result).to include group_slot.media_items.first

          memberships.first.leave
          result = collector.retrieve
          expect(result.length).to eq(6)
          expect(result).not_to include group_slot.media_items.first
        end
      end
    end

    context "for STRANGER" do
      it "returns all public media items of the stranger" do
        result = collector.retrieve
        expect(result.length).to eq(6)
      end
    end

    context "for VISITOR" do
      it "returns all public media items of the stranger" do
        result = collector.retrieve
        expect(result.length).to eq(6)
      end
    end
  end
end
