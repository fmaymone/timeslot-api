class AddDescriptionToSlots < ActiveRecord::Migration
  def change
    add_column :base_slots, :description, :string, default: '', null: false
  end
end
