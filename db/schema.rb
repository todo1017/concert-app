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

ActiveRecord::Schema.define(:version => 20131119024908) do

  create_table "artists", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.decimal  "price"
    t.string   "tech_rider_file_name"
    t.string   "tech_rider_content_type"
    t.integer  "tech_rider_file_size"
    t.datetime "tech_rider_updated_at"
    t.string   "contract_rider_file_name"
    t.string   "contract_rider_content_type"
    t.integer  "contract_rider_file_size"
    t.datetime "contract_rider_updated_at"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "w9_file_name"
    t.string   "w9_content_type"
    t.integer  "w9_file_size"
    t.datetime "w9_updated_at"
    t.string   "resume",                      :limit => 5000
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "email"
  end

  create_table "events", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "provider_id"
    t.string   "provider_type"
    t.string   "performance_date"
    t.datetime "performance_time"
    t.string   "school_name"
    t.string   "school_email"
    t.string   "status"
    t.string   "show_time"
    t.string   "load_time"
    t.string   "time_zone"
    t.string   "load_address"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "hotel_name"
    t.string   "hotel_address"
    t.string   "backup_content"
    t.string   "backup_phone"
    t.boolean  "contract_signed"
    t.boolean  "payment_sent"
    t.boolean  "show_review_complete"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "contract_file_name"
    t.string   "contract_content_type"
    t.integer  "contract_file_size"
    t.datetime "contract_updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name",             :default => ""
    t.string   "last_name",              :default => ""
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
