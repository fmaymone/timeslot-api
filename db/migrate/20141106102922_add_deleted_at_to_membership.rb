class AddDeletedAtToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :deleted_at, :datetime
  end
end
