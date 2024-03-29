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

ActiveRecord::Schema.define(version: 20150729200321) do

  create_table "analytics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "celebs", force: :cascade do |t|
    t.string   "name"
    t.string   "hashtag"
    t.string   "playlist"
    t.integer  "view",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "clips", force: :cascade do |t|
    t.integer  "source"
    t.integer  "video_id"
    t.string   "source_id"
    t.integer  "view",       default: 0
    t.boolean  "not_video",  default: false
    t.integer  "like",       default: 0
    t.integer  "comment",    default: 0
    t.integer  "retweet",    default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "clips", ["source_id"], name: "index_clips_on_source_id", unique: true

  create_table "fbtokens", force: :cascade do |t|
    t.string   "token"
    t.string   "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fbvideos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snapcelebs", force: :cascade do |t|
    t.integer  "snap_id"
    t.integer  "celeb_id"
    t.integer  "view"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snapclips", force: :cascade do |t|
    t.integer  "snap_id"
    t.integer  "clip_id"
    t.integer  "view"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snaps", force: :cascade do |t|
    t.integer  "view"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snapvideos", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "snap_id"
    t.integer  "view"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timings", force: :cascade do |t|
    t.integer  "snap_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tubes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.integer  "celeb_id"
    t.string   "title"
    t.text     "description"
    t.integer  "view",                   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "watches", force: :cascade do |t|
    t.integer  "timing_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ytokens", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
