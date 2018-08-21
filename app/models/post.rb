class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_many :comments
  has_many :genres
  accepts_nested_attributes_for :genres, reject_if: :all_blank

 #  def post_genres_attributes=(genre_attributes)
 # genre_attributes.values.each do |genre_attribute|
 #     @genre = Genre.find_by(name: genre_attribute)
 #     if @genre == nil
 #       @genre = Genre.create(:name => genre_attribute)
 #       @genre.save
 #       self.update(:post_genre => @genre.name)
 #   else
 #     @genre.save
 #      self.update(:post_genre => @genre.name)
 #        end
 #      end
 #    end

     #check of genre id is empty or not
     # if it wasn't empty , find the genre with that ID, and set that genre to be the post genre's genre.
     # if the genre ID is empty, then they need to create a new genre. Where the second part of the nested form to come in
     # Luisa video on nested forms
     # work on devise docs omniauth
     # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
     # validations




end
