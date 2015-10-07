class AddActivityChannels < ActiveRecord::Migration
end
# class AddActivityChannels < ActiveRecord::Migration
#   def up
#     create_table :user_channels do |t|
#       t.references :user, index: true, null: false
#       t.references :follower, index: true, null: false
#       t.timestamps null: false
#       t.timestamp :deleted_at, null: true
#     end
#     change_column :user_channels, :id, 'bigint'
#     change_column :user_channels, :user_id, 'bigint'
#     change_column :user_channels, :follower_id, 'bigint'
#     add_index :user_channels, [:user_id, :follower_id], unique: true
#
#     create_table :group_channels do |t|
#       t.references :group, index: true, null: false
#       t.references :follower, index: true, null: false
#       t.timestamps null: false
#       t.timestamp :deleted_at, null: true
#     end
#     change_column :group_channels, :id, 'bigint'
#     change_column :group_channels, :group_id, 'bigint'
#     change_column :group_channels, :follower_id, 'bigint'
#     add_index :group_channels, [:group_id, :follower_id], unique: true
#
#     create_table :slot_channels do |t|
#       t.references :slot, index: true, null: false
#       t.references :follower, index: true, null: false
#       t.timestamps null: false
#       t.timestamp :deleted_at, null: true
#     end
#     change_column :slot_channels, :id, 'bigint'
#     change_column :slot_channels, :slot_id, 'bigint'
#     change_column :slot_channels, :follower_id, 'bigint'
#     add_index :slot_channels, [:slot_id, :follower_id], unique: true
#
#     add_column :devices, :socket, :string, limit: 64,
#                null: true, index: true, unique: true
#   end
#
#   def down
#     drop_table :user_channels
#     drop_table :group_channels
#     drop_table :slot_channels
#     remove_column :devices, :socket
#   end
# end
