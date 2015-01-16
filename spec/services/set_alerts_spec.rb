require 'rails_helper'

RSpec.describe SetAlerts, type: :service do
  let(:user) { FactoryGirl.create(:user) }
  let(:slot) { FactoryGirl.create(:std_slot, owner: user) }

  describe :call do
    describe "no existing SlotSetting" do
      it "returns the SlotSetting object" do
        expect(SetAlerts.call(slot, user, '1100110011')).to eq SlotSetting.last
      end

      it "it creates a new slot_setting object" do
        expect {
          SetAlerts.call(slot, user, '0101010101')
        }.to change(SlotSetting, :count).by 1
      end
    end

    describe "existing SlotSetting" do
      let(:slot_setting) {
        FactoryGirl.create(:slot_setting, meta_slot: slot.meta_slot, user: user)
      }
      it "what should happen here?" do
        skip "needs specification"
        expect {
          SetAlerts.call(slot, user, '1010101010')
        }.to change(SlotSetting, :count).by 1
      end
    end
  end
end
