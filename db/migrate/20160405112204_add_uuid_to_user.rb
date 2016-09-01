class AddUuidToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_uuid, :uuid, default: 'uuid_generate_v4()'
    change_column_null :users, :user_uuid, false
  end
end
