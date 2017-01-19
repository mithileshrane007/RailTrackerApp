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

ActiveRecord::Schema.define(version: 20170119115750) do

  create_table "assigned_to_froms", force: :cascade do |t|
    t.integer  "assigned_by",     limit: 4, null: false
    t.integer  "assigned_person", limit: 4, null: false
    t.datetime "created_at",                null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",            limit: 32,  null: false
    t.datetime "created_at",                  null: false
    t.string   "time_interval",   limit: 255, null: false
    t.string   "time_out",        limit: 255, null: false
    t.string   "owner_name",      limit: 255, null: false
    t.string   "company_uid",     limit: 255
    t.string   "password_digest", limit: 255
  end

  create_table "logs", force: :cascade do |t|
    t.float    "latitude",     limit: 53,  null: false
    t.float    "longitude",    limit: 53,  null: false
    t.integer  "tracker_id",   limit: 4,   null: false
    t.datetime "created_at",               null: false
    t.string   "timezone_str", limit: 255, null: false
    t.string   "timezone_id",  limit: 255, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",         limit: 32,                  null: false
    t.string   "user_type",    limit: 255,   default: "0"
    t.text     "description",  limit: 65535
    t.datetime "created_at",                               null: false
    t.integer  "company_id",   limit: 4
    t.string   "address",      limit: 255,                 null: false
    t.string   "dateofbirth",  limit: 255,                 null: false
    t.string   "phone",        limit: 255,                 null: false
    t.string   "track_id_reg", limit: 255,                 null: false
    t.string   "email_id",     limit: 255,                 null: false
  end

end
