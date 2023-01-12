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

ActiveRecord::Schema[7.0].define(version: 2023_01_06_163117) do
  create_table "counties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "projects_count"
    t.index ["code"], name: "index_counties_on_code", unique: true
    t.index ["name"], name: "index_counties_on_name", unique: true
  end

  create_table "county_budgets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "fiscal_year_id", null: false
    t.bigint "county_id", null: false
    t.decimal "totalBudget", precision: 16, scale: 2, default: "0.0"
    t.decimal "totalExpenditure", precision: 16, scale: 2, default: "0.0"
    t.decimal "totalRevenue", precision: 16, scale: 2, default: "0.0"
    t.decimal "totalPendingBills", precision: 16, scale: 2, default: "0.0"
    t.decimal "absorptionRate", precision: 5, scale: 2, default: "0.0"
    t.decimal "totalBalance", precision: 16, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_county_budgets_on_county_id"
    t.index ["fiscal_year_id"], name: "index_county_budgets_on_fiscal_year_id"
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "county_id", null: false
    t.string "name"
    t.decimal "totalBudget", precision: 16, scale: 2, default: "0.0"
    t.decimal "developmentBudget", precision: 16, scale: 2, default: "0.0"
    t.decimal "recurrentBudget", precision: 16, scale: 2, default: "0.0"
    t.decimal "pendingBills", precision: 16, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_departments_on_county_id"
    t.index ["name", "county_id"], name: "index_departments_on_name_and_county_id", unique: true
  end

  create_table "fiscal_years", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "date_from"
    t.datetime "date_to"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_fiscal_years_on_name", unique: true
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.bigint "revenue_source_id", null: false
    t.bigint "department_id", null: false
    t.string "ward"
    t.string "location"
    t.string "status"
    t.decimal "budgetAmount", precision: 16, scale: 2, default: "0.0"
    t.decimal "spentAmount", precision: 16, scale: 2, default: "0.0"
    t.bigint "fiscal_year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_projects_on_department_id"
    t.index ["fiscal_year_id"], name: "index_projects_on_fiscal_year_id"
    t.index ["revenue_source_id"], name: "index_projects_on_revenue_source_id"
  end

  create_table "revenue_sources", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.boolean "active", default: true
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "county_id"
    t.bigint "department_id"
    t.bigint "user_type_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["county_id"], name: "index_users_on_county_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "county_budgets", "counties"
  add_foreign_key "county_budgets", "fiscal_years"
  add_foreign_key "departments", "counties"
  add_foreign_key "projects", "departments"
  add_foreign_key "projects", "fiscal_years"
  add_foreign_key "projects", "revenue_sources"
  add_foreign_key "users", "counties"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "user_types"
end
