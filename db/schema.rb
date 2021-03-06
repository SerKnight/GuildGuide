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

ActiveRecord::Schema.define(version: 20180629163642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "journeys", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_templates", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "send_at"
    t.boolean "sent"
    t.string "from"
    t.string "to"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sentiments", force: :cascade do |t|
    t.float "quantitative"
    t.text "qualatative"
    t.bigint "user_id"
    t.bigint "message_id"
    t.bigint "journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_sentiments_on_journey_id"
    t.index ["message_id"], name: "index_sentiments_on_message_id"
    t.index ["user_id"], name: "index_sentiments_on_user_id"
  end

  create_table "user_journeys", force: :cascade do |t|
    t.integer "user_id"
    t.integer "journey_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "guild_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.boolean "opted_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "sentiments", "journeys"
  add_foreign_key "sentiments", "messages"
  add_foreign_key "sentiments", "users"
end
