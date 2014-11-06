class ChangeStateColumnForMemberships < ActiveRecord::Migration
  def up
    remove_column :memberships, :state
    add_column :memberships, :state, 'bit(3)', default: '011' # invited
  end

  def down
    remove_column :memberships, :state
    add_column :memberships, :state, 'bit(2)', default: '00'
  end
end
