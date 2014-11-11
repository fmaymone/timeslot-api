class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.belongs_to :slot
      t.integer :slot_id
      t.string :media_type # , limit: '12'
      t.string :public_id
      t.integer :ordering

      t.timestamps
    end
  end
end
