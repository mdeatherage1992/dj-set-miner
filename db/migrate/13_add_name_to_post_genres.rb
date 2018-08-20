class AddNameToPostGenres < ActiveRecord::Migration
  def change
    add_column :post_genres, :name, :string
  end
end
