class CreateHighFives < ActiveRecord::Migration
  def change
    create_table :high_fives do |t|
      t.integer :user_id
      t.integer :base_slot_id
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :high_fives, [:user_id, :base_slot_id], unique: true
  end
end
