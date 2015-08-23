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

ActiveRecord::Schema.define(version: 20150618124222) do

  create_table "bot_hash_tag_rels", force: :cascade do |t|
    t.integer  "bot_id",      limit: 4
    t.integer  "hash_tag_id", limit: 4
    t.boolean  "deleted",     limit: 1, default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "bots", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,                   null: false
    t.string   "twitter_name",  limit: 255
    t.string   "twitter_id",    limit: 255,                 null: false
    t.string   "access_token",  limit: 255
    t.string   "access_secret", limit: 255
    t.boolean  "deleted",       limit: 1,   default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "hash_tags", force: :cascade do |t|
    t.string   "hash_tag",   limit: 255,                 null: false
    t.boolean  "deleted",    limit: 1,   default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "realtime_bot_hash_tag_trackings", force: :cascade do |t|
    t.integer  "bot_id",     limit: 4,                     null: false
    t.integer  "bot_type",   limit: 4
    t.text     "content",    limit: 65535
    t.boolean  "deleted",    limit: 1,     default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               limit: 255, default: "", null: false
    t.string   "encrypted_password",  limit: 255, default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "username",            limit: 255
    t.string   "provider",            limit: 255
    t.string   "uid",                 limit: 255
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
