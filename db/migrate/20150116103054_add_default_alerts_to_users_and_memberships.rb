class AddDefaultAlertsToUsersAndMemberships < ActiveRecord::Migration
  def change
    add_column :users, :default_alerts, 'bit(10)'
    add_column :memberships, :default_alerts, 'bit(10)'
  end
end
