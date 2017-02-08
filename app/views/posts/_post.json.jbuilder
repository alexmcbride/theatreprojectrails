json.extract! post, :id, :title, :published, :is_approved, :content, :created_at, :updated_at
json.url post_url(post, format: :json)