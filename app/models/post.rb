class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_many :comments
  has_many :post_genres
  has_many :genres, through: :post_genres
end
