class AddSlotGroupshipTable < ActiveRecord::Migration
  def change
    create_table :slotgroupship do |t|
      t.bigint :slot_id, null: false
      t.bigint :group_id, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
    change_column :slotgroupship, :id, :bigint
  end
end
