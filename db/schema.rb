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

ActiveRecord::Schema.define(:version => 20150203074717) do

  create_table "answers", :force => true do |t|
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "board_id"
    t.integer  "user_id"
    t.string   "excerpt_image_top_file_name"
    t.string   "excerpt_image_top_content_type"
    t.integer  "excerpt_image_top_file_size"
    t.datetime "excerpt_image_top_updated_at"
    t.string   "excerpt_image_bottom_file_name"
    t.string   "excerpt_image_bottom_content_type"
    t.integer  "excerpt_image_bottom_file_size"
    t.datetime "excerpt_image_bottom_updated_at"
    t.string   "top"
    t.text     "video_iframe_1"
    t.text     "video_iframe_2"
  end

  create_table "boards", :force => true do |t|
    t.string   "name"
    t.integer  "order_number"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "excerpt_image_file_name"
    t.string   "excerpt_image_content_type"
    t.integer  "excerpt_image_file_size"
    t.datetime "excerpt_image_updated_at"
    t.integer  "user_id"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "default_facebooks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "site_type"
    t.string   "url"
    t.string   "site_name"
    t.string   "admins"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
    t.string   "excerpt_image_file_name"
    t.string   "excerpt_image_content_type"
    t.integer  "excerpt_image_file_size"
    t.datetime "excerpt_image_updated_at"
  end

  create_table "facebooks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "site_type"
    t.string   "url"
    t.string   "site_name"
    t.string   "admins"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "email"
    t.boolean  "is_private"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
    t.string   "user_name"
    t.boolean  "is_display", :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "is_admin",               :default => false
    t.string   "user_name"
    t.boolean  "is_super_admin",         :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
