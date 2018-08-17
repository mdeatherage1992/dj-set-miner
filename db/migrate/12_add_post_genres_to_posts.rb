class AddPostGenresToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_genre, :string
  end
end
