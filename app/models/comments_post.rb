class CommentsPost < ApplicationRecord
  belongs_to :comment , dependent: :destroy
  belongs_to :post , dependent: :destroy
  validates :post_id , presence: true
  validates :comment_id , presence: true

end
