class AddShowSlotsInScheduleToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :show_slots_in_schedule, :bool, default: false, null: false
  end
end
