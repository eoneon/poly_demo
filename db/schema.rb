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

ActiveRecord::Schema.define(version: 20180128220643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "element_fields", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
  end

  create_table "element_groups", force: :cascade do |t|
    t.string "elementable_type"
    t.bigint "elementable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sub_element_id"
    t.string "subable_type"
    t.bigint "subable_id"
    t.index ["elementable_type", "elementable_id"], name: "index_element_groups_on_elementable_type_and_elementable_id"
    t.index ["sub_element_id"], name: "index_element_groups_on_sub_element_id"
    t.index ["subable_type", "subable_id"], name: "index_element_groups_on_subable_type_and_subable_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "field_groups", force: :cascade do |t|
    t.bigint "sub_element_id"
    t.bigint "element_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_field_id"], name: "index_field_groups_on_element_field_id"
    t.index ["sub_element_id"], name: "index_field_groups_on_sub_element_id"
  end

  create_table "field_values", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.string "sub_kind"
  end

  create_table "sub_elements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "value_groups", force: :cascade do |t|
    t.bigint "element_field_id"
    t.bigint "field_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_field_id"], name: "index_value_groups_on_element_field_id"
    t.index ["field_value_id"], name: "index_value_groups_on_field_value_id"
  end

  add_foreign_key "element_groups", "sub_elements"
  add_foreign_key "field_groups", "element_fields"
  add_foreign_key "field_groups", "sub_elements"
  add_foreign_key "value_groups", "element_fields"
  add_foreign_key "value_groups", "field_values"
end
