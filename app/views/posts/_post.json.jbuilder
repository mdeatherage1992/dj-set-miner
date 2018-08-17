json.extract! post, :id, :title, :url, :comment, :created_at, :updated_at, :video, :genre, :post_genre
json.url post_url(post, format: :json)
