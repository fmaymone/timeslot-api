class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :owner_id
      t.string :name
      t.boolean :can_post, default: true
      t.boolean :can_invite, default: false
      t.boolean :displayed, default: true

      t.timestamps
    end
  end
end
