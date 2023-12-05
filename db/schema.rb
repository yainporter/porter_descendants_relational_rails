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

ActiveRecord::Schema[7.0].define(version: 2023_12_05_043443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "descendents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "datetime"
    t.boolean "allergies"
    t.integer "languages"
    t.boolean "married"
    t.boolean "grandchildren"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_descendents_on_parent_id"
  end

  create_table "grandchildren", force: :cascade do |t|
    t.bigint "descendent_id", null: false
    t.string "name"
    t.boolean "lives_at_home"
    t.integer "age"
    t.string "hobbies"
    t.string "location"
    t.text "fun_fact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["descendent_id"], name: "index_grandchildren_on_descendent_id"
  end

  create_table "missions", force: :cascade do |t|
    t.bigint "descendent_id", null: false
    t.string "mission_name"
    t.string "mission_language"
    t.string "country"
    t.integer "members_baptized"
    t.boolean "foreign_mission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["descendent_id"], name: "index_missions_on_descendent_id"
  end

  add_foreign_key "descendents", "descendents", column: "parent_id"
  add_foreign_key "grandchildren", "descendents"
  add_foreign_key "missions", "descendents"
end
