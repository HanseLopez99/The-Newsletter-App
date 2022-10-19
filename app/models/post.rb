class Post < ApplicationRecord
  # Associations
  belongs_to :newsletter

  # Validations
  validates :description, presence: true, length: { maximum: 1000 }
  validates :likes, presence: true, numericality: { only_integer: true }
  validates :newsletter_id, presence: true
end
