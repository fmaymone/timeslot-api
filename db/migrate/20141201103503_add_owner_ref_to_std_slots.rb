class AddOwnerRefToStdSlots < ActiveRecord::Migration
  def change
    add_reference :std_slots, :owner, index: true
  end
end
