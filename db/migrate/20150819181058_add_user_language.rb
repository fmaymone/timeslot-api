class AddUserLanguage < ActiveRecord::Migration
  def up
    add_column :users, :lang, :string, length: 2
  end

  def down
    remove_column :users, :lang
  end
end
