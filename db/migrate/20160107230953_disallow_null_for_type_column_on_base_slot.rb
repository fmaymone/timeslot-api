class DisallowNullForTypeColumnOnBaseSlot < ActiveRecord::Migration
  def change
    change_column_null :base_slots, :type, false
  end
end
