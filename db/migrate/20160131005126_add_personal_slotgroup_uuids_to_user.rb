class AddPersonalSlotgroupUuidsToUser < ActiveRecord::Migration
  def up
    enable_extension "uuid-ossp"
    update <<-SQL
      ALTER TABLE "users" ADD "slot_sets" hstore
      DEFAULT hstore(ARRAY[
        ['my_cal_uuid', uuid_generate_v4()::text],
        ['friends_cal_uuid', uuid_generate_v4()::text],
        ['my_lib_uuid', uuid_generate_v4()::text],
        ['my_created_slots_uuid', uuid_generate_v4()::text],
        ['my_friend_slots_uuid', uuid_generate_v4()::text],
        ['my_public_slots_uuid', uuid_generate_v4()::text]]) NOT NULL
    SQL
  end

  def down
    disable_extension "uuid-ossp"
    remove_column :users, :slot_sets
  end
end
