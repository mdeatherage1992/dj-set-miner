class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_many :comments
  has_many :post_genres
  has_many :genres, through: :post_genres
  accepts_nested_attributes_for :post_genres, reject_if: :all_blank








  def post_genres_attributes=(genre)
    binding.pry
    self.genre = Genre.find_or_create_by(name: genre)
    self.genre.update(genre)
  end

     #check of genre id is empty or not
     # if it wasn't empty , find the genre with that ID, and set that genre to be the post genre's genre.
     # if the genre ID is empty, then they need to create a new genre. Where the second part of the nested form to come in
     # Luisa video on nested forms
     # work on devise docs omniauth
     # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
     # validations




end
