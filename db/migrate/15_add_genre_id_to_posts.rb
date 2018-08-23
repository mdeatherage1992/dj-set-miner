class AddGenreIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :genre_id, :integer
    add_index :posts, :genre_id
  end

end
