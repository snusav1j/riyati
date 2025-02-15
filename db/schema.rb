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

ActiveRecord::Schema[8.0].define(version: 2025_02_14_200050) do
  create_table "parfum_drop_avg_mls", force: :cascade do |t|
    t.float "ml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parfum_ingridients", force: :cascade do |t|
    t.string "ingridient_name"
    t.integer "drops_count"
    t.float "ml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parfum_materials", force: :cascade do |t|
    t.string "material_name"
    t.float "material_ml"
    t.float "expense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parfum_recipes", force: :cascade do |t|
    t.integer "parfum_id"
    t.integer "parfum_material_id"
    t.integer "drops_count"
    t.float "ml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parfums", force: :cascade do |t|
    t.string "parfum_name"
    t.string "parfum_description"
    t.boolean "tester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_coins", force: :cascade do |t|
    t.string "user_id"
    t.string "crypto_symbol"
    t.integer "crypto_buy_price"
    t.integer "crypto_sold_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "password"
    t.string "role"
    t.integer "coin_id"
    t.float "balance"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
