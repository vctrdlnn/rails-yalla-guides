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

ActiveRecord::Schema.define(version: 20161115162900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "total_price"
    t.integer  "guide_id"
    t.integer  "profile_id"
    t.integer  "status_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["guide_id"], name: "index_bookings_on_guide_id", using: :btree
    t.index ["profile_id"], name: "index_bookings_on_profile_id", using: :btree
    t.index ["status_id"], name: "index_bookings_on_status_id", using: :btree
  end

  create_table "guides", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "profile_id"
    t.string   "start_address"
    t.string   "end_address"
    t.float    "lat_start"
    t.float    "lon_start"
    t.float    "lat_end"
    t.float    "lon_end"
    t.string   "city"
    t.string   "photo"
    t.integer  "hourly_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category"
    t.index ["profile_id"], name: "index_guides_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "role"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "code"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "guides"
  add_foreign_key "bookings", "profiles"
  add_foreign_key "bookings", "statuses"
  add_foreign_key "guides", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "bookings"
end
