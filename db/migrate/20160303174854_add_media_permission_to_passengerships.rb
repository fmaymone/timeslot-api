class AddMediaPermissionToPassengerships < ActiveRecord::Migration
  def change
    add_column :passengerships, :add_media_permission, :bool, default: false, null: false
    add_column :passengerships, :show_in_my_schedule, :bool, default: true, null: false
  end
end
