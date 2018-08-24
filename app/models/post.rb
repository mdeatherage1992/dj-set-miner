class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_many :comments
  has_many :genres
  accepts_nested_attributes_for :genres, reject_if: :all_blank
  validates :title, :url, presence: true

  def genres_attributes=(genre_attributes)
  genre_attributes.values.each do |genre_attribute|
    if genre_attribute
      genre = Genre.find_or_create_by(genre_attribute)
      self.genres << genre
    end
  end
end

def self.by_genre(genre_id)
filtered_posts = []

Post.all.each do |post|
  if post.genre_ids.include?(genre_id)
    filtered_posts << post
  end
end

filtered_posts
end




     #check of genre id is empty or not
     # if it wasn't empty , find the genre with that ID, and set that genre to be the post genre's genre.
     # if the genre ID is empty, then they need to create a new genre. Where the second part of the nested form to come in
     # Luisa video on nested forms
     # work on devise docs omniauth
     # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
     # validations




end
