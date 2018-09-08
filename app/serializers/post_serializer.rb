class PostSerializer < ActiveModel::Serializer
  attributes :id, :title,:description,:user, :comments, :video, :genres,:audience, :url
has_many :comments
belongs_to :user
end
