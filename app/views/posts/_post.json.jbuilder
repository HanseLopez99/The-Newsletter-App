json.extract! post, :id, :description, :likes, :newsletter_id, :created_at, :updated_at
json.url post_url(post, format: :json)
