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

ActiveRecord::Schema[7.0].define(version: 2023_12_19_080321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "work_account_notification"
    t.boolean "read"
    t.bigint "record_id"
    t.string "record_class"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.string "description"
    t.string "contact_info"
    t.integer "rate"
    t.string "cancellation_reason"
    t.boolean "cancelled_by_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rate_message"
    t.index ["service_id"], name: "index_service_orders_on_service_id"
    t.index ["user_id"], name: "index_service_orders_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "worker_id"
    t.string "title", null: false
    t.string "description", null: false
    t.float "price", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "rejection_reason"
    t.index ["worker_id"], name: "index_services_on_worker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "phone_number", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.date "date_of_birth"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
  end

  create_table "worker_categories", force: :cascade do |t|
    t.bigint "worker_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_worker_categories_on_category_id"
    t.index ["worker_id"], name: "index_worker_categories_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "description", null: false
    t.boolean "looking_for_work"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workers_on_user_id"
  end

  add_foreign_key "worker_categories", "categories"
  add_foreign_key "worker_categories", "workers"
end
