json.extract! post, :id, :title, :url, :comment, :created_at, :updated_at
json.url post_url(post, format: :json)
