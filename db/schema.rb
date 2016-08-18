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

ActiveRecord::Schema.define(version: 20160818004821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.integer  "location_id"
    t.date     "start"
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cohorts", ["location_id"], name: "index_cohorts_on_location_id", using: :btree

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "location_id"
    t.string   "linkedin"
    t.string   "website"
    t.string   "password_digest"
    t.text     "about"
    t.boolean  "admin"
    t.boolean  "actie"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "instructors", ["location_id"], name: "index_instructors_on_location_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stacks", force: :cascade do |t|
    t.integer  "instructor_id"
    t.integer  "language_id"
    t.date     "start_date"
    t.boolean  "active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stacks", ["instructor_id"], name: "index_stacks_on_instructor_id", using: :btree
  add_index "stacks", ["language_id"], name: "index_stacks_on_language_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "website"
    t.string   "linkedin"
    t.text     "about"
    t.integer  "age"
    t.boolean  "active"
    t.boolean  "happy"
    t.boolean  "help"
    t.integer  "cohort_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id", using: :btree

  add_foreign_key "cohorts", "locations"
  add_foreign_key "instructors", "locations"
  add_foreign_key "stacks", "instructors"
  add_foreign_key "stacks", "languages"
  add_foreign_key "students", "cohorts"
end
