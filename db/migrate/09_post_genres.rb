class CreatePostGenres < ActiveRecord::Migration
  def change
    create_table :post_genres do |t|
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :genrex, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
