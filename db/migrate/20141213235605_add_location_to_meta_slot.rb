class AddLocationToMetaSlot < ActiveRecord::Migration
  def change
    add_column :meta_slots, :location, :string
  end
end
