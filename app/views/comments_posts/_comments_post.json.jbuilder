json.extract! comments_post, :id, :comment_id, :post_id, :created_at, :updated_at
json.url comments_post_url(comments_post, format: :json)
