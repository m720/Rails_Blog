class Tag < ApplicationRecord
    validates :title, presence: ture, uniqueness: true
end
