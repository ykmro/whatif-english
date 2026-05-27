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

ActiveRecord::Schema[7.0].define(version: 2026_05_27_103359) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.bigint "step_id", null: false
    t.string "body"
    t.string "feedback"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_choices_on_step_id"
  end

  create_table "situations", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.string "scenario"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "situation_id", null: false
    t.integer "step_number"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["situation_id"], name: "index_steps_on_situation_id"
  end

  create_table "study_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "loggable_type", null: false
    t.bigint "loggable_id", null: false
    t.integer "correct_count"
    t.datetime "studied_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loggable_type", "loggable_id"], name: "index_study_logs_on_loggable"
    t.index ["user_id"], name: "index_study_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_streak", default: 0
    t.date "last_login_date"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "word_choices", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "situation_id", null: false
    t.boolean "is_correct"
    t.index ["situation_id"], name: "index_word_choices_on_situation_id"
    t.index ["word_id"], name: "index_word_choices_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "title", null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "choices", "steps"
  add_foreign_key "steps", "situations"
  add_foreign_key "study_logs", "users"
  add_foreign_key "word_choices", "situations"
  add_foreign_key "word_choices", "words"
end
