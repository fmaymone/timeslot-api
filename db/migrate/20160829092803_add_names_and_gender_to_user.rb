class AddNamesAndGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :text
    add_column :users, :middle_name, :text
    add_column :users, :last_name, :text
    add_column :users, :gender, :text # allow non-binary genders
  end
end
