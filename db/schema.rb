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

ActiveRecord::Schema.define(version: 20140701001951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",          default: 0,     null: false
    t.integer  "value"
    t.integer  "days_active",    default: 1,     null: false
    t.boolean  "complete_today", default: false, null: false
    t.integer  "state",          default: 0,     null: false
  end

  add_index "activities", ["contract_id"], name: "index_activities_on_contract_id", using: :btree

  create_table "contracts", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "reward"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",      default: 0,  null: false
    t.integer  "needed"
    t.integer  "days_left",  default: 30, null: false
    t.integer  "duration",   default: 30, null: false
    t.integer  "state",      default: 0,  null: false
  end

  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id", using: :btree

  create_table "feed_items", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feed_items", ["user_id"], name: "index_feed_items_on_user_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "is_mentor"
    t.boolean  "is_student"
    t.string   "auth_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["auth_key"], name: "index_users_on_auth_key", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
