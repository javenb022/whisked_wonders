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

ActiveRecord::Schema[7.0].define(version: 2023_11_03_154755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_pies", force: :cascade do |t|
    t.bigint "pie_id", null: false
    t.bigint "invoice_id", null: false
    t.integer "quantity"
    t.string "toppings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_pies_on_invoice_id"
    t.index ["pie_id"], name: "index_invoice_pies_on_pie_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.boolean "completed", default: false
    t.integer "status", default: 0
    t.string "expected_delivery_time"
    t.string "name"
    t.integer "delivery_method"
    t.string "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
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
    t.string "password_digest"
    t.string "role", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip_code", null: false
  end

  add_foreign_key "invoice_pies", "invoices"
  add_foreign_key "invoice_pies", "pies"
  add_foreign_key "invoices", "users"
end
