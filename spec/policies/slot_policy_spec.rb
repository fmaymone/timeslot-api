require 'rails_helper'

describe SlotPolicy do
  subject { described_class }

  let(:slot) { create(:std_slot) }

  permissions :show?, :show_many?, :share_url? do
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

  permissions :share_data? do
    # TODO: how do we want to validate this? have a user for the webview app?
    true
  end
end
