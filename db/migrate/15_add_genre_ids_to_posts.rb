class AddGenreIdsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :genre_ids, :integer
    add_index :posts, :genre_ids
  end

end
