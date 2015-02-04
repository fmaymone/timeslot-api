require 'rails_helper'

describe SlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :show?, :show_many? do
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

  permissions :add_like? do
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

  permissions :get_likes? do
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

        context "own private slot" do
          let(:slot) { create(:std_slot, owner: user) }

          it "allows access" do
            expect(subject).to permit(user, slot)
          end
        end
      end

      context "for a visitor" do
        let(:user) { nil }

        context "public slot" do
          let(:slot) { create(:std_slot, :publicslot) }

          it "allows access" do
            expect(subject).to permit(user, slot)
          end
        end

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
