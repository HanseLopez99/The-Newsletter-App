json.extract! newsletter, :id, :name, :user_id, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)
