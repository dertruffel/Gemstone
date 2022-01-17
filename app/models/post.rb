class Post < ApplicationRecord

  #create_table "posts", force: :cascade do |t|
  #     t.string "description"
  #     t.datetime "created_at", precision: 6, null: false
  #     t.datetime "updated_at", precision: 6, null: false
  #     t.integer "user_id"
  #     t.string "image_file_name"
  #     t.string "image_content_type"
  #     t.bigint "image_file_size"
  #     t.datetime "image_updated_at"
  #     t.index ["user_id"], name: "index_posts_on_user_id"
  #   end


  belongs_to :user
  has_attached_file :image,:path => ':rails_root/public/system/abstracts/:attachment/:filename',
                    :url => '/system/abstracts/:attachment/:filename', :style => {:large => "750x750", :medium => "300x300>", :thumb =>"100x100>"}
  validates_attachment_content_type :image, :content_type => %w(image/jpg image/jpeg image/png image/gif image/webp), present:true

end

