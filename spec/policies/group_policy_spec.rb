require 'rails_helper'

describe GroupPolicy do
  subject { described_class }

  let(:group) { create(:group) }

  permissions :index?, :create? do
    context "for a user aka existing current_user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end
  end

  permissions :update?, :destroy?, :related? do
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
  end

  permissions :destroy? do
    let(:user) { create(:user) }

    context "special group/calendar" do
      let(:my_public_slots_uuid) { user.slot_sets['my_public_slots_uuid'] }
      let(:group) { create(:group, owner: user, uuid: my_public_slots_uuid) }

      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "normal group/calendar" do
      let(:group) { create(:group, owner: user) }

      it "allows access" do
        expect(subject).to permit(user, group)
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
      let!(:membership) {
        create(:membership, :active, group: group, user: user)
      }
      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "group members can't invite" do
      let!(:membership) {
        create(:membership, :active, group: group, user: user)
      }
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end

  permissions :subscribe? do
    let(:user) { create(:user) }

    context "public group/slotgroup/calendar" do
      let(:group) { create(:group, public: true) }

      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "non-public group/slotgroup/calendar" do
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end

  permissions :kick? do
    let(:user) { create(:user) }

    context "current_user is active group member" do
      let!(:membership) {
        create(:membership, :active, group: group, user: user)
      }
      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "current_user is invited to group" do
      let!(:membership) {
        create(:membership, :invited, group: group, user: user)
      }
      it "allows access" do
        expect(subject).to permit(user, group)
      end
    end

    context "current_user is non active group member" do
      let!(:membership) {
        create(:membership, :inactive, group: group, user: user)
      }
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end

    context "current_user not related to group" do
      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end

  permissions :show?, :leave?, :slots?, :dates?, :members?, :member_settings?,
              :add_slot?, :remove_slot?, :add_calendar_to_schedule?,
              :remove_calendar_from_schedule? do
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
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [
        :show?, :leave?, :slots?, :dates?, :members?, :member_settings?,
        :index?, :create?, :update?, :destroy?, :related?, :subscribe?,
        :invite?, :kick?, :accept_invite?, :refuse_invite?,
        :add_calendar_to_schedule?, :remove_calendar_from_schedule?
      ]
    }
    let(:user) { nil }

    it "raises MissingCurrentUserError" do
      permissions.each do |permission|
        expect {
          subject.new(user, group).public_send(permission)
        }.to raise_error TSErrors::MissingCurrentUserError
      end
    end
  end

  permissions :global_group? do
    let(:user) { create(:user) }

    context "group is public" do
      let(:group) { create(:group, public: true) }

      context "current_user is group owner" do
        let(:group) { create(:group, public: true, owner: user) }

        it "denies access" do
          expect(subject).not_to permit(user, group)
        end
      end

      context "global_slot category is group owner" do
        let(:group) {
          create(:group, public: true,
                 owner: create(:user, role: 'global_slot_category'))
        }
        it "allows access" do
          expect(subject).to permit(user, group)
        end
      end
    end

    context "group is not public" do
      let(:group) { create(:group, public: false) }

      it "denies access" do
        expect(subject).not_to permit(user, group)
      end
    end
  end
end
