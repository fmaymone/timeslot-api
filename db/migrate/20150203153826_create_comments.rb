class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :slot_id
      t.text :content
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :comments, [:user_id, :slot_id]
  end
end
