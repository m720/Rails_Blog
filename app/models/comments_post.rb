class CommentsPost < ApplicationRecord
  belongs_to :comment
  belongs_to :post
  validates :post_id , presence: true
  validates :comment_id , presence: true

end
