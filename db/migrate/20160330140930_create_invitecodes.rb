class CreateInvitecodes < ActiveRecord::Migration
  def change
    create_table :invitecodes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :relation
      t.string :code
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :invitecodes, :code, unique: true
  end
end
