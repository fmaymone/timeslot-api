class AddDeletedAtToSlots < ActiveRecord::Migration
  def change
    add_column :slots, :deleted_at, :datetime
  end
end
