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

ActiveRecord::Schema.define(version: 20160419212514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "master_passes", force: :cascade do |t|
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "image_path"
    t.string   "grade"
    t.decimal  "gpa"
    t.integer  "number_of_detentions"
    t.string   "shirt_size"
    t.string   "food_allergies"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_path"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role",            default: "teacher"
  end

end
