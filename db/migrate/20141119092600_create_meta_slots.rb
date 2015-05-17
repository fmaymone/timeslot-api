class CreateMetaSlots < ActiveRecord::Migration
  def change
    create_table :meta_slots, id: false do |t|
      t.integer :user_id
      t.integer :slot_id
      t.column :alerts, 'bit(10)', default: '0000000000'
      t.datetime "deleted_at"

      t.timestamps
    end

    add_index :meta_slots, [:user_id, :slot_id], unique: true
    add_index :meta_slots, :slot_id
  end
end
