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

ActiveRecord::Schema.define(version: 20181011132446) do

  create_table "logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.date     "dove_on"
    t.time     "dove_in_at"
    t.time     "dove_out_at"
    t.float    "depth_ave",     limit: 24
    t.float    "depth_max",     limit: 24
    t.string   "location"
    t.string   "creature"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "sequential_id"
    t.time     "dove_time"
    t.index ["user_id"], name: "index_logs_on_user_id", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "log_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_id"], name: "index_members_on_log_id", using: :btree
    t.index ["user_id", "log_id"], name: "index_members_on_user_id_and_log_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "speaker_id"
    t.integer  "receiver_id"
    t.integer  "log_id"
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["log_id"], name: "index_messages_on_log_id", using: :btree
    t.index ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
    t.index ["speaker_id", "receiver_id", "log_id"], name: "index_messages_on_speaker_id_and_receiver_id_and_log_id", unique: true, using: :btree
    t.index ["speaker_id"], name: "index_messages_on_speaker_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_relationships_on_friend_id", using: :btree
    t.index ["user_id", "friend_id"], name: "index_relationships_on_user_id_and_friend_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_relationships_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
  end

  add_foreign_key "logs", "users"
  add_foreign_key "members", "logs"
  add_foreign_key "members", "users"
  add_foreign_key "messages", "logs"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "speaker_id"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "friend_id"
end
