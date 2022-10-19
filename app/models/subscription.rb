class Subscription < ApplicationRecord
  # Associations
  belongs_to :newsletter
  belongs_to :user

  # Validations
  validates :newsletter_id, presence: true
  validates :user_id, presence: true
end
