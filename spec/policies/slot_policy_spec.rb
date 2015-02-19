require 'rails_helper'

describe SlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :show_many? do
    context "for a visitor" do
      let(:user) { nil }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end
  end

  permissions :index?, :update_metaslot? do
    context "for a user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  permissions :update_metaslot? do
    context "for the slot creator" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot, creator: user) }

      it "allows access" do
        skip
        expect(subject).to permit(user, slot)
      end
    end

    context "for the slot owner" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot, owner: user) }

      it "denies access" do
        skip
        expect(subject).not_to permit(user, slot)
      end
    end

    context "for a user" do
      let(:user) { create(:user) }

      it "denies access" do
        skip
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

  permissions :show?, :show_likes?, :show_comments?, :copy?, :move?,
              :share_url?, :reslot_history? do
    context "own private slot" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot, owner: user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end
  end

  permissions :add_comment? do
    context "own private slot" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot, owner: user) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  permissions :show?, :show_comments?, :show_likes?, :share_url? do
    context "for a visitor" do
      let(:user) { nil }

      context "public slot" do
        let(:slot) { create(:std_slot, :publicslot) }

        it "allows access" do
          expect(subject).to permit(user, slot)
        end
      end
    end
  end

  permissions :add_comment?, :copy?, :move?, :reslot_history? do
    context "for a visitor" do
      let(:user) { nil }

      context "public slot" do
        let(:slot) { create(:std_slot, :publicslot) }

        it "denies access" do
          expect(subject).not_to permit(user, slot)
        end
      end
    end
  end

  permissions :show?, :show_likes?, :show_comments?, :share_url?, :reslot_history?,
              :add_like?, :add_comment?, :copy?, :move? do
    context "std_slot" do
      context "for a user" do
        let(:user) { create(:user) }

        context "public slot" do
          let(:slot) { create(:std_slot, :publicslot) }

          it "allows access" do
            expect(subject).to permit(user, slot)
          end
        end

        context "friend slot if slot owner is friend" do
          let(:slot) { create(:std_slot, :friendslot) }

          it "allows access" do
            skip "TODO: not yet implemented"
            create(:friendship, :established, user: user, friend: slot.owner)
            expect(subject).to permit(user, slot)
          end
        end

        context "friend slot if slot owner is not friend" do
          let(:slot) { create(:std_slot, :friendslot) }

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
          let(:slot) { create(:std_slot, :friendslot) }

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
end
