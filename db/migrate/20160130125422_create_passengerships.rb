class CreatePassengerships < ActiveRecord::Migration
  def up
    create_table :passengerships do |t|
      t.bigint :slot_id, null: false
      t.bigint :user_id, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
    change_column :passengerships, :id, :bigint
    add_index :passengerships, [:slot_id, :user_id], unique: true
    add_index :passengerships, [:user_id, :slot_id], unique: true
  end

  def down
    drop_table :passsengerships
  end
end
