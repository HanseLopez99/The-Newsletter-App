class Newsletter < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :posts
  has_and_belongs_to_many :users

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true
end
