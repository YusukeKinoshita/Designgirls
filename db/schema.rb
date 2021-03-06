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

ActiveRecord::Schema.define(version: 20141229075920) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "soft_image"
    t.string   "short_description"
    t.string   "topimg"
  end

  create_table "completes", force: true do |t|
    t.integer  "user_id"
    t.integer  "slide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["product_id"], name: "index_favorites_on_product_id"
  add_index "favorites", ["user_id", "product_id"], name: "index_favorites_on_user_id_and_product_id", unique: true
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "finishes", force: true do |t|
    t.integer  "user_id"
    t.integer  "userslide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  add_index "finishes", ["user_id", "userslide_id"], name: "index_finishes_on_user_id_and_userslide_id", unique: true
  add_index "finishes", ["user_id"], name: "index_finishes_on_user_id"
  add_index "finishes", ["userslide_id"], name: "index_finishes_on_userslide_id"


  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "tutorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usertutorial_id"
  end


  add_index "likes", ["tutorial_id"], name: "index_likes_on_tutorial_id"
  add_index "likes", ["user_id", "tutorial_id"], name: "index_likes_on_user_id_and_tutorial_id", unique: true
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"


  create_table "products", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "tutorial_id"
    t.string   "question"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selects", force: true do |t|
    t.integer  "question_id"
    t.integer  "answer"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
  end

  create_table "slides", force: true do |t|
    t.string   "title"
    t.integer  "tutorial_id"
    t.string   "body"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "youtube"
    t.string   "slideshare"
    t.integer  "order"
    t.string   "question1"
    t.string   "question2"
    t.string   "question3"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "tutorial_id"
  end

  create_table "tutorials", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "category_id"
    t.integer  "level"
    t.integer  "self_flag"
    t.string   "slideshare"
  end

  create_table "users", force: true do |t|
    t.string   "name",                                          null: false
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "image"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",                    limit: 8
    t.string   "provider"
    t.integer  "progress"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

  create_table "userslides", force: true do |t|
    t.string   "title"
    t.integer  "tutorial_id"
    t.string   "body"
    t.string   "image"
    t.string   "youtube"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usertutorial_id"
  end

  create_table "usertutorials", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "description"
    t.string   "image"
    t.integer  "category_id"
    t.integer  "level"
    t.string   "slideshare"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
