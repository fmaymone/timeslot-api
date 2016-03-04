class RemoveReslotTable < ActiveRecord::Migration
  def up
    migrate_stdslots
    migrate_reslots
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

  private def migrate_stdslots
    ActiveRecord::Base.transaction do
      slot_count = StdSlot.count

      StdSlot.find_each.with_index do |slot, index|
        default_msg = "#{index + 1}/#{slot_count} - #{slot.title}"

        ps = Passengership.find_or_create_by(slot_id: slot.id,
                                             user_id: slot.creator_id)
        puts "passengership: #{ps.id} for slot #{slot.id}"

        if ps.save
          puts "#{default_msg} saved (#{ps.id})"
        else
          puts "ERROR - #{default_msg} not updated (#{ps.id})"
        end
      end
    end
  end

  private def migrate_reslots
    ActiveRecord::Base.transaction do
      slot_count = ReSlot.count

      ReSlot.find_each.with_index do |slot, index|
        default_msg = "#{index + 1}/#{slot_count} - #{slot.title}"

        ps = Passengership.find_or_create_by(slot_id: slot.parent_id,
                                             user_id: slot.slotter_id)
        puts "passengership: #{ps.id}"

        if ps.save
          puts "#{default_msg} saved (#{ps.id})"
        else
          puts "ERROR - #{default_msg} not updated (#{ps.id})"
        end
      end
    end
  end
end
