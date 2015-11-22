class AddCounterCacheColumnsToBaseSlot < ActiveRecord::Migration
  def up
    add_column :base_slots, :likes_count, :integer, default: 0
    add_column :base_slots, :comments_count, :integer, default: 0
    add_column :base_slots, :reslots_count, :integer, default: 0

    BaseSlot.reset_column_information

    BaseSlot.find_each do |slot|
      BaseSlot.reset_counters slot.id, :likes, :comments, :reslots
    end
  end

  def down
    remove_column :base_slots, :likes_count
    remove_column :base_slots, :comments_count
    remove_column :base_slots, :reslots_count
  end
end
