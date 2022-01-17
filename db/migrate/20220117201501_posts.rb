class Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :description
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
      t.integer :user_id
      t.string :image_file_name
      t.string :image_content_type
      t.bigint :image_file_size
      t.datetime :image_updated_at
      t.index ["user_id"], name: "index_posts_on_user_id"
    end
  end
end
