class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_many :comments
  has_many :post_genres
  has_many :genres, through: :post_genres
  accepts_nested_attributes_for :genres, reject_if: :all_blank

  def genres_attributes=(genre_attributes)
 genre_attributes.values.each do |genre_attribute|
   if !genre_attribute==nil
     genre = Genre.find_or_create_by(genre_attribute)
     self.genres << genre
    end
  end
end


end
