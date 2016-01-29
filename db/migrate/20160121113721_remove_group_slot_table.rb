class RemoveGroupSlotTable < ActiveRecord::Migration
  def up
    drop_table :group_slots
  end

  def down
    create_table :group_slots do |t|
      # baseslot columns
      t.bigint :meta_slot_id, index: true, null: false
      t.integer :slot_type, null: false
      t.text :type, null: false
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0
      t.integer :re_slots_count, default: 0
      t.datetime :deleted_at
      t.timestamps null: false
      # additional columns
      t.bigint :group_id, index: true, null: false
    end
    change_column :group_slots, :id, :bigint
    execute <<-SQL
      ALTER TABLE ONLY group_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);
      ALTER TABLE group_slots DROP CONSTRAINT group_slots_pkey;
      DROP SEQUENCE group_slots_id_seq;
      ALTER TABLE group_slots INHERIT base_slots;
    SQL
  end
end
