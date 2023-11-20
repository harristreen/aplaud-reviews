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

ActiveRecord::Schema[7.0].define(version: 2023_11_20_124310) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_user_relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "business_id", null: false
    t.string "role"
    t.boolean "verified"
    t.index ["business_id"], name: "index_business_user_relationships_on_business_id"
    t.index ["user_id"], name: "index_business_user_relationships_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "location"
    t.string "address"
    t.float "lat"
    t.float "long"
    t.string "business_type"
    t.boolean "user_assigned", default: false
    t.boolean "is_validated", default: false
    t.text "description"
    t.string "tags", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth0_id"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.date "dob"
    t.string "location"
    t.string "interests", default: [], array: true
    t.string "dietary_preferences", default: [], array: true
  end

  add_foreign_key "business_user_relationships", "businesses"
  add_foreign_key "business_user_relationships", "users"
end
