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

ActiveRecord::Schema.define(version: 20160728195526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_downvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comments_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["comments_id"], name: "index_comment_downvotes_on_comments_id", using: :btree
    t.index ["user_id"], name: "index_comment_downvotes_on_user_id", using: :btree
  end

  create_table "comment_upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comments_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["comments_id"], name: "index_comment_upvotes_on_comments_id", using: :btree
    t.index ["user_id"], name: "index_comment_upvotes_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",                                null: false
    t.integer  "comment_upvotes_count",   default: 0
    t.integer  "comment_downvotes_count", default: 0
    t.integer  "link_id"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["link_id"], name: "index_comments_on_link_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "downvotes", force: :cascade do |t|
    t.integer  "link_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_downvotes_on_link_id", using: :btree
    t.index ["user_id"], name: "index_downvotes_on_user_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.string   "title",                       null: false
    t.integer  "upvotes_count",   default: 0
    t.integer  "downvotes_count", default: 0
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_links_on_user_id", using: :btree
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer  "link_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_upvotes_on_link_id", using: :btree
    t.index ["user_id"], name: "index_upvotes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comment_downvotes", "comments", column: "comments_id"
  add_foreign_key "comment_downvotes", "users"
  add_foreign_key "comment_upvotes", "comments", column: "comments_id"
  add_foreign_key "comment_upvotes", "users"
  add_foreign_key "comments", "links"
  add_foreign_key "comments", "users"
  add_foreign_key "downvotes", "links"
  add_foreign_key "downvotes", "users"
  add_foreign_key "links", "users"
  add_foreign_key "upvotes", "links"
  add_foreign_key "upvotes", "users"
end
