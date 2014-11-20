class AddMetaSlotReferenceToBaseSlot < ActiveRecord::Migration
  def change
    change_table :base_slots do |t|
      t.references :meta_slot, index: true
      t.datetime :deleted_at
    end
  end
end
