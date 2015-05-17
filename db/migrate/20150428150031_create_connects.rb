class CreateConnects < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :connects do |t|
      t.references :user, index: true, null: false
      t.references :provider, null: false
      t.integer :social_id, index: true, null: false
      t.hstore :social_data, default: ''

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :connects, [:social_id, :user_id], unique: true
  end
end
