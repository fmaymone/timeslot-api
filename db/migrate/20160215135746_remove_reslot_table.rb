class RemoveReslotTable < ActiveRecord::Migration
  def up
    remove_column :base_slots, :re_slots_count
    drop_table :re_slots
  end

  def down
    add_column :base_slots, :re_slots_count, :integer, default: 0

    create_table :re_slots do |t|
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
      t.bigint :predecessor_id, index: true, null: false
      t.bigint :slotter_id, index: true, null: false
      t.bigint :parent_id, null: false
      t.bigint :tagged_from
    end
    change_column :re_slots, :id, :bigint
    execute <<-SQL
      ALTER TABLE ONLY re_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);
      ALTER TABLE re_slots DROP CONSTRAINT re_slots_pkey;
      DROP SEQUENCE re_slots_id_seq;
      ALTER TABLE re_slots INHERIT base_slots;
    SQL

    # needs association in model to work correctly
    # BaseSlot.reset_column_information

    # BaseSlot.find_each do |slot|
    #   BaseSlot.reset_counters slot.id, :likes, :comments, :re_slots
    # end
  end
end
