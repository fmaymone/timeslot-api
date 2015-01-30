require 'rails_helper'

describe GroupPolicy do
  subject { described_class }

  let(:group) { create(:group) }

  permissions :show?, :members?, :related? do
    context "for a visitor" do
      let(:user) { nil }

      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end
  end

  permissions :index?, :create? do
    context "for a user aka existing current_user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, group)
      end

      context "for a visitor" do
        let(:user) { nil }

        it "denies access" do
          expect(subject).not_to permit(user, group)
        end
      end
    end
  end

  permissions :update?, :destroy? do
    let(:user) { create(:user) }

    context "current_user is group owner" do
      let(:group) { create(:group, owner: user) }

      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "current_user not group owner" do
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end

  permissions :accept_invite?, :refuse_invite? do
    let(:user) { create(:user) }

    context "current_user is invited to group" do
      let!(:membership) {
        create(:membership, :invited, group: group, user: user)
      }
      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "current_user is not invited to group" do
      let!(:membership) {
        create(:membership, :refused, group: group, user: user)
      }
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end

  permissions :invite? do
    let(:user) { create(:user) }

    context "current_user is group owner" do
      let(:group) { create(:group, owner: user) }

      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "current_user not group owner" do
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "group members can invite" do
      let(:group) { create(:group, :members_can_invite) }

      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "group members can't invite" do
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end

  permissions :leave?, :kick? do
    let(:user) { create(:user) }

    context "current_user has group membership" do
      let!(:membership) {
        create(:membership, group: group, user: user)
      }
      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "current_user has no group membership" do
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end

  permissions :member_settings? do
    let(:user) { create(:user) }

    context "current_user is active group member" do
      let!(:membership) {
        create(:membership, :active, group: group, user: user)
      }
      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "current_user not active group member" do
      let!(:membership) {
        create(:membership, :refused, group: group, user: user)
      }
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "for a visitor" do
      let(:user) { nil }

      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end
end
