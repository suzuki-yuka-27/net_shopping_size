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

ActiveRecord::Schema[7.0].define(version: 2023_01_19_075156) do
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

  create_table "materials", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "material_image"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_materials_on_user_id"
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

  create_table "quiz_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_users_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_users_on_user_id"
  end

  create_table "quizzes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "question", null: false
    t.string "question_image"
    t.string "choice_1", null: false
    t.string "choice_2", null: false
    t.string "choice_3", null: false
    t.string "choice_4", null: false
    t.integer "answer", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
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
    t.integer "role", default: 0, null: false
    t.string "nonce", default: "0", null: false
    t.integer "score", default: 0, null: false
  end

  add_foreign_key "bottoms", "users"
  add_foreign_key "hats", "users"
  add_foreign_key "materials", "users"
  add_foreign_key "one_pieces", "users"
  add_foreign_key "outers", "users"
  add_foreign_key "quiz_users", "quizzes"
  add_foreign_key "quiz_users", "users"
  add_foreign_key "quizzes", "users"
  add_foreign_key "rings", "users"
  add_foreign_key "tops", "users"
  add_foreign_key "underwears", "users"
end
