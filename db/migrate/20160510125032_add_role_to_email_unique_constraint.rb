class AddRoleToEmailUniqueConstraint < ActiveRecord::Migration
  def up
    remove_index :users, :email
    add_index :users, [:email, :role], unique: true
  end

  def down
    remove_index :users, [:email, :role]
    add_index :users, :email, unique: true
  end
end
