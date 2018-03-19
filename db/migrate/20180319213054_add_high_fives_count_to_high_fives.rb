class AddHighFivesCountToHighFives < ActiveRecord::Migration
  def change
    
    add_column :high_fives, :count, :integer, default: 0

  end
end
