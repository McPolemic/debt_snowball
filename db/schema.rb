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

ActiveRecord::Schema.define(version: 2018_12_20_011226) do

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.integer "snowball_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "interest_rate"
    t.index ["snowball_id"], name: "index_accounts_on_snowball_id"
  end

  create_table "snowballs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "monthly_amount_cents"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "account_id"
    t.date "date"
    t.string "description"
    t.decimal "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

end
