class AddDefaultAlertsToUser < ActiveRecord::Migration
  def up
    remove_column :users, :default_alerts
    add_column :users, :default_group_alerts, 'bit(10)', default: '0000000000'
    add_column :users, :default_private_alerts, 'bit(10)', default: '0000000000'
    add_column :users, :default_own_friendslot_alerts, 'bit(10)', default: '0000000000'
    add_column :users, :default_friends_friendslot_alerts, 'bit(10)', default: '0000000000'
    add_column :users, :default_own_public_alerts, 'bit(10)', default: '0000000000'
    add_column :users, :default_friends_public_alerts, 'bit(10)', default: '0000000000'
    add_column :users, :default_reslot_alerts, 'bit(10)', default: '0000000000'
  end

  def down
    add_column :users, :default_alerts, 'bit(10)'
    remove_column :users, :default_group_alerts
    remove_column :users, :default_private_alerts
    remove_column :users, :default_own_friendslot_alerts
    remove_column :users, :default_friends_friendslot_alerts
    remove_column :users, :default_own_public_alerts
    remove_column :users, :default_friends_public_alerts
    remove_column :users, :default_reslot_alerts
  end
end
