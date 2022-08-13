json.extract! comment, :id, :author_id, :title, :body, :post, :references, :created_at, :updated_at
json.url comment_url(comment, format: :json)
