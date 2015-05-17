class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :notifications, default: true
      t.column :state, 'bit(2)', default: '00'

      t.timestamps
    end
  end
end
