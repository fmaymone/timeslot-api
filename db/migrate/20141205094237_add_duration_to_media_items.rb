class AddDurationToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :duration, :integer
    add_column :media_items, :thumbnail, :string
  end
end
