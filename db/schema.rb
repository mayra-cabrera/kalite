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

ActiveRecord::Schema.define(:version => 20120529154406) do

  create_table "administrators", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                      :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "first_name",             :limit => 50,                 :null => false
    t.string   "last_name",              :limit => 50,                 :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "administrators", ["email"], :name => "index_administrators_on_email", :unique => true
  add_index "administrators", ["first_name"], :name => "index_administrators_on_first_name"
  add_index "administrators", ["last_name"], :name => "index_administrators_on_last_name"
  add_index "administrators", ["reset_password_token"], :name => "index_administrators_on_reset_password_token", :unique => true

  create_table "assignments", :force => true do |t|
    t.integer  "attribute_id",   :null => false
    t.integer  "diagram_id",     :null => false
    t.float    "weight"
    t.integer  "system_type_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "attachments", :force => true do |t|
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.integer  "formal_technical_review_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "attributes", :force => true do |t|
    t.string   "name",       :limit => 20, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "concepts", :force => true do |t|
    t.text     "description",  :null => false
    t.string   "folio",        :null => false
    t.boolean  "is_automatic", :null => false
    t.integer  "attribute_id", :null => false
    t.integer  "section_id",   :null => false
    t.integer  "diagram_id",   :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "diagrams", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.string   "folio",                    :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "formal_technical_reviews", :force => true do |t|
    t.integer  "administrator_id", :null => false
    t.integer  "programmer_id",    :null => false
    t.integer  "subsystem_id",     :null => false
    t.integer  "diagram_id",       :null => false
    t.decimal  "result"
    t.integer  "score_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "programmers", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                      :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "first_name",             :limit => 50,                 :null => false
    t.string   "last_name",              :limit => 50,                 :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "programmers", ["email"], :name => "index_programmers_on_email", :unique => true
  add_index "programmers", ["first_name"], :name => "index_programmers_on_first_name"
  add_index "programmers", ["last_name"], :name => "index_programmers_on_last_name"
  add_index "programmers", ["reset_password_token"], :name => "index_programmers_on_reset_password_token", :unique => true

  create_table "rtf_attributes", :force => true do |t|
    t.integer  "attribute_id", :null => false
    t.integer  "rtf_id",       :null => false
    t.float    "weight",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rtf_concepts", :force => true do |t|
    t.integer  "rtf_id",     :null => false
    t.integer  "concept_id", :null => false
    t.float    "weight"
    t.integer  "grade"
    t.float    "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rtf_domains", :force => true do |t|
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.integer  "formal_technical_review_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "rtf_use_cases", :force => true do |t|
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.integer  "formal_technical_review_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "scores", :force => true do |t|
    t.string   "description", :null => false
    t.float    "start",       :null => false
    t.float    "end",         :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "diagram_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subsystems", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.integer  "system_id",   :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "system_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "systems", :force => true do |t|
    t.string   "name",           :null => false
    t.text     "description",    :null => false
    t.integer  "system_type_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
