class IncreaseSlotTitleMaxLength < ActiveRecord::Migration
  def up
    change_column :meta_slots, :title, :string, limit: 60
  end

  def down
    change_column :meta_slots, :title, :string, limit: 48
  end
end
