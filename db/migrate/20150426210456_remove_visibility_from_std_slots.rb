class RemoveVisibilityFromStdSlots < ActiveRecord::Migration
  def up
    remove_column :std_slots, :visibility
  end

  def down
    add_column :std_slots, :visibility, 'bit(2)', default: '11'
  end
end
