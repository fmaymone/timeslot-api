require 'rails_helper'

describe SlotPolicy do
  subject { described_class }

  permissions :tag_users? do
    let(:user) { create(:user) }

    context "slot creator" do
      let(:slot) { create(:std_slot_public, creator: user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "not slot creator" do
      let(:slot) { create(:std_slot_public) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  permissions :show?, :show_comments?, :show_likes? do
    context "for a visitor" do
      let(:user) { nil }

      context "public slot" do
        let(:slot) { create(:std_slot_public) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end
    end
  end

  permissions :show?, :show_likes?, :show_comments?, :unlike?, :slotsets?,
              :add_like?, :add_comment?, :show_slotters?,
              :remove_from_groups?, :show_tagged_users? do

    let(:user) { create(:user) }

    context "std_slot" do
      context "public slot" do
        let(:slot) { create(:std_slot_public) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "foaf slot if slot owner is friend" do
        let(:slot) { create(:std_slot_foaf) }

        it "allows access" do
          create(:friendship, :established, user: user, friend: slot.creator)
          expect(subject).to permit(user, slot)
        end
      end

      context "foaf slot if slot owner has common friends" do
        let(:slot) { create(:std_slot_foaf) }
        let(:friend) { create(:user) }

        it "allows access" do
          create(:friendship, :established, user: user, friend: friend)
          create(:friendship, :established, user: friend, friend: slot.creator)
          expect(subject).to permit(user, slot)
        end
      end

      context "foaf slot if slot owner isn't friend & has no common friends" do
        let(:slot) { create(:std_slot_foaf) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end

      context "friend slot if slot owner is friend" do
        let(:slot) { create(:std_slot_friends) }

        it "allows access" do
          create(:friendship, :established, user: user, friend: slot.creator)
          expect(subject).to permit(user, slot)
        end
      end

      context "friend slot if slot owner is not friend" do
        let(:slot) { create(:std_slot_friends) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end

      context "own private slot" do
        let(:slot) { create(:std_slot_private, owner: user, creator: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "others private slot" do
        let(:slot) { create(:std_slot_private) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end
    end

    context "slot groups" do
      let(:group) { create(:group) }
      let(:slot) do
        slot = create(:std_slot_private)
        create(:containership, slot: slot, group: group)
        slot
      end

      context "for a user" do
        let(:user) { create(:user) }

        it "allows access if user is slotgroup member" do
          create(:membership, :active, group: group, user: user)
          expect(subject).to permit(user, slot)
        end

        it "denies access if user not group member" do
          expect(subject).not_to permit(user, slot)
        end
      end
    end
  end

  permissions :show?, :show_likes?, :show_comments? do
    context "for a visitor" do
      let(:user) { nil }

      context "public slot" do
        let(:slot) { create(:std_slot_public) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end
    end
  end

  describe 'public std_slot for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [:slotsets?, :add_like?, :add_comment?,
       :unlike?, :tag_users?, :show_slotters?, :show_tagged_users?
      ]
    }
    let(:user) { nil }
    let(:slot) { create(:std_slot_public) }

    it "raises MissingCurrentUserError" do
      permissions.each do |permission|
        expect {
          subject.new(user, slot).public_send(permission)
        }.to raise_error TSErrors::MissingCurrentUserError
      end
    end
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [
        :show?, :show_likes?, :show_comments?, :slotsets?,
        :add_like?, :add_comment?,
        :unlike?, :tag_users?, :show_slotters?, :show_tagged_users?
      ]
    }
    let(:user) { nil }

    context "std_slot_foaf" do
      let(:slot) { create(:std_slot_foaf) }

      it "raises MissingCurrentUserError" do
        permissions.each do |permission|
          expect {
            subject.new(user, slot).public_send(permission)
          }.to raise_error TSErrors::MissingCurrentUserError
        end
      end
    end

    context "friend slot" do
      let(:slot) { create(:std_slot_friends) }

      it "raises MissingCurrentUserError" do
        permissions.each do |permission|
          expect {
            subject.new(user, slot).public_send(permission)
          }.to raise_error TSErrors::MissingCurrentUserError
        end
      end
    end

    context "private slot" do
      let(:slot) { create(:std_slot_friends) }

      it "raises MissingCurrentUserError" do
        permissions.each do |permission|
          expect {
            subject.new(user, slot).public_send(permission)
          }.to raise_error TSErrors::MissingCurrentUserError
        end
      end
    end
  end

  permissions :add_to_groups? do
    let(:user) { create(:user) }

    context "globalslot" do
      let(:slot) { create(:global_slot) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "own std_slots" do
      context "public slot" do
        let(:slot) { create(:std_slot_public, owner: user, creator: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "foaf-visible slot" do
        let(:slot) { create(:std_slot_foaf, owner: user, creator: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "friend-visible slot" do
        let(:slot) { create(:std_slot_friends, owner: user, creator: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "private slot" do
        let(:slot) { create(:std_slot_private, owner: user, creator: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end
    end

    context "other users std_slots" do
      context "public slot" do
        let(:slot) { create(:std_slot_public) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "foaf-visible slot" do
        let(:slot) { create(:std_slot_foaf) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end

      context "friend-visible slot" do
        let(:slot) { create(:std_slot_friends) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end

      context "private slot" do
        let(:slot) { create(:std_slot_private) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end
    end
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [:create?]
    }
    let(:user) { nil }
    let(:slot) { create(:std_slot_private) }

    it "raises MissingCurrentUserError" do
      permissions.each do |permission|
        expect {
          subject.new(user, slot).public_send(permission)
        }.to raise_error TSErrors::MissingCurrentUserError
      end
    end
  end
end
