class DisallowNullForTypeColumnOnBaseSlot < ActiveRecord::Migration
  def up
    set_type_for_all_slots
    change_column_null :base_slots, :type, false
  end

  def down
    change_column_null :base_slots, :type, true
  end

  private def set_type_for_all_slots
    puts "setting type for #{BaseSlot.count} existing slots..."
    BaseSlot.find_each do |slot|
      slot.update(type: slot.slot_type) if slot.type.nil?
      puts "#{slot.id} updated (#{slot.type})"
    end
  end
end
