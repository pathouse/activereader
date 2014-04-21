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

ActiveRecord::Schema.define(version: 20140421044007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kindle_books", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindle_notes", force: true do |t|
    t.integer  "kindle_book_id"
    t.text     "content"
    t.string   "page_number"
    t.string   "location_info"
    t.datetime "annotated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindle_raw_clippings", force: true do |t|
    t.string   "clipping_file_file_name"
    t.string   "clipping_file_content_type"
    t.integer  "clipping_file_file_size"
    t.datetime "clipping_file_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "evernote_token"
    t.string   "evernote_notebook_name"
    t.integer  "evernote_note_count",    default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
