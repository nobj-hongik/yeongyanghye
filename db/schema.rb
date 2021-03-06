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

ActiveRecord::Schema.define(version: 20180823095727) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answer_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_comments_on_answer_id"
    t.index ["user_id"], name: "index_answer_comments_on_user_id"
  end

  create_table "answer_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_likes_on_answer_id"
    t.index ["user_id"], name: "index_answer_likes_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.integer  "answer_likes_count"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "is_selected"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.date     "eventime"
  end

  create_table "follows", force: :cascade do |t|
    t.string   "followable_type",                 null: false
    t.integer  "followable_id",                   null: false
    t.string   "follower_type",                   null: false
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "free_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "free_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["free_id"], name: "index_free_comments_on_free_id"
    t.index ["user_id"], name: "index_free_comments_on_user_id"
  end

  create_table "freelikes", force: :cascade do |t|
    t.integer  "free_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["free_id"], name: "index_freelikes_on_free_id"
    t.index ["user_id"], name: "index_freelikes_on_user_id"
  end

  create_table "frees", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_frees_on_user_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "magazine_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "magazine_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["magazine_id"], name: "index_magazine_comments_on_magazine_id"
    t.index ["user_id"], name: "index_magazine_comments_on_user_id"
  end

  create_table "magazinelikes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "magazine_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["magazine_id"], name: "index_magazinelikes_on_magazine_id"
    t.index ["user_id"], name: "index_magazinelikes_on_user_id"
  end

  create_table "magazines", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "category"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "is_selected"
    t.integer  "sequence"
    t.index ["user_id"], name: "index_magazines_on_user_id"
  end

  create_table "nutri_tmps", force: :cascade do |t|
    t.string   "howtext"
    t.text     "name"
    t.string   "function"
    t.text     "company"
    t.text     "shape"
    t.text     "howword"
    t.text     "except"
    t.string   "companyinfo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "stdr_stnd"
  end

  create_table "nutritions", force: :cascade do |t|
    t.string   "name"
    t.text     "company"
    t.string   "shape"
    t.text     "function"
    t.text     "except"
    t.string   "image"
    t.text     "howtext"
    t.text     "howword"
    t.string   "companyinfo"
    t.string   "certifi"
    t.string   "contury"
    t.string   "price"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "mfds"
    t.text     "ingredienttext"
    t.index ["user_id"], name: "index_nutritions_on_user_id"
  end

  create_table "question_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_question_comments_on_question_id"
    t.index ["user_id"], name: "index_question_comments_on_user_id"
  end

  create_table "question_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_question_likes_on_question_id"
    t.index ["user_id"], name: "index_question_likes_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "category"
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.integer  "question_likes_count"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "owner_selected"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "refined_entries", force: :cascade do |t|
    t.string   "howtext"
    t.text     "name"
    t.string   "function"
    t.text     "company"
    t.text     "shape"
    t.text     "except"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.string   "stdr_stnd"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name"
    t.string   "age"
    t.string   "image"
    t.string   "gender"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_img"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
