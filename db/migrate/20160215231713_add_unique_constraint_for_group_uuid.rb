class AddUniqueConstraintForGroupUuid < ActiveRecord::Migration
  def up
    add_index :groups, :uuid, unique: true
    add_column :groups, :public, :boolean, null: false, default: false
    change_column_null :groups, :created_at, false
    change_column_null :groups, :updated_at, false
    change_column_null :groups, :members_can_post, false
    change_column_null :groups, :members_can_invite, false
    change_column_default :groups, :members_can_post, false
  end

  def down
    remove_index :groups, :uuid
    remove_column :groups, :public
    change_column_null :groups, :created_at, true
    change_column_null :groups, :updated_at, true
    change_column_null :groups, :members_can_post, true
    change_column_null :groups, :members_can_invite, true
    change_column_default :groups, :members_can_post, true
  end
end
