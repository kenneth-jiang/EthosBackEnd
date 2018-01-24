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

ActiveRecord::Schema.define(version: 20180104111207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clicks", force: :cascade do |t|
    t.string "click_term"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "username"
    t.string "time"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.string "description"
    t.string "url"
    t.string "image_url"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personalities", force: :cascade do |t|
    t.string "personality_data"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reddit", force: :cascade do |t|
    t.string "redditId"
    t.string "title"
    t.string "author"
    t.string "created_utc"
    t.string "num_comments"
    t.string "permalink"
    t.string "subreddit_name_prefixed"
    t.string "subreddit_id"
    t.string "thumbnail"
    t.string "url"
    t.integer "user_id"
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

  create_table "tones", force: :cascade do |t|
    t.string "tone_data"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "birthday"
    t.string "location"
    t.string "gender"
    t.string "interests"
    t.string "about"
    t.string "profile_pic"
    t.string "status"
    t.boolean "private"
    t.string "reddit_access_token"
    t.string "reddit_refresh_token"
    t.string "spotify_access_token"
    t.string "spotify_refresh_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wolfram", force: :cascade do |t|
    t.string "wolfram_data"
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
