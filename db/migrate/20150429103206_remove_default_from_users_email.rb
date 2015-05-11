class RemoveDefaultFromUsersEmail < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE users
        ALTER COLUMN email DROP DEFAULT;
    SQL
  end

  def down
    change_column_default :users, :email, ""
  end
end
