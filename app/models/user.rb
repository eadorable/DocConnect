class User < ApplicationRecord

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Additional fields
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
end
