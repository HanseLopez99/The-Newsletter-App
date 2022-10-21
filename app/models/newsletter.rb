class Newsletter < ApplicationRecord
  self.table_name = 'newsletters'

  # Associations
  belongs_to :user
  has_many :posts, foreign_key: 'newsletter_id', dependent: :destroy
  has_many :subscriptions, foreign_key: 'newsletter_id', dependent: :destroy
  has_and_belongs_to_many :users, foreign_key: 'newsletter_id', join_table: 'subscriptions', dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true
end
