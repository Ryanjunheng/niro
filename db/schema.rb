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

ActiveRecord::Schema.define(version: 20180121090004) do

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

  create_table "badges_sashes", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "sash_id"
    t.boolean "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id"
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id"
  end

  create_table "event_messages", force: :cascade do |t|
    t.bigint "event_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["event_id"], name: "index_event_messages_on_event_id"
    t.index ["user_id"], name: "index_event_messages_on_user_id"
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
    t.text "host_rewards"
    t.json "image"
    t.index ["host_type", "host_id"], name: "index_events_on_host_type_and_host_id"
  end

  create_table "followings", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_followings_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_followings_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_followings_on_follower_id"
  end

  create_table "merit_actions", force: :cascade do |t|
    t.integer "user_id"
    t.string "action_method"
    t.integer "action_value"
    t.boolean "had_errors", default: false
    t.string "target_model"
    t.integer "target_id"
    t.text "target_data"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer "action_id"
    t.string "related_change_type"
    t.integer "related_change_id"
    t.string "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.bigint "score_id"
    t.integer "num_points", default: 0
    t.string "log"
    t.datetime "created_at"
    t.index ["score_id"], name: "index_merit_score_points_on_score_id"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.bigint "sash_id"
    t.string "category", default: "default"
    t.index ["sash_id"], name: "index_merit_scores_on_sash_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
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

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "reportings", force: :cascade do |t|
    t.integer "reporter_id"
    t.string "reported_type"
    t.bigint "reported_id"
    t.text "comment"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reported_type", "reported_id"], name: "index_reportings_on_reported_type_and_reported_id"
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "visitor_id"
    t.string "title"
    t.text "testimony"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_testimonials_on_user_id"
  end

  create_table "user_messages", force: :cascade do |t|
    t.bigint "user_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_messages_on_user_id"
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
    t.integer "sash_id"
    t.integer "level", default: 0
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "badges", "events"
  add_foreign_key "event_messages", "events"
  add_foreign_key "event_messages", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
  add_foreign_key "testimonials", "users"
  add_foreign_key "user_messages", "users"
end
