class AddUserReferenceToStdSlot < ActiveRecord::Migration
  def change
    change_table :std_slots do |t|
      t.references :user, index: true
      t.datetime :deleted_at
    end
  end
end
