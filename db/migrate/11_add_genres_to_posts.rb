class AddGenresToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :genre, :string
  end
end
