require 'rails_helper'

describe SlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :share_data? do
    context "for a user with role 'webview'" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot) }
      before { user.webview! }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "for a user" do
      let(:user) { create(:user) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  permissions :unlike? do
    let(:user) { create(:user) }
    let!(:like) { create(:like, slot: slot) }

    context "for the like creator" do
      let!(:like) { create(:like, user: user, slot: slot) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "for a user" do
      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  permissions :add_comment?, :show_comments?, :reslot_history? do
    context "own private slot" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot_private, owner: user) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  permissions :show?, :show_likes?, :copy?, :share_url? do
    context "own private slot" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot_private, owner: user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end
  end

  permissions :create_reslot? do
    context "ReSlot" do
      let(:user) { create(:user) }
      let(:slot) { create(:re_slot) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end
  end

  permissions :show?, :show_many?, :show_comments?, :show_likes?, :share_url? do
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

  permissions :add_comment?, :copy?, :reslot_history?, :create_reslot? do
    context "for a visitor" do
      let(:user) { nil }

      context "public slot" do
        let(:slot) { create(:std_slot_public) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end
    end
  end

  permissions :show?, :show_many?, :show_likes?, :show_comments?, :share_url?,
              :reslot_history?, :add_like?, :add_comment?, :copy?,
              :create_reslot? do
    context "std_slot" do
      context "for a user" do
        let(:user) { create(:user) }

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

        context "others private slot" do
          it "denies access" do
            expect(subject).not_to permit(user, slot)
          end
        end
      end

      context "for a visitor" do
        let(:user) { nil }

        context "friend slot" do
          let(:slot) { create(:std_slot_friends) }

          it "denies access" do
            expect(subject).not_to permit(user, slot)
          end
        end

        context "private slot" do
          it "denies access" do
            expect(subject).not_to permit(user, slot)
          end
        end
      end
    end

    context "group_slot" do
      let(:slot) { create(:group_slot) }

      context "for a user" do
        let(:user) { create(:user) }

        it "allows access if user is group member" do
          create(:membership, :active, group: slot.group, user: user)
          expect(subject).to permit(user, slot)
        end

        it "denies access if user not group member" do
          expect(subject).not_to permit(user, slot)
        end
      end

      context "for a visitor" do
        let(:user) { nil }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
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

        it "denies access if target is private_slots" do
          skip 'limit copy-to targets to increasing visibility'
          expect(subject).not_to permit(user, slot)
        end
      end
    end

    context "own public slot" do
      let(:slot) { create(:std_slot_public, owner: user) }
      let(:user) { create(:user) }

      # should a public stdslot be allowed to be moved to a public group?
      # visibility would stay the same...
      it "denies access" do
        skip 'limit copy-to targets to increasing visibility'
        expect(subject).not_to permit(user, slot)
      end
    end

    context "group_slot" do
      let(:slot) { create(:group_slot) }

      context "for a user" do
        let(:user) { create(:user) }

        it "denies access, even if user is group member" do
          create(:membership, :active, group: slot.group, user: user)
          expect(subject).not_to permit(user, slot)
        end
      end

      context "for a visitor" do
        let(:user) { nil }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end
    end

    context "for a visitor" do
      let(:slot) { create(:std_slot_public) }
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end
end
