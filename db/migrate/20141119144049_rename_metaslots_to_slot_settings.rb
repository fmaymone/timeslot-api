class RenameMetaslotsToSlotSettings < ActiveRecord::Migration
  def change
    rename_table :meta_slots, :slot_settings
  end
end
