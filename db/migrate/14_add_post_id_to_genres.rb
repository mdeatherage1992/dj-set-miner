class AddPostIdToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :post_id, :string
    add_index :genres, :post_id
  end

end
