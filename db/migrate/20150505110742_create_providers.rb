class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, limit: 20, null: false, unique: true
      t.timestamps
    end
  end
end
