class CreateContainerships < ActiveRecord::Migration
  def up
    create_table :containerships do |t|
      t.bigint :slot_id, null: false
      t.bigint :group_id, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
    change_column :containerships, :id, :bigint
    add_index :containerships, [:slot_id, :group_id], unique: true
    add_index :containerships, [:group_id, :slot_id], unique: true
  end

  def down
    drop_table :containerships
  end
end
