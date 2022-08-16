class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user_id , presence: true
  validates :body , presence: true
  validates :title , presence: true


end
