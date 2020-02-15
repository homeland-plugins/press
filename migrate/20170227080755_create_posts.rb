class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :body, null: false
      t.string :summary, limit: 5000
      t.string :banner
      t.integer :user_id
      t.integer :likes_count, null: false, default: 0
      t.integer :comments_count, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :published_at, null: false

      t.timestamps
    end

    add_index :posts, :slug
    add_index :posts, :status
    add_index :posts, :published_at
    add_index :posts, :user_id
  end
end
