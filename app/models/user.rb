class User < ApplicationRecord
  #create_table "users", force: :cascade do |t|
  #     t.string "email", default: "", null: false
  #     t.string "encrypted_password", default: "", null: false
  #     t.string "reset_password_token"
  #     t.datetime "reset_password_sent_at"
  #     t.datetime "remember_created_at"
  #     t.datetime "created_at", precision: 6, null: false
  #     t.datetime "updated_at", precision: 6, null: false
  #     t.integer "sign_in_count", default: 0, null: false
  #     t.datetime "current_sign_in_at"
  #     t.datetime "last_sign_in_at"
  #     t.string "current_sign_in_ip"
  #     t.string "last_sign_in_ip"
  #     t.index ["email"], name: "index_users_on_email", unique: true
  #     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  #     t.boolean "isadmin", default: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :posts
end

