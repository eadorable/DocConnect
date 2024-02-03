class User < ApplicationRecord

  VALID_ROLES = %w[admin user].freeze

  validates :role, inclusion: { in: VALID_ROLES }

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Additional fields
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  has_many :appointments # as doctor
  has_many :patients

  def admin?
    role == 'admin'
  end

end
