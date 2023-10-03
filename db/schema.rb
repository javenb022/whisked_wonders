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

ActiveRecord::Schema[7.0].define(version: 2023_10_03_144453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_pies", force: :cascade do |t|
    t.bigint "pies_id", null: false
    t.bigint "orders_id", null: false
    t.integer "quantity"
    t.string "toppings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orders_id"], name: "index_order_pies_on_orders_id"
    t.index ["pies_id"], name: "index_order_pies_on_pies_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "completed", default: false
    t.integer "status", default: 0
    t.string "expected_delivery_time"
    t.string "name"
    t.integer "delivery_method"
    t.string "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.string "estimated_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password_digest"
    t.string "role"
    t.string "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_pies", "orders", column: "orders_id"
  add_foreign_key "order_pies", "pies", column: "pies_id"
end
