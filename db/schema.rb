# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141103204451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.boolean  "subs_can_post",   default: true
    t.boolean  "subs_can_invite", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "media_items", force: true do |t|
    t.string   "media_type"
    t.string   "public_id"
    t.integer  "ordering"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mediable_id"
    t.string   "mediable_type"
  end

  add_index "media_items", ["mediable_id", "mediable_type"], name: "index_media_items_on_mediable_id_and_mediable_type", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "notifications",           default: true
    t.string   "state",         limit: 2, default: "00"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slots", force: true do |t|
    t.string   "title",      limit: 48
    t.datetime "startdate"
    t.datetime "enddate"
    t.text     "note"
    t.string   "visibility", limit: 2,  default: "11"
    t.string   "alerts",     limit: 10, default: "0000000000"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",   limit: 20
    t.boolean  "displayed",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
