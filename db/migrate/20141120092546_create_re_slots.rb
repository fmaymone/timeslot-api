class CreateReSlots < ActiveRecord::Migration
  def change
    create_table :re_slots do |t|
      t.references :predecessor, index: true
      t.text :note, default: ''

      t.timestamps
    end
  end
end
