json.extract! post, :id, :title, :url, :comment, :created_at, :updated_at, :video
json.url post_url(post, format: :json)
