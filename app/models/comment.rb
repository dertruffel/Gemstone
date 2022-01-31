class Comment < ApplicationRecord

  #create_table "comments", force: :cascade do |t|
  #     t.text "content"
  #     t.integer "post_id"
  #     t.integer "parent_id"
  #     t.datetime "created_at", precision: 6, null: false
  #     t.datetime "updated_at", precision: 6, null: false
  #     t.integer "user_id"
  #   end
  #
  belongs_to :post
  belongs_to :user
  validates :content, presence: true
  acts_as_voteable
end
