class AddSharedByToBaseslot < ActiveRecord::Migration
  def change
    add_reference :base_slots, :shared_by, references: :users
  end
end
