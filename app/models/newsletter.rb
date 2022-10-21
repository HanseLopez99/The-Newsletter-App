class Newsletter < ApplicationRecord
  self.table_name = 'newsletters'

  # Associations
  belongs_to :user, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_and_belongs_to_many :users

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true
end
