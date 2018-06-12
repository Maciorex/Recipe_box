class Recipe < ApplicationRecord
  validates :title, uniqueness: true
  validates :description, presence: true
end
