class AddRRuleToMetaSlot < ActiveRecord::Migration
  def change
    add_column :meta_slots, :rrule, :string, default: '', null: false
  end
end
