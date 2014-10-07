class CreateBaseslots < ActiveRecord::Migration
  def change
    create_table :baseslots do |t|
      t.string :title
      t.datetime :startdate
      t.datetime :enddate
      t.timestamps
    end
  end
end
