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

ActiveRecord::Schema.define(version: 20140512114055) do

  create_table "areas", force: true do |t|
    t.integer  "pref_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "areas", ["pref_id"], name: "index_areas_on_pref_id"

  create_table "prefs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "property"
    t.string   "alphabet"
    t.string   "name_kana"
    t.integer  "pref_id"
    t.integer  "area_id"
    t.string   "zip"
    t.string   "address"
    t.text     "description"
    t.boolean  "closed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["area_id"], name: "index_restaurants_on_area_id"
  add_index "restaurants", ["pref_id"], name: "index_restaurants_on_pref_id"

end
