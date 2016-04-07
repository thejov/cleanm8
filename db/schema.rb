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

ActiveRecord::Schema.define(version: 20160325115934) do

  create_table "chores", force: :cascade do |t|
    t.string   "name"
    t.integer  "household_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "chores", ["household_id"], name: "index_chores_on_household_id"

  create_table "cleanings", force: :cascade do |t|
    t.datetime "date"
    t.integer  "chore_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cleanings", ["chore_id"], name: "index_cleanings_on_chore_id"
  add_index "cleanings", ["user_id"], name: "index_cleanings_on_user_id"

  create_table "households", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "household_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["household_id"], name: "index_users_on_household_id"

end
