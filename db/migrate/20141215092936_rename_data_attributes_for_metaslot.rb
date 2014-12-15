class RenameDataAttributesForMetaslot < ActiveRecord::Migration
  def change
    rename_column :meta_slots, :startdate, :start_date
    rename_column :meta_slots, :enddate, :end_date
  end
end
