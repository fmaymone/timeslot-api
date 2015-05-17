class CreateStdSlots < ActiveRecord::Migration
  def change
    create_table :std_slots do |t|
      t.column :visibility, 'bit(2)', default: '11'
      t.text :note, default: ''

      t.timestamps
    end
  end
end
