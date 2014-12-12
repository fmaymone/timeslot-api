class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :base_slot, index: true
      t.string :title, null: false
      t.text :content, default: ''

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
