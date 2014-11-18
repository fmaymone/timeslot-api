class RenameSubsToMembersForGroups < ActiveRecord::Migration
  def change
    rename_column :groups, :subs_can_post, :members_can_post
    rename_column :groups, :subs_can_invite, :members_can_invite
    add_index :groups, :owner_id
    add_index :memberships, :user_id
    add_index :memberships, :group_id
  end
end
