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

ActiveRecord::Schema.define(version: 2018_09_11_104555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_photos", force: :cascade do |t|
    t.string "photo"
    t.bigint "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_art_photos_on_artwork_id"
  end

  create_table "artists", force: :cascade do |t|
    t.text "description"
    t.date "birth_date"
    t.date "death_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "year"
    t.string "dimensions"
    t.float "price"
    t.bigint "gallery_id"
    t.bigint "exhibition_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
    t.index ["exhibition_id"], name: "index_artworks_on_exhibition_id"
    t.index ["gallery_id"], name: "index_artworks_on_gallery_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "cover_photo"
    t.bigint "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_id"], name: "index_exhibitions_on_gallery_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "full_address"
    t.string "phone"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address_line"
    t.string "city"
    t.string "country"
    t.string "photo"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "join_art_categories", force: :cascade do |t|
    t.bigint "artwork_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_join_art_categories_on_artwork_id"
    t.index ["category_id"], name: "index_join_art_categories_on_category_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "art_photos", "artworks"
  add_foreign_key "artists", "users"
  add_foreign_key "artworks", "artists"
  add_foreign_key "artworks", "exhibitions"
  add_foreign_key "artworks", "galleries"
  add_foreign_key "exhibitions", "galleries"
  add_foreign_key "galleries", "users"
  add_foreign_key "join_art_categories", "artworks"
  add_foreign_key "join_art_categories", "categories"
end
