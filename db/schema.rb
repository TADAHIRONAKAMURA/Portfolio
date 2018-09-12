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

ActiveRecord::Schema.define(version: 2018_09_12_061908) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "complaints", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "fishing_report_id", null: false
    t.text "c_comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "fishing_report_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishing_reports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "fishing_spot_id", null: false
    t.date "fishing_date", null: false
    t.integer "time", null: false
    t.integer "weather", null: false
    t.integer "size", null: false
    t.integer "lure_type_id", null: false
    t.integer "range", null: false
    t.integer "retrieve", null: false
    t.string "lure_name"
    t.text "fishing_body", null: false
    t.string "a_image_id", null: false
    t.string "b_image_id"
    t.string "c_image_id"
    t.string "d_image_id"
    t.string "e_image_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fishing_date"], name: "index_fishing_reports_on_fishing_date"
  end

  create_table "fishing_spots", force: :cascade do |t|
    t.integer "spot_number", null: false
    t.string "fishing_spot_name", null: false
    t.string "fishing_spot_image_id"
    t.string "fishing_top_image_id"
    t.string "fishing_main_image_id"
    t.text "fishing_spot_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lure_types", force: :cascade do |t|
    t.string "type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "makers", force: :cascade do |t|
    t.string "tmaker_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "report_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "fishing_report_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tackle_reports", force: :cascade do |t|
    t.integer "user_id"
    t.string "tackle_image_id", null: false
    t.integer "evaluation", null: false
    t.integer "maker_id", null: false
    t.integer "lure_type_id", null: false
    t.string "tackle_name", null: false
    t.text "tackle_body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "nickname"
    t.string "phone_number"
    t.string "user_image_id"
    t.string "introduction"
    t.datetime "deleted_at"
    t.boolean "is_exist?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["nickname"], name: "index_users_on_nickname"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
