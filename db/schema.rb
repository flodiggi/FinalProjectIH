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

ActiveRecord::Schema.define(version: 20160730111022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.string   "category"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "password_digest"
    t.boolean  "namevoting",         default: true
    t.boolean  "locationvoting",     default: true
    t.boolean  "datevoting",         default: true
    t.boolean  "timevoting",         default: true
    t.boolean  "extravoting",        default: true
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
    t.index ["activity_id"], name: "index_comments_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "date_entries", force: :cascade do |t|
    t.date     "date"
    t.integer  "votes"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_date_entries_on_activity_id", using: :btree
  end

  create_table "date_votes", force: :cascade do |t|
    t.boolean  "check"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "date_entry_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["activity_id"], name: "index_date_votes_on_activity_id", using: :btree
    t.index ["date_entry_id"], name: "index_date_votes_on_date_entry_id", using: :btree
    t.index ["user_id"], name: "index_date_votes_on_user_id", using: :btree
  end

  create_table "group_activities", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_group_activities_on_activity_id", using: :btree
    t.index ["group_id"], name: "index_group_activities_on_group_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "hosts", force: :cascade do |t|
    t.integer  "userid"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_hosts_on_activity_id", using: :btree
  end

  create_table "location_entries", force: :cascade do |t|
    t.string   "location"
    t.integer  "votes"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_location_entries_on_activity_id", using: :btree
  end

  create_table "location_votes", force: :cascade do |t|
    t.boolean  "check"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "location_entry_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["activity_id"], name: "index_location_votes_on_activity_id", using: :btree
    t.index ["location_entry_id"], name: "index_location_votes_on_location_entry_id", using: :btree
    t.index ["user_id"], name: "index_location_votes_on_user_id", using: :btree
  end

  create_table "time_entries", force: :cascade do |t|
    t.time     "time"
    t.integer  "votes"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_time_entries_on_activity_id", using: :btree
  end

  create_table "time_votes", force: :cascade do |t|
    t.boolean  "check"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "time_entry_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["activity_id"], name: "index_time_votes_on_activity_id", using: :btree
    t.index ["time_entry_id"], name: "index_time_votes_on_time_entry_id", using: :btree
    t.index ["user_id"], name: "index_time_votes_on_user_id", using: :btree
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_user_activities_on_user_id", using: :btree
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id", using: :btree
    t.index ["user_id"], name: "index_user_groups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.string   "age_range"
    t.string   "link"
    t.string   "picture"
    t.string   "locale"
    t.string   "gender"
  end

  add_foreign_key "comments", "activities"
  add_foreign_key "comments", "users"
  add_foreign_key "date_votes", "activities"
  add_foreign_key "date_votes", "date_entries"
  add_foreign_key "date_votes", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "hosts", "activities"
  add_foreign_key "location_votes", "activities"
  add_foreign_key "location_votes", "location_entries"
  add_foreign_key "location_votes", "users"
  add_foreign_key "time_votes", "activities"
  add_foreign_key "time_votes", "time_entries"
  add_foreign_key "time_votes", "users"
end
