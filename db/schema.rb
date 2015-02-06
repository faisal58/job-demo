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

ActiveRecord::Schema.define(version: 20150206052920) do

  create_table "company_types", force: true do |t|
    t.string "name"
  end

  add_index "company_types", ["name"], name: "index_company_types_on_name", unique: true, using: :btree

  create_table "employers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.integer  "company_type_id"
    t.string   "company_website"
    t.string   "company_logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "employers", ["company_type_id"], name: "index_employers_on_company_type_id", using: :btree

  create_table "job_applications", force: true do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_applications", ["job_id", "user_id"], name: "index_job_applications_on_job_id_and_user_id", unique: true, using: :btree

  create_table "job_categories", force: true do |t|
    t.string "name"
  end

  add_index "job_categories", ["name"], name: "index_job_categories_on_name", unique: true, using: :btree

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.integer  "job_category_id"
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.integer  "salary_range"
    t.date     "application_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["job_category_id"], name: "index_jobs_on_job_category_id", using: :btree
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "seekers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "objective"
    t.text     "career_overview"
    t.integer  "expected_salary"
    t.string   "resume_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "shortlists", force: true do |t|
    t.integer  "employer_id"
    t.integer  "seeker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "role"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
