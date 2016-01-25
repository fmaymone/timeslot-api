class AddUuidToGroups < ActiveRecord::Migration
  def up
    add_column :groups, :uuid, :uuid
    set_uuid_for_all_groups
    change_column_null :groups, :uuid, false
  end

  def down
    remove_column :groups, :uuid
  end

  private def set_uuid_for_all_groups
    puts "setting uuid for #{Group.count} existing groups..."
    Group.find_each do |group|
      group.update(uuid: SecureRandom.uuid) if group.uuid.nil?
      puts "#{group.name} updated (#{group.uuid})"
    end
  end
end
