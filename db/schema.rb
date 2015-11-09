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

ActiveRecord::Schema.define(version: 20151109035940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "house_hold_id"
    t.string   "name"
    t.integer  "active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "categories", ["house_hold_id"], name: "index_categories_on_house_hold_id", using: :btree

  create_table "groceries", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity",     default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "resident_id"
    t.datetime "purchased_at"
    t.integer  "category_id"
  end

  add_index "groceries", ["category_id"], name: "index_groceries_on_category_id", using: :btree
  add_index "groceries", ["resident_id"], name: "index_groceries_on_resident_id", using: :btree

  create_table "house_holds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residents", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "household_id"
  end

  add_index "residents", ["household_id"], name: "index_residents_on_household_id", using: :btree

  add_foreign_key "categories", "house_holds"
  add_foreign_key "groceries", "categories"
end
