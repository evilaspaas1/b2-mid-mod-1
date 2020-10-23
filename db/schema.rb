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

ActiveRecord::Schema.define(version: 2020_10_23_154141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amusement_parks", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctor_surgeries", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "surgery_id"
    t.index ["doctor_id"], name: "index_doctor_surgeries_on_doctor_id"
    t.index ["surgery_id"], name: "index_doctor_surgeries_on_surgery_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "specialty"
    t.string "school"
    t.bigint "hospital_id"
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
  end

  create_table "flight_passengers", force: :cascade do |t|
    t.bigint "passenger_id"
    t.bigint "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_flight_passengers_on_flight_id"
    t.index ["passenger_id"], name: "index_flight_passengers_on_passenger_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "number"
    t.bigint "airline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airline_id"], name: "index_flights_on_airline_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.integer "thrill_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "amusement_park_id"
    t.index ["amusement_park_id"], name: "index_rides_on_amusement_park_id"
  end

  create_table "surgeries", force: :cascade do |t|
    t.string "title"
    t.string "day"
    t.string "operating_room_number"
  end

  add_foreign_key "doctor_surgeries", "doctors"
  add_foreign_key "doctor_surgeries", "surgeries"
  add_foreign_key "doctors", "hospitals"
  add_foreign_key "flight_passengers", "flights"
  add_foreign_key "flight_passengers", "passengers"
  add_foreign_key "flights", "airlines"
  add_foreign_key "rides", "amusement_parks"
end
