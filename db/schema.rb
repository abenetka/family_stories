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

ActiveRecord::Schema.define(version: 2019_04_03_214542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "photo_id"
    t.bigint "recipe_id"
    t.bigint "story_id"
    t.index ["photo_id"], name: "index_families_on_photo_id"
    t.index ["recipe_id"], name: "index_families_on_recipe_id"
    t.index ["story_id"], name: "index_families_on_story_id"
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image_url"
    t.string "caption"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "ingredients"
    t.string "instructions"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "author"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  add_foreign_key "families", "photos"
  add_foreign_key "families", "recipes"
  add_foreign_key "families", "stories"
  add_foreign_key "families", "users"
end