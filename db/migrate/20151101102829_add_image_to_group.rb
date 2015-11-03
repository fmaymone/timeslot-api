class AddImageToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :image, :string, limit: 255, default: '', null: false
  end
end
