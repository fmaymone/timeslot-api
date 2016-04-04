class UserEmailCaseInsensitive < ActiveRecord::Migration
  def up
    enable_extension 'citext'
    change_column :users, :email, :citext
  end

  def down
    change_column :users, :email, :string, limit: 255
    disable_extension 'citext'
  end
end
