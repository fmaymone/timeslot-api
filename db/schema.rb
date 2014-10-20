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

ActiveRecord::Schema.define(version: 20141018114828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slots", force: true do |t|
    t.string   "title",      limit: 48
    t.datetime "startdate"
    t.datetime "enddate"
    t.text     "note"
    t.string   "visibility", limit: 2,  default: "11"
    t.string   "alerts",     limit: 10, default: "0000000000"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json     "images",                default: []
    t.string   "video",                 default: ""
    t.string   "audio",                 default: ""
  end

end
