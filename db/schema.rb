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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131211223418) do

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "averageRating"
    t.integer  "averagePrice"
    t.text     "reviews"
    t.string   "cuisine"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "totalReviews"
    t.string   "website"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "twitterHandle"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.string   "user"
    t.string   "business"
    t.datetime "time"
    t.integer  "stars"
    t.integer  "price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "content"
    t.string   "restaurant"
  end

  create_table "users", :force => true do |t|
    t.text     "reviews"
    t.string   "location"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

end
