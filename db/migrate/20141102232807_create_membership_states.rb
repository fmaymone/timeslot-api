class CreateMembershipStates < ActiveRecord::Migration
  def change
    create_table :membership_states do |t|
      t.integer :membership_id
      t.column :state, 'bit(2)'
      t.datetime :created_at
    end
  end
end
