class ChangeMediaItemToPolymorphic < ActiveRecord::Migration
  def up
    remove_reference :media_items, :slot
    add_reference(:media_items, :mediable, polymorphic: true, index: true)
  end

  def down
    remove_reference(:media_items, :mediable, polymorphic: true, index: true)
    add_reference(:media_items, :slot)
  end
end
