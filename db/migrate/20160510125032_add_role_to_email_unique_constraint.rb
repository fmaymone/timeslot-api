class AddRoleToEmailUniqueConstraint < ActiveRecord::Migration
  def up
    remove_index :users, :email
    add_index :users, :email, name: 'unique_index_through_basic_user_email_accounts', where: 'role = 0 AND email IS NOT NULL', unique: true
    add_index :users, [:email, :username], name: 'unique_index_through_public_user_email_accounts', where: 'role > 0 AND email IS NOT NULL', unique: true
  end

  def down
    remove_index :users, name: 'unique_index_through_public_user_email_accounts'
    remove_index :users, name: 'unique_index_through_basic_user_email_accounts'
    add_index :users, :email, unique: true
  end
end
