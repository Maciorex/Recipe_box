class Recipe < ApplicationRecord
  validates :title, uniqueness: true
  validates :description, presence: true
  validate :correct_image
  has_one_attached :image
  has_many :ingredients
  has_many :directions

  accepts_nested_attributes_for :ingredients,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: :all_blank,
                                allow_destroy: true

  private
  def correct_image
    if image.attached? && !image.content_type.in?(%w( image/img image/jpg image/jpeg image/png))
      errors.add(:image, "Incorrect format type")
    elsif !image.attached?
      errors.add(:image, "Image is missing")
    end  
  end
end
