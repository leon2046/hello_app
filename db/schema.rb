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

ActiveRecord::Schema.define(version: 20171215141142) do

  create_table "customers", primary_key: "customer_id", force: :cascade do |t|
    t.string "name"
    t.string "snsid"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", primary_key: "goods_id", force: :cascade do |t|
    t.string "jan_cd", limit: 13
    t.string "name_jp"
    t.string "name_cn"
    t.integer "price_jpy"
    t.integer "profit_rate"
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", primary_key: "order_detail_id", force: :cascade do |t|
    t.integer "order_id"
    t.integer "good_id"
    t.date "order_time"
    t.integer "quantity"
    t.integer "purchase_price"
    t.integer "selling_price"
    t.string "order_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_order_details_on_good_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", primary_key: "order_id", force: :cascade do |t|
    t.integer "customer_id"
    t.string "note"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "payments", primary_key: "payment_id", force: :cascade do |t|
    t.integer "order_id"
    t.integer "customer_id"
    t.integer "amounts"
    t.date "payment_date"
    t.string "payment_method"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string "account"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
