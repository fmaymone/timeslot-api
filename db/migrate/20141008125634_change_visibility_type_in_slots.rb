class ChangeVisibilityTypeInSlots < ActiveRecord::Migration
  def up
    remove_column :slots, :visibility
    add_column :slots, :visibility, 'bit(2)', default: '11'
  end

  def down
    remove_column :slots, :visibility
    add_column :slots, :visibility, :int
  end
end
