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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150706062535) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "duration",           limit: 255
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.date     "date"
    t.string   "category",           limit: 255
    t.text     "description",        limit: 65535
    t.integer  "admin_id",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "university",  limit: 255
    t.string   "duration",    limit: 255
    t.string   "url",         limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "company",     limit: 255
    t.string   "duration",    limit: 255
    t.string   "url",         limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "intros", force: :cascade do |t|
    t.string   "title",                  limit: 255
    t.text     "description",            limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "image_file_name",        limit: 255
    t.string   "image_content_type",     limit: 255
    t.integer  "image_file_size",        limit: 4
    t.datetime "image_updated_at"
    t.string   "signature_file_name",    limit: 255
    t.string   "signature_content_type", limit: 255
    t.integer  "signature_file_size",    limit: 4
    t.datetime "signature_updated_at"
    t.integer  "admin_id",               limit: 4
  end

  add_index "intros", ["admin_id"], name: "index_intros_on_admin_id", using: :btree
  add_index "intros", ["title"], name: "index_intros_on_title", using: :btree

  create_table "portfolios", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.date     "date"
    t.string   "client",             limit: 255
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "sub_title",          limit: 255
    t.integer  "admin_id",           limit: 4
  end

  add_index "portfolios", ["admin_id"], name: "index_portfolios_on_admin_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "big_title",         limit: 255
    t.string   "date",              limit: 255
    t.string   "place",             limit: 255
    t.string   "address",           limit: 255
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.integer  "admin_id",          limit: 4
  end

  add_index "resumes", ["admin_id"], name: "index_resumes_on_admin_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "tilte",             limit: 255
    t.text     "description",       limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.integer  "admin_id",          limit: 4
  end

  add_index "services", ["admin_id"], name: "index_services_on_admin_id", using: :btree

  create_table "technologies", force: :cascade do |t|
    t.string   "skill",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "technologies", ["user_id"], name: "index_technologies_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
