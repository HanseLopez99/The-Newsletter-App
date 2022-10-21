class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  # Associations
  has_and_belongs_to_many :newsletters, foreign_key: 'user_id', join_table: 'subscriptions', dependent: :destroy
  has_many :newsletters, dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
end
