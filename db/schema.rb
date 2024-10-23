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

ActiveRecord::Schema[7.0].define(version: 2020_12_04_054652) do
  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.boolean "professional"
    t.text "why"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "name"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
    t.index ["user_id", "candidate_id"], name: "index_votes_on_user_id_and_candidate_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "candidates", "users"
  add_foreign_key "votes", "candidates"
  add_foreign_key "votes", "users"
end
