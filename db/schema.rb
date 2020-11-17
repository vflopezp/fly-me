# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_17_015302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.integer "capacity"
    t.string "model"
    t.float "price"
    t.boolean "booked", default: false
    t.float "rating", default: 0.0
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_airplanes_on_owner_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "status", default: "pending"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "renter_id"
    t.bigint "airplane_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airplane_id"], name: "index_bookings_on_airplane_id"
    t.index ["renter_id"], name: "index_bookings_on_renter_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.bigint "airplane_id", null: false
    t.bigint "renter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airplane_id"], name: "index_ratings_on_airplane_id"
    t.index ["renter_id"], name: "index_ratings_on_renter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "passport_number"
    t.string "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "airplanes", "users", column: "owner_id"
  add_foreign_key "bookings", "airplanes"
  add_foreign_key "bookings", "users", column: "renter_id"
  add_foreign_key "ratings", "airplanes"
  add_foreign_key "ratings", "users", column: "renter_id"
end
