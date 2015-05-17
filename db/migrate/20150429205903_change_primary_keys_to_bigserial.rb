class ChangePrimaryKeysToBigserial < ActiveRecord::Migration
  # changed more than initially planned, want to be on the safe side though
  def up
    execute <<-SQL
      ALTER TABLE connects ALTER COLUMN social_id SET DATA TYPE bigint;

      ALTER TABLE users ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE base_slots ALTER COLUMN shared_by_id SET DATA TYPE bigint;
      ALTER TABLE comments ALTER COLUMN user_id SET DATA TYPE bigint;
      ALTER TABLE connects ALTER COLUMN user_id SET DATA TYPE bigint;
      ALTER TABLE friendships ALTER COLUMN user_id SET DATA TYPE bigint;
      ALTER TABLE friendships ALTER COLUMN friend_id SET DATA TYPE bigint;
      ALTER TABLE groups ALTER COLUMN owner_id SET DATA TYPE bigint;
      ALTER TABLE likes ALTER COLUMN user_id SET DATA TYPE bigint;
      ALTER TABLE memberships ALTER COLUMN user_id SET DATA TYPE bigint;
      ALTER TABLE meta_slots ALTER COLUMN creator_id SET DATA TYPE bigint;
      ALTER TABLE re_slots ALTER COLUMN slotter_id SET DATA TYPE bigint;
      ALTER TABLE slot_settings ALTER COLUMN user_id SET DATA TYPE bigint;
      ALTER TABLE std_slots ALTER COLUMN owner_id SET DATA TYPE bigint;

      ALTER TABLE base_slots ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE comments ALTER COLUMN slot_id SET DATA TYPE bigint;
      ALTER TABLE likes ALTER COLUMN base_slot_id SET DATA TYPE bigint;
      ALTER TABLE notes ALTER COLUMN base_slot_id SET DATA TYPE bigint;
      ALTER TABLE re_slots ALTER COLUMN predecessor_id SET DATA TYPE bigint;
      ALTER TABLE re_slots ALTER COLUMN parent_id SET DATA TYPE bigint;

      ALTER TABLE meta_slots ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE base_slots ALTER COLUMN meta_slot_id SET DATA TYPE bigint;
      ALTER TABLE slot_settings ALTER COLUMN meta_slot_id SET DATA TYPE bigint;

      ALTER TABLE groups ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE group_slots ALTER COLUMN group_id SET DATA TYPE bigint;
      ALTER TABLE memberships ALTER COLUMN group_id SET DATA TYPE bigint;

      ALTER TABLE meta_slots ALTER COLUMN location_id SET DATA TYPE bigint;
      ALTER TABLE users ALTER COLUMN location_id SET DATA TYPE bigint;
      ALTER TABLE users ALTER COLUMN slot_default_location_id SET DATA TYPE bigint;

      ALTER TABLE comments ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE friendships ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE likes ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE media_items ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE memberships ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE notes ALTER COLUMN id SET DATA TYPE bigint;
      ALTER TABLE slot_settings ALTER COLUMN id SET DATA TYPE bigint;

      ALTER TABLE media_items ALTER COLUMN mediable_id SET DATA TYPE bigint;
    SQL

    change_column_null :meta_slots, :title, false
    change_column_null :meta_slots, :start_date, false
    change_column_null :meta_slots, :end_date, false
    change_column_null :meta_slots, :creator_id, false
    change_column_null :base_slots, :meta_slot_id, false
    change_column_null :std_slots, :owner_id, false
    change_column_null :group_slots, :group_id, false
    change_column_null :notes, :base_slot_id, false
    change_column_null :memberships, :user_id, false
    change_column_null :memberships, :group_id, false
    change_column_null :likes, :user_id, false
    change_column_null :likes, :base_slot_id, false
    change_column_null :groups, :name, false
    change_column_null :groups, :owner_id, false
    change_column_null :friendships, :user_id, false
    change_column_null :friendships, :friend_id, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :slot_id, false
    change_column_null :slot_settings, :user_id, false
    change_column_null :slot_settings, :meta_slot_id, false
  end

  def down
    execute <<-SQL
      ALTER TABLE connects ALTER COLUMN social_id SET DATA TYPE int;

      ALTER TABLE users ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE base_slots ALTER COLUMN shared_by_id SET DATA TYPE int;
      ALTER TABLE comments ALTER COLUMN user_id SET DATA TYPE int;
      ALTER TABLE connects ALTER COLUMN user_id SET DATA TYPE int;
      ALTER TABLE friendships ALTER COLUMN user_id SET DATA TYPE int;
      ALTER TABLE friendships ALTER COLUMN friend_id SET DATA TYPE int;
      ALTER TABLE groups ALTER COLUMN owner_id SET DATA TYPE int;
      ALTER TABLE likes ALTER COLUMN user_id SET DATA TYPE int;
      ALTER TABLE memberships ALTER COLUMN user_id SET DATA TYPE int;
      ALTER TABLE meta_slots ALTER COLUMN creator_id SET DATA TYPE int;
      ALTER TABLE re_slots ALTER COLUMN slotter_id SET DATA TYPE int;
      ALTER TABLE slot_settings ALTER COLUMN user_id SET DATA TYPE int;
      ALTER TABLE std_slots ALTER COLUMN owner_id SET DATA TYPE int;

      ALTER TABLE base_slots ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE comments ALTER COLUMN slot_id SET DATA TYPE int;
      ALTER TABLE likes ALTER COLUMN base_slot_id SET DATA TYPE int;
      ALTER TABLE notes ALTER COLUMN base_slot_id SET DATA TYPE int;
      ALTER TABLE re_slots ALTER COLUMN predecessor_id SET DATA TYPE int;
      ALTER TABLE re_slots ALTER COLUMN parent_id SET DATA TYPE int;

      ALTER TABLE meta_slots ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE base_slots ALTER COLUMN meta_slot_id SET DATA TYPE int;
      ALTER TABLE slot_settings ALTER COLUMN meta_slot_id SET DATA TYPE int;

      ALTER TABLE groups ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE group_slots ALTER COLUMN group_id SET DATA TYPE int;
      ALTER TABLE memberships ALTER COLUMN group_id SET DATA TYPE int;

      ALTER TABLE meta_slots ALTER COLUMN location_id SET DATA TYPE int;
      ALTER TABLE users ALTER COLUMN location_id SET DATA TYPE int;
      ALTER TABLE users ALTER COLUMN slot_default_location_id SET DATA TYPE int;

      ALTER TABLE comments ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE friendships ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE likes ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE media_items ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE memberships ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE notes ALTER COLUMN id SET DATA TYPE int;
      ALTER TABLE slot_settings ALTER COLUMN id SET DATA TYPE int;

      ALTER TABLE media_items ALTER COLUMN mediable_id SET DATA TYPE int;
    SQL
  end

  change_column_null :meta_slots, :title, true
  change_column_null :meta_slots, :start_date, true
  change_column_null :meta_slots, :end_date, true
  change_column_null :meta_slots, :creator_id, true
  change_column_null :base_slots, :meta_slot_id, true
  change_column_null :group_slots, :group_id, true
  change_column_null :std_slots, :owner_id, true
  change_column_null :notes, :base_slot_id, true
  change_column_null :memberships, :user_id, true
  change_column_null :memberships, :group_id, true
  change_column_null :likes, :user_id, true
  change_column_null :likes, :base_slot_id, true
  change_column_null :groups, :name, true
  change_column_null :groups, :owner_id, true
  change_column_null :friendships, :user_id, true
  change_column_null :friendships, :friend_id, true
  change_column_null :comments, :user_id, true
  change_column_null :comments, :slot_id, true
  change_column_null :slot_settings, :user_id, true
  change_column_null :slot_settings, :meta_slot_id, true
end
