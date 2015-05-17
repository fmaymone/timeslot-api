class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend
      t.column :state, 'bit(2)', default: '00'

      t.datetime "deleted_at"
      t.timestamps
    end
    add_index :friendships, [:user_id, :friend_id], unique: true
    add_index :friendships, :friend_id
  end
end
