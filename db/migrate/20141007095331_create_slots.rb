class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :baseslot_id
      t.integer :visibility, default: 0
      t.column :alerts, 'bit(10)'
      t.timestamps
    end
  end
end
