class CreatePostGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :post_genres do |t|
      t.integer :post_id
      t.integer :genre_id
      t.timestamps null: false
    end
  end
end
