class ChangeUserTable < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :phone
      t.integer :location_id
      t.string :public_url
      t.boolean :push, default: true
      t.integer :slot_default_location_id
      t.integer :slot_default_duration # in seconds?
      t.integer :slot_default_type_id # secret/friends/public slot
    end
    # with facebook/twitter login I need to allow accounts without pw digest
    change_column_null :users, :password_digest, true
  end
end
