class CreateBaseSlots < ActiveRecord::Migration
  def change
    create_table :base_slots do |t|
      t.string :footest

      t.timestamps
    end
  end
end
