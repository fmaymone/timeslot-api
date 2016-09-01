class AddShareWithFriendsFlagToStdSlot < ActiveRecord::Migration
  def change
    add_column :std_slots, :share_with_friends, :boolean, default: false, null: false
  end
end
