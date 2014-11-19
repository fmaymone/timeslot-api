class RemoveAlertsFromSlot < ActiveRecord::Migration
  def up
    remove_column :slots, :alerts
  end

  def down
    add_column :slots, :alerts, 'bit(10)', default: '0000000000'
  end
end
