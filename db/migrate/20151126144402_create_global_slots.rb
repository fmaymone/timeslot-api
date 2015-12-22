class CreateGlobalSlots < ActiveRecord::Migration
  def up
    create_table :global_slots do |t|
      # baseslot columns
      t.bigint :meta_slot_id, null: false
      t.integer :slot_type, null: false
      t.string :share_id, limit: 8, default: ''
      t.bigint :shared_by_id
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0
      t.integer :re_slots_count, default: 0
      t.datetime :deleted_at
      t.timestamps null: false
      # additional columns
      t.bigint :crawler_id, null: false
      t.uuid :cuid, null: false
      t.uuid :duid, null: false
      t.string :url, default: '', null: false
    end
    change_column :global_slots, :id, :bigint
    execute <<-SQL
      ALTER TABLE ONLY global_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);
      ALTER TABLE global_slots DROP CONSTRAINT global_slots_pkey;
      DROP SEQUENCE global_slots_id_seq;
      ALTER TABLE global_slots INHERIT base_slots;
    SQL
  end

  def down
    drop_table :global_slots
    # execute("ALTER TABLE global_slots NO INHERIT base_slots;")
  end
end
