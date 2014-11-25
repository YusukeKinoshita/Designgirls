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

ActiveRecord::Schema.define(version: 20141124095221) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "category_id"
    t.integer  "tutorial_id"
    t.integer  "slide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["category_id", "tutorial_id"], name: "index_relationships_on_category_id_and_tutorial_id", unique: true
  add_index "relationships", ["category_id"], name: "index_relationships_on_category_id"
  add_index "relationships", ["slide_id"], name: "index_relationships_on_slide_id"
  add_index "relationships", ["tutorial_id", "slide_id"], name: "index_relationships_on_tutorial_id_and_slide_id", unique: true
  add_index "relationships", ["tutorial_id"], name: "index_relationships_on_tutorial_id"

  create_table "slides", force: true do |t|
    t.string   "title"
    t.integer  "tutorial_id"
    t.string   "body"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorials", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "category_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
