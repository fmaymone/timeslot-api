class AddHighFivesCountToBaseSlot < ActiveRecord::Migration

def change

    add_column :base_slots, :high_fives_count, :integer, default: 0
  
  end

end
