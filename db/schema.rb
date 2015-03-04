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

ActiveRecord::Schema.define(version: 20150304112136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broadcasts", force: :cascade do |t|
    t.text     "session_name"
    t.datetime "broadcast_date"
    t.text     "notes"
    t.text     "altnotes"
    t.text     "link1"
    t.text     "link2"
    t.text     "link3"
    t.text     "link4"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "casein_admin_users", force: :cascade do |t|
    t.string   "login",                           null: false
    t.string   "name"
    t.string   "email"
    t.integer  "access_level",        default: 0, null: false
    t.string   "crypted_password",                null: false
    t.string   "password_salt",                   null: false
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "mixes", force: :cascade do |t|
    t.text     "name"
    t.integer  "part"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "broadcast_id"
  end

  add_index "mixes", ["broadcast_id"], name: "index_mixes_on_broadcast_id", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.text     "artist"
    t.text     "title"
    t.text     "composed"
    t.text     "published"
    t.text     "record_label"
    t.text     "catalogue_no"
    t.text     "duration"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "mix_id"
  end

  add_index "tracks", ["mix_id"], name: "index_tracks_on_mix_id", using: :btree

  add_foreign_key "mixes", "broadcasts"
  add_foreign_key "tracks", "mixes"
end
