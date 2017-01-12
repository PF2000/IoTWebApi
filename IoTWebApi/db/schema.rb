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

ActiveRecord::Schema.define(version: 20170112134635) do

  create_table "attaches", force: :cascade do |t|
    t.string   "name"
    t.string   "data"
    t.string   "data_type"
    t.string   "description"
    t.datetime "date"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_attaches_on_project_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "school_id"
    t.integer  "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_courses_on_degree_id"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "courses_disciplines", id: false, force: :cascade do |t|
    t.integer "course_id",     null: false
    t.integer "discipline_id", null: false
  end

  create_table "courses_school_years", id: false, force: :cascade do |t|
    t.integer "course_id",      null: false
    t.integer "school_year_id", null: false
  end

  create_table "courses_schoolyears", id: false, force: :cascade do |t|
    t.integer "course_id",     null: false
    t.integer "schoolyear_id", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "grade"
    t.integer  "discipline_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "school_year_id"
    t.index ["discipline_id"], name: "index_projects_on_discipline_id"
    t.index ["school_year_id"], name: "index_projects_on_school_year_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "description"
    t.boolean  "projector"
    t.integer  "seats"
    t.integer  "school_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["school_id"], name: "index_rooms_on_school_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "class_letter"
    t.string   "class_type"
    t.string   "professor"
    t.integer  "discipline_id"
    t.integer  "room_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "school_year_id"
    t.index ["discipline_id"], name: "index_school_classes_on_discipline_id"
    t.index ["room_id"], name: "index_school_classes_on_room_id"
    t.index ["school_year_id"], name: "index_school_classes_on_school_year_id"
  end

  create_table "school_years", force: :cascade do |t|
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "district"
    t.string   "city"
    t.string   "county"
    t.string   "post_code"
    t.string   "address_details"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "summaries", force: :cascade do |t|
    t.integer  "number_students"
    t.string   "description"
    t.datetime "date"
    t.integer  "school_class_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["school_class_id"], name: "index_summaries_on_school_class_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "role_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "api_key"
    t.string   "password"
    t.string   "reset_token"
    t.string   "surname"
    t.datetime "rese_date"
    t.integer  "token_count"
    t.integer  "token_limit"
    t.datetime "token_count_reset_date"
    t.boolean  "locked"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
