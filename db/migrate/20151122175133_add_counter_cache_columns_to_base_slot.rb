class AddCounterCacheColumnsToBaseSlot < ActiveRecord::Migration
  def up
    add_column :base_slots, :high_fives_count, :integer, default: 0
    
    BaseSlot.reset_column_information

    BaseSlot.find_each do |slot|
      BaseSlot.reset_counters slot.id, :high_fives_count, :comments, :re_slots
    end
  end

  
end
