class AddStringIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :string_id, :text, default: "", null: false
  end
end
