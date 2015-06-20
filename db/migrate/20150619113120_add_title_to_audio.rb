class AddTitleToAudio < ActiveRecord::Migration
  def up
    add_column :media_items, :title, :string, limit: 64
    change_column :media_items, :duration, 'float4'
  end

  def down
    remove_column :media_items, :title
    change_column :media_items, :duration, :int
  end
end
