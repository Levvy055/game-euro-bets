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

ActiveRecord::Schema.define(version: 20160610000927) do

  create_table "bets", force: :cascade do |t|
    t.integer  "score_a",    limit: 4, default: 0, null: false
    t.integer  "score_b",    limit: 4, default: 0, null: false
    t.integer  "user_id",    limit: 4,             null: false
    t.integer  "match_id",   limit: 4,             null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "bets", ["match_id"], name: "fk_rails_ac8e6fd9cd", using: :btree
  add_index "bets", ["user_id"], name: "fk_rails_87dbfdd206", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "code",       limit: 255, null: false
    t.integer  "group_id",   limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "countries", ["group_id"], name: "fk_rails_ab2919a17b", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "score_a",      limit: 4
    t.integer  "score_b",      limit: 4
    t.datetime "start_time",             null: false
    t.integer  "country_a_id", limit: 4, null: false
    t.integer  "country_b_id", limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "visible_name",    limit: 255,             null: false
    t.string   "email",           limit: 255,             null: false
    t.string   "password_digest", limit: 255,             null: false
    t.integer  "level",           limit: 4,   default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_foreign_key "bets", "matches"
  add_foreign_key "bets", "users"
  add_foreign_key "countries", "groups"
end
