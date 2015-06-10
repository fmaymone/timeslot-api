class AddCreatorAndLocalIdToMedia < ActiveRecord::Migration
  def up
    add_column :media_items, :local_id, :string, limit: 64
    add_column :media_items, :creator_id, 'bigint'#, null: false
    change_column :media_items, :media_type, :string, limit: 255
    change_column :media_items, :mediable_type, :string, limit: 255
    change_column :media_items, :public_id, :string, limit: 255
    change_column :media_items, :thumbnail, :string, limit: 255
  end

  def down
    remove_column :media_items, :local_id
    remove_column :media_items, :creator_id
    change_column :media_items, :media_type, :string
    change_column :media_items, :mediable_type, :string
    change_column :media_items, :public_id, :string
    change_column :media_items, :thumbnail, :string
  end
end
