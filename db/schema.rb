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

ActiveRecord::Schema.define(:version => 20131216161907) do

  create_table "hunt_properties", :force => true do |t|
    t.integer  "property_id"
    t.string   "status"
    t.integer  "rating"
    t.integer  "hunt_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "hunt_streets", :force => true do |t|
    t.integer  "street_id"
    t.string   "status"
    t.integer  "rating"
    t.integer  "hunt_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hunts", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "properties", :force => true do |t|
    t.string   "source"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "listing_id"
    t.string   "status"
    t.string   "listing_status"
    t.integer  "num_recepts"
    t.integer  "price"
    t.text     "details_url"
    t.text     "image_url"
    t.string   "image_caption"
    t.text     "thumbnail_url"
    t.text     "description"
    t.text     "short_description"
    t.string   "displayable_address"
    t.string   "post_town"
    t.string   "street_name"
    t.string   "county"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "outcode"
    t.string   "property_type"
    t.integer  "num_floors"
    t.integer  "num_bedrooms"
    t.integer  "num_bathrooms"
    t.string   "country"
    t.string   "agent_name"
    t.string   "agent_phone"
    t.string   "agent_address"
    t.text     "agent_logo"
    t.datetime "first_published_date"
    t.datetime "last_published_date"
  end

  create_table "streets", :force => true do |t|
    t.string   "name"
    t.string   "postcode"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "image_capture"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
