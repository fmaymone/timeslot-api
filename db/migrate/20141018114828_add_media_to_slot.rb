class AddMediaToSlot < ActiveRecord::Migration
  def change
    add_column :slots, :images, :json, default: '[]'
    add_column :slots, :video, :string, default: ''
    add_column :slots, :audio, :string, default: ''
  end
end
