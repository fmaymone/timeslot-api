class AddPrivateCalendarToSlotsets < ActiveRecord::Migration
  def up
    update <<-SQL
      UPDATE users
        SET slot_sets = slot_sets || hstore(ARRAY['my_private_slots_uuid'::text, (uuid_generate_v4())::text]);
      SQL
    update <<-SQL
      ALTER TABLE ONLY users ALTER COLUMN slot_sets SET DEFAULT hstore(ARRAY[
        ['my_cal_uuid', uuid_generate_v4()::text],
        ['friends_cal_uuid', uuid_generate_v4()::text],
        ['my_lib_uuid', uuid_generate_v4()::text],
        ['my_created_slots_uuid', uuid_generate_v4()::text],
        ['my_friend_slots_uuid', uuid_generate_v4()::text],
        ['my_private_slots_uuid', uuid_generate_v4()::text],
        ['my_public_slots_uuid', uuid_generate_v4()::text]]);
     SQL
  end

  def down
    update <<-SQL
      UPDATE users
      SET slot_sets = delete(slot_sets, 'my_private_slots_uuid');
     SQL
    update <<-SQL
      ALTER TABLE ONLY users ALTER COLUMN slot_sets SET DEFAULT hstore(ARRAY[
        ['my_cal_uuid', uuid_generate_v4()::text],
        ['friends_cal_uuid', uuid_generate_v4()::text],
        ['my_lib_uuid', uuid_generate_v4()::text],
        ['my_created_slots_uuid', uuid_generate_v4()::text],
        ['my_friend_slots_uuid', uuid_generate_v4()::text],
        ['my_public_slots_uuid', uuid_generate_v4()::text]]);
     SQL
  end
end
