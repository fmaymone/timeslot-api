class ChangeSlotToMetaSlot < ActiveRecord::Migration
  def up
    drop_table :slots
    create_table :meta_slots do |t|
      t.string :title, limit: '48'
      t.datetime :startdate
      t.datetime :enddate
      t.references :creator, index: true
      t.datetime :deleted_at

      t.timestamps
    end
    rename_column :slot_settings, :slot_id, :meta_slot_id
  end

  def down
    drop_table :meta_slots
    create_table :slots do |t|
      t.string :title, limit: '48'
      t.datetime :startdate
      t.datetime :enddate
      t.text :note
      t.column :visibility, 'bit(2)', default: '11'
      t.column :alerts, 'bit(10)', default: '0000000000'
      t.datetime :deleted_at

      t.timestamps
    end
    rename_column :slot_settings, :meta_slot_id, :slot_id
  end
end
