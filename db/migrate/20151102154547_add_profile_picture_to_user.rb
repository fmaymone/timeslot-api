class AddProfilePictureToUser < ActiveRecord::Migration
  def change
    add_column :users, :picture, :string, limit: 255, default: '', null: false
  end
end
