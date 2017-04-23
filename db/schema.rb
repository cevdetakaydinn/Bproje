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

ActiveRecord::Schema.define(version: 20170417092043) do

  create_table "academicterms", force: :cascade do |t|
    t.string   "term"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "classrooms", force: :cascade do |t|
    t.integer  "number"
    t.integer  "size"
    t.integer  "facility_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "classrooms", ["facility_id"], name: "index_classrooms_on_facility_id"

  create_table "curriculums", force: :cascade do |t|
    t.integer  "departmentlesson_id"
    t.integer  "academicterm_id"
    t.integer  "instructor_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "curriculums", ["academicterm_id"], name: "index_curriculums_on_academicterm_id"
  add_index "curriculums", ["departmentlesson_id"], name: "index_curriculums_on_departmentlesson_id"
  add_index "curriculums", ["instructor_id"], name: "index_curriculums_on_instructor_id"

  create_table "days", force: :cascade do |t|
    t.string   "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departmentlessons", force: :cascade do |t|
    t.integer  "hour_amount"
    t.integer  "grade"
    t.integer  "lesson_id"
    t.integer  "departmentlicense_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "departmentlessons", ["departmentlicense_id"], name: "index_departmentlessons_on_departmentlicense_id"
  add_index "departmentlessons", ["lesson_id"], name: "index_departmentlessons_on_lesson_id"

  create_table "departmentlicenses", force: :cascade do |t|
    t.integer  "grades"
    t.boolean  "has_night"
    t.integer  "department_id"
    t.integer  "license_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "year"
  end

  add_index "departmentlicenses", ["department_id"], name: "index_departmentlicenses_on_department_id"
  add_index "departmentlicenses", ["license_id"], name: "index_departmentlicenses_on_license_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "facility_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "departments", ["facility_id"], name: "index_departments_on_facility_id"

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "facilities", ["university_id"], name: "index_facilities_on_university_id"

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "id_number"
    t.integer  "rank"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessonhours", force: :cascade do |t|
    t.time     "beginning"
    t.time     "ending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weeklyschedules", force: :cascade do |t|
    t.integer  "lessonhours_id"
    t.integer  "day_id"
    t.integer  "curriculum_id"
    t.integer  "classroom_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "weeklyschedules", ["classroom_id"], name: "index_weeklyschedules_on_classroom_id"
  add_index "weeklyschedules", ["curriculum_id"], name: "index_weeklyschedules_on_curriculum_id"
  add_index "weeklyschedules", ["day_id"], name: "index_weeklyschedules_on_day_id"
  add_index "weeklyschedules", ["lessonhours_id"], name: "index_weeklyschedules_on_lessonhours_id"

end
