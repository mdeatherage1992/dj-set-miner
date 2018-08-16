class Category < ActiveRecord::Base
  has_many :post_genresx
  has_many :posts, through: :post_genres
end
