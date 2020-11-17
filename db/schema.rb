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

ActiveRecord::Schema.define(version: 2020_11_17_120933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_airlines_on_email", unique: true
    t.index ["reset_password_token"], name: "index_airlines_on_reset_password_token", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.string "status", default: "pending"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "airline_id", null: false
    t.bigint "plane_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airline_id"], name: "index_bookings_on_airline_id"
    t.index ["plane_id"], name: "index_bookings_on_plane_id"
  end

  create_table "planes", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "capacity"
    t.integer "price_per_day"
    t.bigint "airline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airline_id"], name: "index_planes_on_airline_id"
  end

  add_foreign_key "bookings", "airlines"
  add_foreign_key "bookings", "planes"
  add_foreign_key "planes", "airlines"
end
