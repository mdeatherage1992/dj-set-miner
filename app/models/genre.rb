class Genre < ActiveRecord::Base
  has_many :post_genres
  has_many :posts, through: :post_genres
end
