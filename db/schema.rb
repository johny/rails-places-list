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

ActiveRecord::Schema.define(version: 20140216220103) do

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "workflow_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "places_count",   default: 0
  end

  add_index "cities", ["slug"], name: "index_cities_on_slug", unique: true, using: :btree
  add_index "cities", ["workflow_state"], name: "index_cities_on_workflow_state", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.string   "street_address"
    t.string   "zipcode"
    t.integer  "city_id"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.string   "workflow_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  add_index "places", ["slug"], name: "index_places_on_slug", unique: true, using: :btree
  add_index "places", ["workflow_state"], name: "index_places_on_workflow_state", using: :btree

end
