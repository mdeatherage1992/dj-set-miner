class PostGenre < ActiveRecord::Base
  belongs_to :post
  belongs_to :genre
end
