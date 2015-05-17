class AddPrimaryKeyToSlotSettings < ActiveRecord::Migration
  def change
    add_column :slot_settings, :id, :primary_key
  end
end
