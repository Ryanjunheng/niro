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

ActiveRecord::Schema.define(version: 20180119095015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "event_id", null: false
    t.json "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_badges_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "event_type"
    t.string "status"
    t.integer "report_count"
    t.integer "required_participants"
    t.integer "actual_participants"
    t.integer "allocated_points"
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.time "end_time"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "zip_code"
    t.json "photos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "host_type"
    t.bigint "host_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["host_type", "host_id"], name: "index_events_on_host_type_and_host_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_messages_on_organization_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "email"
    t.string "registration_number"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "zip_code"
    t.integer "verification", default: 0
    t.json "logo"
    t.json "documents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "full_name"
    t.string "phone"
    t.text "intro"
    t.integer "level"
    t.integer "points"
    t.integer "verification", default: 0
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "fb_link"
    t.string "linkedin_link"
    t.string "twitter_link"
    t.integer "role", default: 0
    t.json "avatar"
    t.json "documents"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "badges", "events"
  add_foreign_key "messages", "organizations"
  add_foreign_key "messages", "users"
  add_foreign_key "organizations", "users"
end
