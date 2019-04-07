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

ActiveRecord::Schema.define(version: 2019_04_04_180525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string "name"
  end

  create_table "family_members", force: :cascade do |t|
    t.string "name"
    t.bigint "family_id"
    t.index ["family_id"], name: "index_family_members_on_family_id"
  end

  create_table "family_stories", force: :cascade do |t|
  end

  create_table "photos", force: :cascade do |t|
    t.string "image_url"
    t.string "caption"
    t.bigint "family_id"
    t.index ["family_id"], name: "index_photos_on_family_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "ingredients"
    t.string "instructions"
    t.bigint "family_id"
    t.index ["family_id"], name: "index_recipes_on_family_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "author"
    t.bigint "family_id"
    t.index ["family_id"], name: "index_stories_on_family_id"
  end

  create_table "user_families", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "family_id"
    t.index ["family_id"], name: "index_user_families_on_family_id"
    t.index ["user_id"], name: "index_user_families_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  add_foreign_key "family_members", "families"
  add_foreign_key "photos", "families"
  add_foreign_key "recipes", "families"
  add_foreign_key "stories", "families"
  add_foreign_key "user_families", "families"
  add_foreign_key "user_families", "users"
end
