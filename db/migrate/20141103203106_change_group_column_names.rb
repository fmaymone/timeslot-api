class ChangeGroupColumnNames < ActiveRecord::Migration
  def change
    rename_column :groups, :can_post, :subs_can_post
    rename_column :groups, :can_invite, :subs_can_invite
    remove_column :groups, :displayed
    add_column :groups, :deleted_at, :datetime
  end
end
