require 'rails_helper'

RSpec.describe CalendarInScheduleManager, type: :service do
  let(:manager) do
    described_class.new(current_user)
  end
  let(:current_user) { create(:user) }
  let(:calendar) { create(:group) }
  let!(:membership) {
    create(:membership, :active, group: calendar, user: current_user) }
  let!(:slot_ids) do
    containerships = create_list(:containership, 3, group: calendar)
    containerships.collect(&:slot_id)
  end

  describe "show calendar in schedule" do
    context "no existing passengership" do
      it "creates passengerships" do
        expect {
          manager.show(calendar)
        }.to change(Passengership, :count).by calendar.slots.count
        membership.reload
        expect(membership.show_slots_in_schedule).to be true
      end

      it "passengerships are set to show_in_my_schedule" do
        manager.show(calendar)
        expect(Passengership.last.show_in_my_schedule).to be true
      end
    end

    context "existing passengership" do
      let!(:passengership) {
        create(:passengership, slot_id: slot_ids.first, user: current_user)
      }

      it "does only create missing passengerships" do
        expect {
          manager.show(calendar)
        }.to change(Passengership, :count).by(slot_ids.size - 1)
      end

      it "sets show_in_my_schedule" do
        manager.show(calendar)
        passengership.reload
        expect(passengership.show_in_my_schedule).to be true
      end
    end
  end
end
