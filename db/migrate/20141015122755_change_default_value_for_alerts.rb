class ChangeDefaultValueForAlerts < ActiveRecord::Migration
  def up
    change_column_default :slots, :alerts, "0000000000"
  end

  def down
    change_column_default :slots, :alerts, "0010010011"
  end
end
