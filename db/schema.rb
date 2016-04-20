# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160420011228) do

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "task_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "migrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_users", force: :cascade do |t|
    t.integer  "task_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "task_users", ["task_id"], name: "index_task_users_on_task_id", using: :btree
  add_index "task_users", ["user_id"], name: "index_task_users_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "deadline"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tasks_users", force: :cascade do |t|
    t.integer "task_id", limit: 4
    t.integer "user_id", limit: 4
  end

  add_index "tasks_users", ["task_id"], name: "index_tasks_users_on_task_id", using: :btree
  add_index "tasks_users", ["user_id"], name: "index_tasks_users_on_user_id", using: :btree

  create_table "user_tasks", force: :cascade do |t|
    t.string   "users_tasks", limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "task_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "task_users", "tasks"
  add_foreign_key "task_users", "users"
  add_foreign_key "tasks_users", "tasks"
  add_foreign_key "tasks_users", "users"
end
