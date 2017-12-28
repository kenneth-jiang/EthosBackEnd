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

ActiveRecord::Schema.define(version: 20171227144438) do

  create_table "clicks", force: :cascade do |t|
    t.string "click_term"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faroo", force: :cascade do |t|
    t.string "title"
    t.string "kwic"
    t.string "content"
    t.string "url"
    t.string "image_url"
    t.string "author"
    t.integer "votes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.string "description"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personalities", force: :cascade do |t|
    t.string "openness"
    t.string "conscientiousness"
    t.string "extraversion"
    t.string "agreeableness"
    t.string "neuroticism"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reddit", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: :cascade do |t|
    t.string "search_term"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: :cascade do |t|
    t.string "sourceid"
    t.string "name"
    t.string "description"
    t.string "url"
    t.string "category"
    t.string "country"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spotify", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "genre"
    t.integer "popularity"
    t.string "image_url"
    t.string "uri"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.string "profile_pic"
    t.string "status"
    t.string "biography"
    t.string "interests"
    t.boolean "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wolfram", force: :cascade do |t|
    t.string "result_id"
    t.string "titles"
    t.string "image_urls"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "youtube", force: :cascade do |t|
    t.string "videoId"
    t.string "channelId"
    t.string "title"
    t.string "description"
    t.string "image_url"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
