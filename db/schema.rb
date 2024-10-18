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

ActiveRecord::Schema[8.0].define(version: 2024_10_18_123033) do
  create_table "absences", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "duration", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_absences_on_user_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "month"
    t.integer "target_duration_per_month", default: 0
    t.integer "assigned_duration_per_month", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payrolls_on_user_id"
  end

  create_table "public_holidays", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "duration", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_public_holidays_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "month"
    t.integer "assigned_duration_per_month", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "payroll_enabled", default: false
    t.integer "target_duration_per_month", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "absences", "users"
  add_foreign_key "payrolls", "users"
  add_foreign_key "public_holidays", "users"
  add_foreign_key "schedules", "users"
end
