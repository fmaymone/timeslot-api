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

  permissions :show?, :show_likes?, :show_comments?, :unlike?,
              :add_like?, :copy?, :add_comment?,
              :remove_from_groups? do

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
          create(:friendship, :established, user: user, friend: slot.owner)
          expect(subject).to permit(user, slot)
        end
      end

      context "foaf slot if slot owner has common friends" do
        let(:slot) { create(:std_slot_foaf) }
        let(:friend) { create(:user) }

        it "allows access" do
          create(:friendship, :established, user: user, friend: friend)
          create(:friendship, :established, user: friend, friend: slot.owner)
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
          create(:friendship, :established, user: user, friend: slot.owner)
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
        let(:slot) { create(:std_slot_private, owner: user) }

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

  permissions :move? do
    context "own private slot" do
      let(:slot) { create(:std_slot_private, owner: user) }

      context "for a user" do
        let(:user) { create(:user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end
    end

    context "own friendslot" do
      let(:slot) { create(:std_slot_friends, owner: user) }

      context "for a user" do
        let(:user) { create(:user) }

        it "allows access if target is public_slots" do
          expect(subject).to permit(user, slot)
        end
      end
    end

    context "own public slot" do
      let(:slot) { create(:std_slot_public, owner: user) }
      let(:user) { create(:user) }

      # should a public stdslot be allowed to be moved to a public group?
      # visibility would stay the same...
      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    # context "group_slot" do
    #   let(:slot) { create(:group_slot) }

    #   context "for a user" do
    #     let(:user) { create(:user) }

    #     it "denies access, even if user is group member" do
    #       create(:membership, :active, group: slot.group, user: user)
    #       expect(subject).not_to permit(user, slot)
    #     end
    #   end
    # end
  end

  describe 'public std_slot for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [:add_like?, :add_comment?, :copy?,
       :move?, :unlike?, :tag_users?]
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
        :show?, :show_likes?, :show_comments?,
        :add_like?, :add_comment?, :copy?, :move?,
        :unlike?, :tag_users?
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

    # context "group_public" do
    #   let(:slot) { create(:group_slot) }

    #   it "raises MissingCurrentUserError" do
    #     permissions.each do |permission|
    #       expect {
    #         subject.new(user, slot).public_send(permission)
    #       }.to raise_error TSErrors::MissingCurrentUserError
    #     end
    #   end
    # end
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
        let(:slot) { create(:std_slot_public, owner: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "foaf-visible slot" do
        let(:slot) { create(:std_slot_foaf, owner: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "friend-visible slot" do
        let(:slot) { create(:std_slot_friends, owner: user) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end

      context "private slot" do
        let(:slot) { create(:std_slot_private, owner: user) }

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
