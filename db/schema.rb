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

ActiveRecord::Schema.define(version: 20150408100222) do

  create_table "broadcasts", force: :cascade do |t|
    t.text     "session_name",                  limit: 65535
    t.datetime "broadcast_date"
    t.text     "notes",                         limit: 65535
    t.text     "altnotes",                      limit: 65535
    t.text     "link1",                         limit: 65535
    t.text     "link2",                         limit: 65535
    t.text     "link3",                         limit: 65535
    t.text     "link4",                         limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "image_file_name",               limit: 255
    t.string   "image_content_type",            limit: 255
    t.integer  "image_file_size",               limit: 4
    t.datetime "image_updated_at"
    t.boolean  "featured",                      limit: 1
    t.boolean  "highlight",                     limit: 1
    t.string   "background_image_file_name",    limit: 255
    t.string   "background_image_content_type", limit: 255
    t.integer  "background_image_file_size",    limit: 4
    t.datetime "background_image_updated_at"
    t.string   "spreadsheet_file_name",         limit: 255
    t.string   "spreadsheet_content_type",      limit: 255
    t.integer  "spreadsheet_file_size",         limit: 4
    t.datetime "spreadsheet_updated_at"
  end

  create_table "casein_admin_users", force: :cascade do |t|
    t.string   "login",               limit: 255,             null: false
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.integer  "access_level",        limit: 4,   default: 0, null: false
    t.string   "crypted_password",    limit: 255,             null: false
    t.string   "password_salt",       limit: 255,             null: false
    t.string   "persistence_token",   limit: 255
    t.string   "single_access_token", limit: 255
    t.string   "perishable_token",    limit: 255
    t.integer  "login_count",         limit: 4,   default: 0, null: false
    t.integer  "failed_login_count",  limit: 4,   default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",    limit: 255
    t.string   "last_login_ip",       limit: 255
    t.string   "time_zone",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "mixes", force: :cascade do |t|
    t.text     "name",                          limit: 65535
    t.integer  "part",                          limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "broadcast_id",                  limit: 4
    t.string   "url",                           limit: 255
    t.text     "soundcloudId",                  limit: 65535
    t.text     "mixcloudId",                    limit: 65535
    t.string   "background_image_file_name",    limit: 255
    t.string   "background_image_content_type", limit: 255
    t.integer  "background_image_file_size",    limit: 4
    t.datetime "background_image_updated_at"
    t.string   "mix_image_file_name",           limit: 255
    t.string   "mix_image_content_type",        limit: 255
    t.integer  "mix_image_file_size",           limit: 4
    t.datetime "mix_image_updated_at"
    t.string   "secret",                        limit: 255
  end

  add_index "mixes", ["broadcast_id"], name: "index_mixes_on_broadcast_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "tracks", force: :cascade do |t|
    t.text     "artist",       limit: 65535
    t.text     "title",        limit: 65535
    t.text     "composed",     limit: 65535
    t.text     "published",    limit: 65535
    t.text     "record_label", limit: 65535
    t.text     "catalogue_no", limit: 65535
    t.text     "duration",     limit: 65535
    t.text     "notes",        limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "mix_id",       limit: 4
  end

  add_index "tracks", ["mix_id"], name: "index_tracks_on_mix_id", using: :btree

  add_foreign_key "mixes", "broadcasts"
  add_foreign_key "tracks", "mixes"
end
