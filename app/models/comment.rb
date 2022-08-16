class Comment < ApplicationRecord
  belongs_to :user , dependent: :destroy
  validates :user_id , presence: true
  validates :title , presence: true
  validates :body , presence: true

end
