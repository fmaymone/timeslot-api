class AddEnumtypeToBaseslot < ActiveRecord::Migration
  def change
    add_column :base_slots, :slot_type, :integer, null: false
  end
end
