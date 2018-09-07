class PostSerializer < ActiveModel::Serializer
  attributes :id, :title,:description, :comments
end
