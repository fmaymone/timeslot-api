class CreateGroupSlots < ActiveRecord::Migration
  def change
    create_table :group_slots do |t|
      t.references :group, index: true
      t.text :note, default: ''

      t.timestamps
    end
  end
end
