class AddOpenEndBoolToMetaslot < ActiveRecord::Migration
  def change
    add_column :meta_slots, :open_end, :boolean, default: false, null: false
  end
end
