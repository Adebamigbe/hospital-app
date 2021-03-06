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

ActiveRecord::Schema.define(:version => 20131210150736) do

  create_table "hospital_suggestions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.boolean  "active",      :default => true
    t.string   "status",      :default => "Pending"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "hospital_suggestions_specialisations", :id => false, :force => true do |t|
    t.integer "hospital_suggestion_id"
    t.integer "specialisation_id"
  end

  create_table "hospitals", :force => true do |t|
    t.string   "api_id"
    t.string   "name"
    t.string   "address"
    t.string   "telephone"
    t.text     "description"
    t.string   "website_url"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "hospitals_specialisations", :id => false, :force => true do |t|
    t.integer "hospital_id"
    t.integer "specialisation_id"
  end

  create_table "search_specialisations", :id => false, :force => true do |t|
    t.integer "search_id"
    t.integer "specialisation_id"
  end

  create_table "searches", :force => true do |t|
    t.string   "lat"
    t.string   "lng"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specialisation_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specialisations", :force => true do |t|
    t.integer  "specialisation_category_id"
    t.string   "name"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.date     "dob"
    t.string   "role",            :default => "normal"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
