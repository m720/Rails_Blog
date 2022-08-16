class TagsPost < ApplicationRecord
  belongs_to :post , dependent: :destroy
  belongs_to :tag , dependent: :destroy
  validates :post_id , presence: true
  validates :tag_id , presence: true

end
