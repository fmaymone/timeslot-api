class RemoveMediaFromSlot < ActiveRecord::Migration
  def up
    remove_column :slots, :images
    remove_column :slots, :video
    remove_column :slots, :audio
  end

  def down
    add_column :slots, :images, :json, default: '[]'
    add_column :slots, :video, :string, default: ''
    add_column :slots, :audio, :string, default: ''
  end
end
