class Video < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :genres
end
