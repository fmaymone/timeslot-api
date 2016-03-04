require 'rails_helper'

RSpec.describe SlotsetManager, type: :service do
  let(:manager) do
    described_class.new(current_user: current_user)
  end
  let(:current_user) { create(:user) }
  let(:slot) { create(:std_slot_public) }
  let(:slot_group) { create(:group, owner: current_user) }
  let(:deleted_slot_group) {
    create(:group, owner: current_user, deleted_at: Time.zone.now) }
  let(:my_calendar) { current_user.slot_sets['my_cal_uuid'] }

  describe "add to slotset" do
    context "my Schedule (myCalendar)" do
      let(:target_user) { current_user }

      it "adds the slot" do
        manager.add!(slot, my_calendar)
        expect(current_user.my_calendar_slots).to include slot
      end

      it "doesn't raise exception when adding same slot again" do
        manager.add!(slot, my_calendar)
        expect {
          manager.add!(slot, my_calendar)
        }.not_to raise_error
      end
    end

    context "normal slotgroup" do
      it "adds the slot" do
        manager.add!(slot, slot_group)
        expect(slot_group.slots).to include slot
      end

      it "doesn't raise exception when adding same slot again" do
        manager.add!(slot, slot_group)
        expect {
          manager.add!(slot, slot_group)
        }.not_to raise_error
      end

      it "raises GroupDeleted exception if slotgroup is deleted" do
        expect {
          manager.add!(slot, deleted_slot_group)
        }.to raise_error TSErrors::SlotGroupDeleted
      end

      it "creates a new containership" do
        expect {
          manager.add!(slot, slot_group)
        }.to change(Containership, :count).by 1
      end

      it "adds the slot to a given group" do
        manager.add!(slot, slot_group)
        expect(slot_group.slots).to include slot
      end

      it "adds the group to the given slot" do
        manager.add!(slot, slot_group)
        expect(slot.slot_groups).to include slot_group
      end

      context "existing deleted containership" do
        let(:containership) { create(:containership, slot: slot,
                                     group: slot_group,
                                     deleted_at: Time.zone.now) }

        it "unsets deleted at" do
          expect(containership.deleted_at?).to be true
          manager.add!(slot, slot_group)
          containership.reload
          expect(containership.deleted_at?).to be false
        end
      end
    end
  end

  describe "remove from slotset" do
    context "my Schedule (myCalendar)" do
      let!(:passengership) {
        create(:passengership, slot: slot, user: current_user) }

      it "removes the slot" do
        expect(current_user.my_calendar_slots).to include slot
        manager.remove!(slot, my_calendar)
        expect(current_user.my_calendar_slots).not_to include slot
      end

      it "doesn't raise exception when removing same slot again" do
        manager.remove!(slot, my_calendar)
        expect {
          manager.remove!(slot, my_calendar)
        }.not_to raise_error
      end
    end

    context "normal slotgroup" do
      let!(:containership) {
        create(:containership, slot: slot, group: slot_group) }

      it "removes the slot" do
        expect(slot_group.slots).to include slot
        manager.remove!(slot, slot_group)
        expect(slot_group.slots).not_to include slot
      end

      it "doesn't raise exception when removing same slot again" do
        manager.remove!(slot, slot_group)
        expect {
          manager.remove!(slot, slot_group)
        }.not_to raise_error
      end

      it "doesn't remove the containership from the database" do
        expect {
          manager.remove!(slot, slot_group)
        }.not_to change(Containership, :count)
      end

      it "sets deleted_at on the containership" do
        expect(containership.deleted_at?).to be false
        manager.remove!(slot, slot_group)
        containership.reload
        expect(containership.deleted_at?).to be true
      end

      it "removes the slot from the given group" do
        expect(slot_group.slots).to include slot
        manager.remove!(slot, slot_group)
        expect(slot_group.slots).not_to include slot
      end

      it "removes the group from the given slot" do
        expect(slot.slot_groups).to include slot_group
        manager.remove!(slot, slot_group)
        expect(slot.slot_groups).not_to include slot_group
      end

      context "slotgroup does not contain slot" do
        let(:other_slot) { create(:std_slot_public) }

        it "does nothing, is idempotent" do
          expect(slot_group.slots).not_to include other_slot
          expect {
            manager.remove!(other_slot, slot_group)
          }.not_to raise_error
        end
      end

      context "existing deleted containership" do
        let(:containership) {
          create(:containership, slot: slot, group: slot_group,
                 deleted_at: Time.zone.now) }

        it "does nothing, is idempotent" do
          expect(containership.deleted_at?).to be true
          manager.remove!(slot, slot_group)
          containership.reload
          expect(containership.deleted_at?).to be true
        end
      end
    end
  end
end
