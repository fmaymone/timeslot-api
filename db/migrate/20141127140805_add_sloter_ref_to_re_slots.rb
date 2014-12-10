class AddSloterRefToReSlots < ActiveRecord::Migration
  def change
    add_reference :re_slots, :slotter, index: true
  end
end
