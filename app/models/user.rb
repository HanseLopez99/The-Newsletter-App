class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  # Associations
  has_many :newsletters
  has_and_belongs_to_many :newsletters

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
end
