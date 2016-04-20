class CreateInvitecodes < ActiveRecord::Migration
  def change
    create_table :invitecodes do |t|
      t.bigint :user_id, index: true, null: false
      t.string :context
      t.string :code
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :invitecodes, :code, unique: true
  end
end
