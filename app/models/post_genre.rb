class PostGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :post
end
