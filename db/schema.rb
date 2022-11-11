# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_26_010850) do
  create_table "bottoms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "waist", null: false
    t.float "hip", null: false
    t.float "rising_length", null: false
    t.float "inseam", null: false
    t.float "total_length", null: false
    t.float "thickness_of_thigh", null: false
    t.float "bottom_width", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bottoms_on_user_id"
  end

  create_table "hats", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "head_circumference", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hats_on_user_id"
  end

  create_table "one_pieces", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "neck", null: false
    t.float "shoulder_width", null: false
    t.float "bust", null: false
    t.float "waist", null: false
    t.float "hip", null: false
    t.float "body_length", null: false
    t.float "sleeve_length", null: false
    t.float "sleeve_width", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_one_pieces_on_user_id"
  end

  create_table "outers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "neck", null: false
    t.float "shoulder_width", null: false
    t.float "body_width", null: false
    t.float "body_length", null: false
    t.float "sleeve_length", null: false
    t.float "sleeve_width", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_outers_on_user_id"
  end

  create_table "rings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "finger_circumference", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rings_on_user_id"
  end

  create_table "tops", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "neck", null: false
    t.float "shoulder_width", null: false
    t.float "body_width", null: false
    t.float "body_length", null: false
    t.float "sleeve_length", null: false
    t.float "sleeve_width", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tops_on_user_id"
  end

  create_table "underwears", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "top_bust", null: false
    t.float "under_bust", null: false
    t.float "waist", null: false
    t.float "hip", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_underwears_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "line_user_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bottoms", "users"
  add_foreign_key "hats", "users"
  add_foreign_key "one_pieces", "users"
  add_foreign_key "outers", "users"
  add_foreign_key "rings", "users"
  add_foreign_key "tops", "users"
  add_foreign_key "underwears", "users"
end
