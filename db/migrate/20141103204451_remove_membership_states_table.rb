class RemoveMembershipStatesTable < ActiveRecord::Migration
  def change
    drop_table :membership_states
  end
end
