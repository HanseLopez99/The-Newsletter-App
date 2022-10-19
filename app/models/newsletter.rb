class Newsletter < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :posts

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true
end
