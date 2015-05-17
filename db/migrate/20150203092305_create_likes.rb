class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :base_slot_id
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :likes, [:user_id, :base_slot_id], unique: true
  end
end
