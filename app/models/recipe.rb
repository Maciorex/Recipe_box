class Recipe < ApplicationRecord
  has_one_attached :image
  validates :title, uniqueness: true
  validates :description, presence: true
end
