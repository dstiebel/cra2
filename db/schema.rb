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

ActiveRecord::Schema.define(version: 20160303220957) do

  create_table "data", force: :cascade do |t|
    t.integer  "loan_number"
    t.text     "product_description"
    t.string   "type_product"
    t.string   "census_tract"
    t.string   "income_level"
    t.string   "state"
    t.string   "county"
    t.integer  "state_fips"
    t.integer  "county_fips"
    t.text     "purpose"
    t.text     "property_type"
    t.integer  "fico"
    t.datetime "application_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "state_counts", force: :cascade do |t|
    t.string   "state"
    t.string   "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
