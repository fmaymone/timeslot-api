class AddAllDayFlagToMetaSlot < ActiveRecord::Migration
  def change
    add_column :meta_slots, :allday, :boolean, default: false, null: false
  end
end
