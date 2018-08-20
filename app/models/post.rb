class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_many :comments
  has_many :post_genres
  has_many :genres, through: :post_genres
  accepts_nested_attributes_for :post_genres, reject_if: :all_blank

  def post_genres_attributes=(genre_attributes)
    post_genre_attributes.values.each do |genre_attribute|
   if genre_attribute.id == nil
     genre = Genre.find_or_create_by(name: genre_attribute.name)
     self.genres << genre

     #check of genre id is empty or not
     # if it wasn't empty , find the genre with that ID, and set that genre to be the post genre's genre.
     # if the genre ID is empty, then they need to create a new genre. Where the second part of the nested form to come in
     # Luisa video on nested forms
     # work on devise docs omniauth
     # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
     # validations
    end
  end
end




end
