class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :title, limit: '48'
      t.datetime :startdate
      t.datetime :enddate
      t.text :note
      t.column :visibility, 'bit(2)', default: '11'
      t.column :alerts, 'bit(10)', default: '1000010100'
      t.timestamps
    end
  end
end
