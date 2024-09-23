# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_23_165416) do
  create_table "bookings", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "rate_plan_id", null: false
    t.integer "calendar_id", null: false
    t.string "reservation_number"
    t.datetime "reservation_date"
    t.datetime "check_in"
    t.datetime "check_out"
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_bookings_on_calendar_id"
    t.index ["rate_plan_id"], name: "index_bookings_on_rate_plan_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "rate_plan_id", null: false
    t.date "date"
    t.integer "availability"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rate_plan_id"], name: "index_calendars_on_rate_plan_id"
    t.index ["room_id"], name: "index_calendars_on_room_id"
  end

  create_table "rate_plans", force: :cascade do |t|
    t.integer "room_id", null: false
    t.string "name"
    t.string "slug"
    t.text "detail"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_rate_plans_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "feature"
    t.boolean "published"
    t.integer "availability"
    t.text "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "calendars"
  add_foreign_key "bookings", "rate_plans"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "calendars", "rate_plans"
  add_foreign_key "calendars", "rooms"
  add_foreign_key "rate_plans", "rooms"
end
