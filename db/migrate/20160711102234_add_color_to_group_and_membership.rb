class AddColorToGroupAndMembership < ActiveRecord::Migration
  def change
    add_column :groups, :default_color, :string, default: '000000', null: false
    add_column :memberships, :color, :string, default: '000000', null: false
  end
end
