class AddShareUrlToBaseSlot < ActiveRecord::Migration
  def change
    add_column :base_slots, :share_url, :string, default: ''
  end
end
