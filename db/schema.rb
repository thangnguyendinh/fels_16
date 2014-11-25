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

ActiveRecord::Schema.define(version: 20141119062025) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "remember_digest"
  end

  create_table "users_answers", force: true do |t|
    t.string   "users_answer"
    t.integer  "status",       limit: 1
    t.integer  "user_id"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_answers", ["user_id"], name: "index_users_answers_on_user_id"
  add_index "users_answers", ["word_id"], name: "index_users_answers_on_word_id"

  create_table "word_answers", force: true do |t|
    t.string   "content"
    t.integer  "word_id"
    t.integer  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wordlessions", force: true do |t|
    t.string   "wordanswervietnamese"
    t.string   "wordanswerB"
    t.string   "wordanswerC"
    t.string   "wordanswerD"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wordlessions", ["word_id"], name: "index_wordlessions_on_word_id"

  create_table "words", force: true do |t|
    t.string   "content"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id"

end
