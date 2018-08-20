class PostGenre < ActiveRecord::Base
  belongs_to :post
  belongs_to :genre
  accepts_nested_attributes_for :genre

  #validates /// presence_of 
end
