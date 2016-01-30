require 'rails_helper'

describe StdSlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :create_stdslot? do
    context "for a user" do
      let(:user) { create(:user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end
  end

  permissions :update_stdslot?, :delete? do
    context "for the slot owner" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot, owner: user) }

      it "allows access" do
        expect(subject).to permit(user, slot)
      end
    end

    context "for the slot creator" do
      let(:user) { create(:user) }
      let(:slot) { create(:std_slot, creator: user) }

      it "fails with MissingCurrentUserError" do
        expect(subject).not_to permit(user, slot)
      end
    end

    context "for a user who is not slot owner" do
      let(:user) { create(:user) }

      it "denies access" do
        expect(subject).not_to permit(user, slot)
      end
    end
  end

  describe 'for a visitor / invalid or missing auth_token' do
    let(:permissions) {
      [:create_stdslot?, :update_stdslot?, :destroy_stdslot?]
    }
    let(:user) { nil }

    it "raises MissingCurrentUserError" do
      permissions.each do |permission|
        expect {
          subject.new(user, slot).public_send(permission)
        }.to raise_error TSErrors::MissingCurrentUserError
      end
    end
  end
end
